Perfecto — voy a crearte **un examen completo (simulado) que cubre exactamente 1.1.3 + Punto 2 del PDF**, y te daré **las respuestas paso a paso**: todos los comandos que debes ejecutar en la VM Debian, el contenido exacto de los archivos de configuración que debes crear, qué subir con FileZilla, cómo probar, y cómo solucionar los fallos más típicos. Todo en **orden** — copia/pega directo a tu repo o a la terminal.

Este contenido está basado en el PDF que me diste (UT2 — Configuración de Servidores). 

---

# Examen simulado (completo) — 1.1.3 + Punto 2

> Objetivo del examen: montar 2 sitios con nginx (uno por defecto y otro para `www.miagenda.com`), reglas MIME/imagenes, `/secreto` + `internal` + 404 personalizado, y dejar funcionando PHP mediante PHP-FPM (socket UNIX).
> Trabaja en la VM Debian. Sigue cada paso **en orden**.

---

## Resumen rápido de lo que harás (checklist)

1. Conectarte a la VM (terminal / SSH).
2. Crear carpetas web y permisos.
3. Crear archivos de prueba (index, subprimero, imagen, secretos, p404, info.php).
4. Crear el archivo de configuración `multisite` en `/etc/nginx/sites-available/` con **los dos `server`** (todo dentro de un mismo archivo).
5. Activar la config y validar nginx (`nginx -t`) y reiniciar.
6. Instalar y configurar PHP-FPM (socket UNIX).
7. Añadir bloque `location ~ \.php$` en el server correspondiente.
8. Subir/colocar archivos con FileZilla o moverlos con `mv`.
9. Probar todo en el navegador (y en `curl`) y revisar logs si hay errores.

---

# Instrucciones paso a paso con comandos y explicaciones

> **Nota:** en las instrucciones a continuación sustituye `IP_VM` por la IP real de la VM y `usuario` por tu usuario.

---

## 1) Conectar a la VM

* Si trabajas en la VM directamente: abre una terminal en la VM.
* Si conectas vía SSH desde tu PC:

```bash
ssh usuario@IP_VM
```

Comprueba usuario y ubicación:

```bash
whoami
pwd
```

---

## 2) Comandos básicos que usarás siempre (memorizables)

```bash
ls            # listar archivos
cd /ruta      # entrar carpeta
pwd           # ruta actual
sudo <cmd>    # ejecutar como root
nano archivo  # editar archivo (Ctrl+O guardar, Enter, Ctrl+X salir)
mkdir -p ruta # crear carpetas recursivas
chown -R usuario:grupo carpeta  # cambiar propietario
ln -s origen destino  # enlace simbólico
rm archivo
rm -r carpeta
```

---

## 3) Crear las carpetas del examen y ajustar permisos

```bash
sudo mkdir -p /var/www/primero
sudo mkdir -p /var/www/agenda/imagenesjpg
sudo mkdir -p /var/www/agenda/secreto/interno
sudo mkdir -p /var/www/agenda/internos

# Dar propiedad a www-data (usuario por defecto de nginx)
sudo chown -R www-data:www-data /var/www/primero /var/www/agenda

# Permisos básicos (si necesitas que todos lean/ejecuten)
sudo chmod -R 755 /var/www/primero /var/www/agenda
```

**Por qué:** nginx corre como `www-data` y debe poder leer/entrar a las carpetas.

---

## 4) Crear archivos de prueba (contenido exacto)

Ejecuta estos comandos para crear archivos mínimos que el examen pedirá:

