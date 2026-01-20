# Simulador **exacto** — nginx multisite + nginx + PHP-FPM

> Reglas: usa **nano** para editar archivos (HTML/DPL/PHP) y **touch** solo para imágenes. Todo en **Debian**. Sigue el orden.



## 0 — Conexión inicial (inicio del examen)

En el PC del aula (terminal) conéctate a la VM:

```bash
ssh alumno@IP_VM
```

Desde ahora TODO se hace **en la VM**.

---

## 1 — Crear estructura de carpetas (tal como pide la actividad)

```bash
sudo mkdir -p /var/www/primero/imagenesjpg
sudo mkdir -p /var/www/agenda/imagenesjpg
sudo mkdir -p /var/www/agenda/secreto/interno
sudo mkdir -p /var/www/agenda/internos
sudo chown -R www-data:www-data /var/www
sudo chmod -R 755 /var/www
```

(`-p` para crear padres si no existen; permisos 755 para evitar `403`. Esto es lo que recomienda el PDF.) 

---

## 2 — Crear archivos con contenido mínimo (nano) — **importante**: index.dpl y demás **sí deben existir**

Usa `sudo nano <ruta>` y guarda con `Ctrl+O` → `Enter` → `Ctrl+X`.

### Primer sitio `/var/www/primero`

```bash
sudo nano /var/www/primero/primero.html
# contenido mínimo:
<h1>Primero</h1>

sudo nano /var/www/primero/subprimero.html
# contenido:
<h1>SubPrimero</h1>
```

### Segundo sitio `/var/www/agenda`

```bash
sudo nano /var/www/agenda/index.dpl
# contenido:
<h1>Index DPL</h1>

sudo nano /var/www/agenda/index.html
# contenido:
<h1>Index HTML</h1>

sudo nano /var/www/agenda/secreto/secreto.html
# contenido:
<h1>Secreto público</h1>

sudo nano /var/www/agenda/secreto/interno/secreto.html
# contenido:
<h1>Secreto interno</h1>

sudo nano /var/www/agenda/internos/p404.html
# contenido:
<h1>404 personalizado</h1>

sudo nano /var/www/agenda/info.php
# contenido:
<?php phpinfo(); ?>
```

> Nota: el PDF sugiere copiar `index.dpl` como base para `secreto` y `secreto/interno` si quieres diferenciar contenido; aquí te damos texto simple para controlar qué aparece en cada URL. 

---

## 3 — Crear “imágenes” (touch)

```bash
sudo touch /var/www/agenda/imagenesjpg/foto1.jpg
sudo touch /var/www/agenda/imagenesjpg/foto2.jpeg
sudo mkdir -p /var/www/agenda/img
sudo touch /var/www/agenda/img/foto.img   # fichero con extensión .img (será tratado como png via types)
sudo chown -R www-data:www-data /var/www/agenda
```

El PDF pide que exista una imagen con extensión `img` (simulando png) y que configures MIME para que se sirva como `image/png`. 

---

## 4 — Archivo nginx único `multisite` (cópialo **tal cual**)

```bash
sudo nano /etc/nginx/sites-available/multisite
```

Pega exactamente (este bloque sigue el enunciado del PDF):

```nginx
server {
    listen 80 default_server;
    server_name _;
    root /var/www/primero;
    index subprimero.html;

    location = / {
        index primero.html;
    }

    location ~* /([[:alnum:]]+)\.(jpe?g)$ {
        try_files /imagenesjpg/$1.$2 =404;
    }
}

server {
    listen 80;
    server_name www.miagenda.com;
    root /var/www/agenda;
    index index.dpl index.html;

    include mime.types;
    types {
        text/html dpl;
        image/png img;
    }

    location ~* /([[:alnum:]]+)\.(jpe?g)$ {
        try_files /imagenesjpg/$1.$2 =404;
    }

    location /secreto {
        index secreto.html;
        try_files $uri/interno/ $uri/ $uri =404;
    }

    error_page 404 /internos/p404.html;
    location /internos { internal; }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
}
```

> Este `types { text/html dpl; image/png img; }` asegura que `.dpl` se envie como `text/html` y `.img` como `image/png` (lo pide el PDF). 

Guardar y salir.

---

## 5 — Activar el sitio y reiniciar nginx

```bash
sudo ln -sf /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/multisite
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx   # si hay fallo, leer error
```

Si `nginx -t` da error, corrige la línea indicada por el mensaje (el PDF subraya que nginx muestra la línea y archivo con error). 

---

## 6 — Instalar y configurar PHP-FPM (tal como pide Punto 2)

```bash
sudo apt update
sudo apt install -y php-fpm
```

Editar el pool (ruta suya variable según versión):

```bash
sudo nano /etc/php/*/fpm/pool.d/www.conf
# Busca la línea "listen =" y pon:
listen = /run/php/php-fpm.sock
```

