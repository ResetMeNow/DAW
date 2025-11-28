Aquí lo tienes:

# ✅ **GUION DEFINITIVO DEL EXAMEN (1.1.3 + PHP-FPM) — 100% COMPLETO, 100% DEBIAN, 100% OPERATIVO**

Formato Markdown listo para tu GitHub.
Este es **EL guion bueno**, el que debes estudiar, memorizar y entrenar.
Incluye **todos los pasos reales del examen**, **todos los comandos**, **toda la configuración**, **toda la lógica**, **SSH**, **FileZilla**, **PHP-FPM**, **Nginx**, **entrega final**, **casos de error** y **pruebas**.

---

# # 🎓 GUION DEFINITIVO EXAMEN — DESPLIEGUE DAW

*(Punto 1.1.3 + Punto 2)*

---

# 🟣 0. Conectarse a la VM desde la terminal del PC (inicio del examen)

El examen **no se hace directamente en el PC**, sino en la **VM**,
pero **accedes a la VM desde la terminal del PC del aula**:

```bash
ssh alumno@IP_DE_LA_VM
```

Ejemplo:

```bash
ssh alumno@10.108.99.100
```

⚠️ Todo lo que hagas a partir de ahora es **dentro de la VM**.

---

# 🟩 1. Crear las carpetas de la práctica

```bash
sudo mkdir -p /var/www/primero
sudo mkdir -p /var/www/agenda/imagenesjpg
sudo mkdir -p /var/www/agenda/secreto/interno
sudo mkdir -p /var/www/agenda/internos
sudo mkdir -p /var/www/agenda/img
sudo chown -R www-data:www-data /var/www
sudo chmod -R 755 /var/www
```

---

# 🟩 2. Crear archivos HTML, PHP y “falsas” imágenes

## 🔹 Primer sitio (`/var/www/primero`)

```bash
sudo nano /var/www/primero/primero.html
sudo nano /var/www/primero/subprimero.html
```

## 🔹 Segundo sitio (`/var/www/agenda`)

```bash
sudo nano /var/www/agenda/index.dpl
sudo nano /var/www/agenda/index.html
sudo nano /var/www/agenda/secreto/secreto.html
sudo nano /var/www/agenda/secreto/interno/secreto.html
sudo nano /var/www/agenda/internos/p404.html
```

## 🔹 PHP info

```bash
sudo nano /var/www/agenda/info.php
```

Contenido:

```php
<?php phpinfo(); ?>
```

## 🔹 Imágenes falsas

```bash
sudo touch /var/www/agenda/imagenesjpg/foto1.jpg
sudo touch /var/www/agenda/imagenesjpg/foto2.jpeg
sudo touch /var/www/agenda/img/foto.img
```

---

# 🟩 3. Crear archivo de configuración Nginx (multisite)

```bash
sudo nano /etc/nginx/sites-available/multisite
```

Pega este contenido (versión definitiva y memorizable):

```nginx
server {
    listen 80 default_server;
    server_name _;
    root /var/www/primero;
    index subprimero.html;

    location = / { index primero.html; }

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
    types { text/html dpl; image/png img; }

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

Guardar:
**CTRL + O → ENTER → CTRL + X**

---

# 🟩 4. Activar el multisite

```bash
sudo ln -s /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/
```

---

# 🟩 5. Comprobar y reiniciar Nginx

```bash
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx
```

Si da error → corregir línea → repetir.

---

# 🟩 6. Instalar y configurar PHP-FPM (punto 2)

```bash
sudo apt update
sudo apt install -y php-fpm
```

Editar el pool:

```bash
sudo nano /etc/php/*/fpm/pool.d/www.conf
```

Buscar:

```
listen =
```

Cambiar a:

```
listen = /run/php/php-fpm.sock
```

Reiniciar:

```bash
sudo systemctl restart php*-fpm
sudo systemctl status php*-fpm
```

---

# 🟩 7. Probar PHP

### ✔ Desde navegador del PC:

```
http://IP_VM/info.php
```

o

```
http://www.miagenda.com/info.php
```

### ✔ Desde la VM:

```bash
curl http://localhost/info.php
```

---

# 🟩 8. Probar toda la configuración en el navegador del PC

Edita hosts en el PC del aula:

```bash
sudo nano /etc/hosts
```

Añade:

```
IP_VM   www.miagenda.com
```

Prueba en navegador:

* `http://IP_VM/`
* `http://www.miagenda.com/`
* `http://www.miagenda.com/secreto`
* `http://www.miagenda.com/noexiste`
* `http://www.miagenda.com/info.php`

---

# 🟩 9. Logs si algo falla

```bash
sudo tail -n 50 /var/log/nginx/error.log
sudo tail -n 50 /var/log/nginx/access.log
```

---

# 🟩 10. FINAL DEL EXAMEN — descargar los archivos desde la VM con FileZilla

### Abrir FileZilla en el PC del aula:

Conectar:

* **Host:** `sftp://IP_VM`
* **Usuario:** alumno
* **Contraseña:** la de la VM
* **Puerto:** 22

En el panel derecho navegar y **descargar** estas rutas:

* `/var/www/agenda/`
* `/var/www/primero/`
* `/etc/nginx/sites-available/multisite`

Arrastra al panel izquierdo (tu PC).

---

# 🟩 11. Subir la entrega al servidor del profesor (último paso)

El profesor te dará:

* IP
* usuario
* contraseña
* carpeta con tu nombre

En FileZilla cambia conexión:

* Conecta al servidor del profesor
* Entra en tu carpeta
* Arrastra desde tu PC → servidor del profe:

  * carpeta `agenda/`
  * carpeta `primero/`
  * archivo `multisite`

---

## 🟧 SECCIÓN EXTRA (Puede caer en examen)
**🔥 ¿Por qué se descarga un archivo PHP? ¿Cómo provocarlo / evitarlo?** 

Se descarga cuando nginx no pasa el .php a PHP-FPM. 
Ocurre si falta: 

```
location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php-fpm.sock;
}
```

> Para demostrarlo (si el profe pide “haz que el php se descargue”):
→ Comentar ese bloque y reiniciar nginx.

> Para arreglarlo:
→ Añadir el bloque php y verificar que php-fpm está activo.


## 🟧 ERRORS TÍPICOS DE NGINX
``sudo nginx -t # Comprueba errores de sintaxis `` 

``sudo tail -n 50 /var/log/nginx/error.log``


Muy útil si te equivocas con llaves {}, rutas o nombres.

## 🟧 Probar PHP desde consola
``curl http://localhost/info.php``

---
# 🟣 FIN DEL GUION