```bash
# Primer servidor (primero)
sudo tee /var/www/primero/primero.html > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>Primero - primero.html</h1></body></html>
HTML

sudo tee /var/www/primero/subprimero.html > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>Primero - subprimero.html</h1></body></html>
HTML

# Segundo servidor (agenda)
sudo tee /var/www/agenda/index.dpl > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>Agenda - index.dpl (interpretado como HTML)</h1></body></html>
HTML

sudo tee /var/www/agenda/index.html > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>Agenda - index.html</h1></body></html>
HTML

# secreto y secreto/interno
sudo tee /var/www/agenda/secreto/secreto.html > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>Secreto - /secreto/secreto.html</h1></body></html>
HTML

sudo tee /var/www/agenda/secreto/interno/secreto.html > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>Secreto Interno - /secreto/interno/secreto.html</h1></body></html>
HTML

# Página de error 404 interna
sudo tee /var/www/agenda/internos/p404.html > /dev/null <<'HTML'
<!doctype html>
<html><body><h1>404: Página no encontrada (p404.html)</h1></body></html>
HTML

# Imágenes de prueba: crea archivos vacíos con extensión .jpg .png y .img
sudo touch /var/www/agenda/imagenesjpg/foto1.jpg
sudo touch /var/www/agenda/imagenesjpg/foto2.jpeg
sudo mkdir -p /var/www/agenda/img
sudo cp /var/www/agenda/imagenesjpg/foto1.jpg /var/www/agenda/img/foto.img

# phpinfo() para probar PHP
sudo tee /var/www/agenda/info.php > /dev/null <<'PHP'
<?php phpinfo(); ?>
PHP
```

Asegúrate de que los archivos pertenezcan a `www-data`:

```bash
sudo chown -R www-data:www-data /var/www/primero /var/www/agenda
```

---

## 5) Crear el archivo de configuración `multisite` (un SOLO archivo con ambos `server`)

Abre el editor:

```bash
sudo nano /etc/nginx/sites-available/multisite
```

Copia exactamente este contenido (todo va en el mismo archivo):

```nginx
# multisite - contiene ambos servidores

server {
    listen 80 default_server;
    server_name _;
    root /var/www/primero;

    index subprimero.html;

    # / (raíz exacta) usa primero.html
    location = / {
        index primero.html;
    }

    # servir jpg/jpeg siempre desde /imagenesjpg del propio root
    location ~* /([[:alnum:]]+)\.(jpe?g)$ {
        try_files /imagenesjpg/$1.$2 =404;
    }
}

server {
    listen 80;
    server_name www.miagenda.com;
    root /var/www/agenda;

    include mime.types;
    index index.dpl index.html;

    # declarar MIME adicionales sin eliminar los heredados
    types {
        text/html dpl;
        image/png img;
    }

    # servir jpg/jpeg siempre desde /imagenesjpg
    location ~* /([[:alnum:]]+)\.(jpe?g)$ {
        try_files /imagenesjpg/$1.$2 =404;
    }

    # /secreto redirige internamente a /secreto/interno/secreto.html
    location /secreto {
        index secreto.html;
        try_files $uri/interno/ $uri/ $uri =404;
    }

    # Página 404 personalizada y acceso interno protegido
    error_page 404 /internos/p404.html;

    location /internos {
        internal;
    }

    # Bloque para ejecutar PHP (php-fpm via socket unix)
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
}
```

Guarda (`Ctrl+O`, Enter) y sal (`Ctrl+X`).

**IMPORTANTE**: todo lo anterior está contenido en **un solo archivo** `/etc/nginx/sites-available/multisite`. No crees uno por server por separado a menos que el examen lo pida explícitamente; el PDF muestra la práctica como un `multisite` conjunto. 

---

## 6) Activar la configuración y comprobar nginx

Crear el enlace en `sites-enabled` y validar:

```bash
sudo ln -s /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/
sudo nginx -t
```

* Si `nginx -t` dice `syntax is ok` y `test is successful`, reinicia:

```bash
sudo systemctl restart nginx
```

* Si da error: lee el mensaje (te dirá archivo y línea), corrige con `nano`, vuelve a `nginx -t`.

---

## 7) (Opcional) Si el examen requiere limpiar `sites-enabled` previo

Si hay configuraciones por defecto que interfieren (p. ej. `/etc/nginx/sites-enabled/default`), retíralas:

```bash
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
```

---

## 8) Instalar y configurar PHP-FPM (Debian)

1. Actualizar repos y instalar PHP-FPM:

```bash
sudo apt update
sudo apt -y install php8.2-fpm   # si tu Debian no tiene 8.2 usa la versión disponible (8.1, 8.0, etc.)
```

2. Verificar servicio:

```bash
sudo systemctl status php8.2-fpm
```