Reinicia php-fpm (nota: usar el glob `php*-fpm` es práctico):

```bash
sudo systemctl restart php*-fpm
sudo systemctl status php*-fpm
# Reiniciar nginx también:
sudo systemctl restart nginx
```

> El PDF explica alternativas: `fastcgi_pass localhost:9000;` (comunicación por TCP) o `fastcgi_pass unix:/run/php/php-fpm.sock;` (socket unix). Para examen usa **socket unix** `/run/php/php-fpm.sock` como en la configuración anterior. 

---

## 7 — Probar PHP desde la VM (comprobación rápida)

```bash
curl -I http://localhost/info.php    # ver cabeceras
curl http://localhost/info.php | head -n 20  # ver parte del output
ls -l /run/php/                         # ver socket
ss -putnl | egrep 'nginx|php'           # ver servicios y puertos/sockets
sudo tail -n 50 /var/log/nginx/error.log
```

Si ves `502 Bad Gateway` → php-fpm no está corriendo o socket diferente (comprobar `ls -l /run/php/`). 

---

## 8 — Probar desde el PC del aula (editar `/etc/hosts` en el **PC**, NO en la VM)

En el PC del aula (Linux) abre:

```bash
sudo nano /etc/hosts
```

Añade (ejemplo real):

```
127.0.0.1   localhost
127.0.1.1   pc-aula
10.108.99.100   www.miagenda.com
```

(Sustituye `10.108.99.100` por la IP real de la VM que te den.) El PDF muestra exactamente este ejemplo. 

Luego en el navegador del PC prueba:

* `http://IP_VM/` → servidor default (`/var/www/primero/primero.html` o `subprimero.html` según `index`)
* `http://www.miagenda.com/` → `/var/www/agenda/index.dpl` (si existe)
* `http://www.miagenda.com/secreto` → **debe** servir `/secreto/interno/secreto.html` (por `try_files $uri/interno/ $uri/ $uri =404;`)
* `http://www.miagenda.com/noexiste` → debe devolver la 404 personalizada (`/internos/p404.html`) pero el recurso `/internos/p404.html` **no** debe ser accesible directamente (es `internal`). 
* `http://www.miagenda.com/info.php` → debe mostrar `phpinfo()` (si php-fpm configurado y bloque `.php` activo).

---

## 9 — Forzar que **PHP se descargue** (si el profesor lo pide): comentar bloque `.php`

Editar `/etc/nginx/sites-available/multisite` y comentar (o temporariamente eliminar) el bloque:

```nginx
# location ~ \.php$ {
#     include snippets/fastcgi-php.conf;
#     fastcgi_pass unix:/run/php/php-fpm.sock;
# }
```

```bash
sudo nginx -t
sudo systemctl restart nginx
```

Ahora `info.php` se descargará (porque nginx servirá el fichero como `application/octet-stream` o según mime), tal como explica la actividad resuelta del PDF. Para arreglarlo, restaura el bloque y reinicia php-fpm + nginx. 

---

## 10 — Logs y comprobaciones (útiles si falla algo)

```bash
sudo nginx -t
sudo systemctl status nginx
sudo systemctl status php*-fpm
sudo tail -n 100 /var/log/nginx/error.log
sudo tail -n 100 /var/log/nginx/access.log
ls -l /run/php/
```

El PDF recalca que `nginx -t` y los logs son tus primeros aliados para corregir errores de configuración. 

---

## 11 — Entrega (FileZilla) — pasos mínimos para descargar/entregar

En el **PC** del aula abre FileZilla y conéctate por SFTP a la VM:

* Host: `sftp://IP_VM`
* Puerto: `22`
* Usuario: `alumno`
* Contraseña: (la de la VM)

Descarga (panel derecho = VM → panel izquierdo = PC):

* `/var/www/agenda/`  → arrastra al PC
* `/var/www/primero/` → arrastra al PC
* `/etc/nginx/sites-available/multisite` → arrastra al PC

Luego conéctate al servidor del profesor (credenciales que te dé él) y subes esas carpetas/archivo a tu carpeta con tu nombre (tal y como el profe explicó). 

---

## 12 — Notas finales (resumen rápido para memorizar)

* `index index.dpl index.html` en el server `www.miagenda.com` — **dpl primero**. 
* Añadir `types { text/html dpl; image/png img; }` dentro del server evita tocar global `/etc/nginx/mime.types`. 
* `try_files /imagenesjpg/$1.$2 =404;` para servir jpg desde `/imagenesjpg`. 
* `/secreto` → `try_files $uri/interno/ $uri/ $uri =404;` para forzar que `/secreto` apunte a `/secreto/interno/secreto.html`. 
* PHP: usa **php-fpm** y `fastcgi_pass unix:/run/php/php-fpm.sock;` (socket unix). Alternativa: `fastcgi_pass 127.0.0.1:9000;` si usan TCP. 