(si la versión es distinta, sustituye `8.2` por la versión instalada).

3. Configurar PHP-FPM para usar socket UNIX (recomendado):

```bash
sudo nano /etc/php/8.2/fpm/pool.d/www.conf
```

Busca la línea `listen =` y cambia (o establece):

```
listen = /run/php/php-fpm.sock
```

Guarda y sal.

4. Reinicia PHP-FPM:

```bash
sudo systemctl restart php8.2-fpm
```

5. Verifica que el socket existe:

```bash
ls -l /run/php/php-fpm.sock
# o
ss -putnl | grep php
```

---

## 9) Validar bloque PHP en nginx

Asegúrate de que en tu `server` (el de `www.miagenda.com`) tienes:

```nginx
location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php-fpm.sock;
}
```

`snippets/fastcgi-php.conf` viene con la instalación de nginx en Debian y define variables FastCGI esenciales. No la copies manualmente; sólo incluye la referencia como se muestra.

Después:

```bash
sudo nginx -t
sudo systemctl restart nginx
```

---

## 10) Subir archivos con FileZilla (paso a paso si nunca lo usaste)

1. Abre FileZilla.
2. En “Host” pon: `sftp://IP_VM` o pones `IP_VM` en Host y seleccionas protocolo SFTP.
3. Usuario: `usuario` (el de la VM).
4. Contraseña: tu contraseña.
5. Puerto: `22`.
6. Conéctate.
7. En el panel derecho navega a `/var/www/agenda` o `/var/www/primero`.
8. Arrastra los archivos locales que hayas creado (index, info.php, imágenes, etc.) al panel derecho.
9. Si FileZilla no puede escribir en `/var/www` por permisos, súbelos a tu home (`/home/usuario`) y luego mueve con SSH:

```bash
sudo mv /home/usuario/archivo /var/www/agenda/
sudo chown www-data:www-data /var/www/agenda/archivo
```

---

## 11) Probar en el navegador y con curl (comprobaciones exactas)

**Nota sobre DNS/local hosts:** En tu PC local es probable que debas mapear `www.miagenda.com` a la IP de la VM añadiendo a tu `/etc/hosts` (o `C:\Windows\System32\drivers\etc\hosts` en Windows):

```
IP_VM  www.miagenda.com
```

### Pruebas:

1. Raíz por IP (debe mostrar `primero.html` si entras por IP):

```
http://IP_VM/
```

2. Por dominio:

```
http://www.miagenda.com/
```

(debe mostrar `index.dpl`, que nginx servirá con Content-Type text/html por el `types { text/html dpl; }`).

3. `/secreto` y `/secreto/` (deben mostrar `/secreto/interno/secreto.html`):

```
http://www.miagenda.com/secreto
http://www.miagenda.com/secreto/
```

4. `/secreto/secreto.html` (debe mostrar el secreto normal, no el interno):

```
http://www.miagenda.com/secreto/secreto.html
```

5. Imagen solicitada por nombre en raíz (debe buscarla en `/imagenesjpg`):

```
http://www.miagenda.com/foto1.jpg
http://www.miagenda.com/foto2.jpeg
```

6. Archivo `.img` en `/img` (debe servirse con `Content-Type: image/png`):

```
http://www.miagenda.com/img/foto.img
```

7. Página 404 personalizada:

```
http://www.miagenda.com/noexiste.html
# debe devolver el contenido de /internos/p404.html
```

Y si pruebas directamente:

```
http://www.miagenda.com/internos/p404.html
# debe devolver 403 Forbidden por 'internal'
```

8. PHP:

```
http://www.miagenda.com/info.php
```

Debe mostrar la página `phpinfo()` (panel de PHP). Si ves código fuente o descarga → Nginx no está enviando a PHP-FPM.

---

## 12) Comprobación rápida con curl (útil si no puedes acceder por navegador)

Ejemplos:

```bash
curl -I http://www.miagenda.com/info.php    # ver cabeceras
curl -v http://www.miagenda.com/foto1.jpg   # ver respuesta
curl -i http://www.miagenda.com/noexiste.html
```

---

## 13) Logs y resolución de problemas (primeros pasos)

* Ver errores nginx (lee últimas líneas):

```bash
sudo tail -n 100 /var/log/nginx/error.log
```

* Ver accesos:

```bash
sudo tail -n 100 /var/log/nginx/access.log
```

* Ver logs PHP-FPM:

```bash
sudo tail -n 100 /var/log/php8.2-fpm.log
```

* Si aparece `502 Bad Gateway` → problema con PHP-FPM (no corre, socket mal, permisos).
  Solución rápida:

  ```bash
  sudo systemctl status php8.2-fpm
  sudo systemctl restart php8.2-fpm
  ls -l /run/php/php-fpm.sock
  sudo chown www-data:www-data /run/php/php-fpm.sock
  sudo nginx -t && sudo systemctl restart nginx
  ```

---

## 14) Errores frecuentes y cómo reaccionar (memorizable)

* `nginx -t` falla → abre archivo indicado y corrige la línea.
* 403 al abrir un archivo → `sudo chown -R www-data:www-data /var/www/...` y `chmod -R 755`.
* 502 Bad Gateway → php-fpm no funciona o socket equivocado.
* Si `include mime.types;` no está y defines `types { ... }` dentro del server, recuerda que `types` **sustituye** los heredados (por eso incluimos `include mime.types;` en el server 2).

---

## 15) Resumen final (chuleta de examen — memorízalo)

1. Crear carpetas → `mkdir -p /var/www/...`
2. Dar permisos → `chown -R www-data:www-data /var/www/...`
3. Crear `/etc/nginx/sites-available/multisite` con **ambos** `server { }` (ver contenido arriba).
4. `sudo ln -s ... /etc/nginx/sites-enabled/`
5. `sudo nginx -t` → `sudo systemctl restart nginx`
6. `sudo apt install php8.2-fpm` → editar `listen = /run/php/php-fpm.sock` en `www.conf` → `sudo systemctl restart php8.2-fpm`
7. Añadir bloque `location ~ \.php$` en el server y reiniciar nginx.
8. Subir archivos con FileZilla al `root` indicado.
9. Probar `http://www.miagenda.com/info.php` y demás rutas.
10. Logs: `/var/log/nginx/error.log` y `/var/log/php8.2-fpm.log`.

---

# Final — examen simulado con enunciado y respuesta (lista para practicar)

### Enunciado (qué te pedirán)

> En la VM Debian monta dos sitios: uno por defecto (`/var/www/primero`) y otro para `www.miagenda.com` (`/var/www/agenda`). Para `www.miagenda.com`:
>
> * index principal `index.dpl` (interpretado como text/html)
> * servir imágenes `.jpg|.jpeg` desde `/imagenesjpg`
> * tratar `.img` como `image/png`
> * configurar `/secreto` para que muestre `/secreto/interno/secreto.html` cuando se acceda a `/secreto` o `/secreto/`
> * crear página 404 personalizada `/internos/p404.html` que **no** sea accesible directamente por el cliente (usar `internal`)
> * dejar funcionando PHP con PHP-FPM (socket UNIX) y comprobar `info.php`

### Respuesta (resumida, copia lo que hiciste arriba)

* Crear carpetas → `mkdir -p ...`
* Crear archivos html/php → usar `tee` o FileZilla
* Crear `/etc/nginx/sites-available/multisite` con el contenido proporcionado arriba
* Activar con `ln -s`, validar `nginx -t` y reiniciar
* Instalar php-fpm, configurar `listen = /run/php/php-fpm.sock`, reiniciar
* Añadir bloque PHP, reiniciar nginx
* Probar en navegador, revisar logs si falla

---

Si quieres, **ahora** puedo:

* A) Generar **un guion imprimible** (checklist con casillas) para que lo practiques en la VM y marques cada paso.
* B) Montar el **mismo examen pero con variaciones** (nombres distintos, puertos distintos) para que practiques.
* C) Prepararte **5 ejercicios prácticos** paso a paso para que lo hagas en la VM y me pegues los `nginx -t` /salidas para que te corrija.

Dime cuál prefieres (A, B o C) y te lo doy ya en Markdown listo para copiar.
