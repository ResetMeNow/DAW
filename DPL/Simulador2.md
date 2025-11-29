# 📝 **ENUNCIADO — SIMULACIÓN REAL (ESTILO PROFESOR)**

*(Basado directamente en 1.1.3 del PDF y el punto 2, pero con nombres diferentes para practicar)*

---

## **Actividad de configuración de un entorno de publicación web con Nginx y PHP-FPM**

En este ejercicio deberá realizar la configuración completa de un servidor web utilizando Nginx, de forma que se publiquen **dos sitios web distintos**, ambos accesibles desde el mismo servidor pero bajo reglas de resolución diferentes. Además, el servidor deberá estar preparado para procesar páginas PHP mediante PHP-FPM.

El sistema se encuentra con Nginx previamente instalado, y deberá configurar los elementos necesarios para cumplir los requisitos que se detallan a continuación.

---

## **1. Sitio web por defecto del servidor**

Configure un servidor virtual que actuará como **servidor por defecto** al escuchar en el puerto 80.

Este servidor deberá servir contenido almacenado en la ruta:

```
/var/www/portal
```

En dicho directorio existirán los archivos:

* `portal.html`
* `subportal.html`

El servidor deberá:

* utilizar `subportal.html` como índice principal,
* cuando se acceda a `/`, servir explícitamente el archivo `portal.html`,
* gestionar las peticiones a imágenes con extensión `.jpg` o `.jpeg`, de forma que se intenten localizar en el directorio

  ```
  /var/www/aplicacion/imagenes
  ```

  mediante la directiva `try_files`,
  devolviendo un error 404 si el recurso no existe.

---

## **2. Sitio web principal asociado al dominio**

Configure un segundo servidor virtual que responderá exclusivamente a:

```
www.sistemaapp.com
```

El contenido de este sitio se encontrará en:

```
/var/www/aplicacion
```

Este sitio contendrá los siguientes archivos y directorios:

* `inicio.dpl`
* `inicio.html`
* `secreto/secreto.html`
* `secreto/interno/secreto.html`
* `internos/p404.html`
* `info.php`

El servidor deberá:

1. Declarar como índices, por este orden:

   * `inicio.dpl`
   * `inicio.html`

2. Incorporar tipos MIME adicionales para:

   * `.dpl` como `text/html`
   * `.img` como `image/png`

3. Manejar las extensiones `.jpg` y `.jpeg` mediante un `location` que intente localizar los recursos en:

   ```
   /var/www/aplicacion/imagenes
   ```

4. Configurar un bloque de localización para el directorio `/secreto`, cuyo índice será `secreto.html`, y que deberá evaluar secuencialmente mediante `try_files` las siguientes rutas:

   * `/secreto/interno/`
   * `/secreto/`
   * si no existe → devolver el error 404

5. Configurar una página de error 404 personalizada ubicada en:

   ```
   /internos/p404.html
   ```

   El directorio `/internos` deberá declararse como **internal**, de modo que no pueda accederse directamente.

6. Preparar la ejecución de la página `info.php` mediante el uso de PHP-FPM y FastCGI.

---

## **3. Configuración de PHP-FPM**

Instale y configure PHP-FPM para que utilice un socket Unix en:

```
/run/php/php-fpm.sock
```

Asegúrese de que la configuración del *pool* correspondiente está correctamente ajustada y de que el servicio es capaz de aceptar peticiones desde Nginx.

---

## **4. Validación**

Compruebe el funcionamiento correcto de:

* el acceso al sitio por defecto mediante la IP del servidor,
* el acceso al sitio asociado al dominio `www.sistemaapp.com`,
* la correcta resolución de peticiones hacia el directorio `/secreto`,
* el manejo del error 404 personalizado,
* la ejecución de `info.php`.

---

## **5. Entrega de la actividad**

Utilice el cliente SFTP proporcionado en el aula para transferir al servidor indicado por el profesor los directorios de los sitios web configurados, así como el archivo del bloque del servidor creado en:

```
/etc/nginx/sites-available
```
# 🎯 **FIN DEL ENUNCIADO**  



> [!CAUTION]
> Respuestas de Exámen

<details>
<summary>Despliega para verlas</summary>

# 🎓 **SOLUCIÓN COMPLETA DEL EXAMEN (SIMULADOR)**

---

# 🟣 0. Entrar en la máquina virtual desde el PC del aula

```bash
ssh alumno@IP_DE_LA_VM
```

---

# 🟩 1. Crear estructura de carpetas

```bash
sudo mkdir -p /var/www/portal
sudo mkdir -p /var/www/aplicacion/imagenes
sudo mkdir -p /var/www/aplicacion/secreto/interno
sudo mkdir -p /var/www/aplicacion/internos
```

---

# 🟩 2. Crear archivos HTML y demás contenido

## 📌 Sitio por defecto (`/var/www/portal`):

```bash
sudo nano /var/www/portal/portal.html
```

Contenido:

```html
<h1>portal.html</h1>
```

```bash
sudo nano /var/www/portal/subportal.html
```

Contenido:

```html
<h1>subportal.html</h1>
```

---

## 📌 Sitio del dominio (`/var/www/aplicacion`):

```bash
sudo nano /var/www/aplicacion/inicio.dpl
```

Contenido:

```html
<h1>inicio.dpl</h1>
```

```bash
sudo nano /var/www/aplicacion/inicio.html
```

Contenido:

```html
<h1>inicio.html</h1>
```

---

### Directorio secreto

```bash
sudo nano /var/www/aplicacion/secreto/secreto.html
```

```html
<h1>secreto.html</h1>
```

```bash
sudo nano /var/www/aplicacion/secreto/interno/secreto.html
```

```html
<h1>secreto interno.html</h1>
```

---

### Error 404 personalizado

```bash
sudo nano /var/www/aplicacion/internos/p404.html
```

Contenido:

```html
<h1>Error personalizado 404</h1>
```

---

### PHP info

```bash
sudo nano /var/www/aplicacion/info.php
```

Contenido:

```php
<?php phpinfo(); ?>
```

---

### Falsas imágenes

```bash
sudo touch /var/www/aplicacion/imagenes/uno.jpg
sudo touch /var/www/aplicacion/imagenes/dos.jpeg
sudo touch /var/www/aplicacion/imagenes/tres.img
```

---

### Permisos correctos

```bash
sudo chown -R www-data:www-data /var/www
sudo chmod -R 755 /var/www
```

---

# 🟩 3. Crear configuración Nginx

```bash
sudo nano /etc/nginx/sites-available/examen
```

Pega EXACTAMENTE esto:

---

## 🟣 **Servidor por defecto** (`/var/www/portal`)

```nginx
server {
    listen 80 default_server;
    server_name _;

    root /var/www/portal;
    index subportal.html;

    location = / {
        index portal.html;
    }

    location ~* \.(jpe?g)$ {
        try_files /var/www/aplicacion/imagenes/$uri =404;
    }
}
```

---

## 🟣 **Servidor del dominio** (`www.sistemaapp.com`)

```nginx
server {
    listen 80;
    server_name www.sistemaapp.com;

    root /var/www/aplicacion;
    index inicio.dpl inicio.html;

    include mime.types;
    types {
        text/html dpl;
        image/png img;
    }

    location ~* \.(jpe?g)$ {
        try_files /imagenes/$uri =404;
    }

    location /secreto {
        index secreto.html;
        try_files $uri/interno/ $uri/ /internos/p404.html;
    }

    error_page 404 /internos/p404.html;

    location /internos {
        internal;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
}
```

---

Guardar:
**CTRL+O → ENTER → CTRL+X**

---

# 🟩 4. Activar el sitio

```bash
sudo ln -s /etc/nginx/sites-available/examen /etc/nginx/sites-enabled/
```

---

# 🟩 5. Comprobar y reiniciar Nginx

```bash
sudo nginx -t
sudo systemctl restart nginx
```

---

# 🟩 6. Instalar y configurar PHP-FPM

```bash
sudo apt update
sudo apt install -y php-fpm
```

Editar pool:

```bash
sudo nano /etc/php/*/fpm/pool.d/www.conf
```

Buscar `listen =` y dejar así:

```
listen = /run/php/php-fpm.sock
```

Reiniciar:

```bash
sudo systemctl restart php*-fpm
sudo systemctl restart nginx
```

---

# 🟩 7. Probar PHP

Desde navegador:

```
http://IP_VM/info.php
```

o

```
http://www.sistemaapp.com/info.php
```

Desde VM:

```bash
curl http://localhost/info.php
```

---

# 🟩 8. Probar todo en el navegador del PC

Editar hosts del PC del aula:

```bash
sudo nano /etc/hosts
```

Añadir:

```
IP_VM   www.sistemaapp.com
```

Probar:

* `http://IP_VM/`
* `http://www.sistemaapp.com/`
* `http://www.sistemaapp.com/secreto`
* `http://www.sistemaapp.com/noexiste`
* `http://www.sistemaapp.com/info.php`

---

# 🟩 9. Logs y ss

```bash
ss -putnl
sudo tail -n 50 /var/log/nginx/error.log
sudo tail -n 50 /var/log/nginx/access.log
```

---

# 🟩 10. Descargar con FileZilla (PC del aula)

Conectar:

* Host: `sftp://IP_VM`
* Usuario: alumno
* Puerto: 22

Descargar al PC:

* `/var/www/portal/`
* `/var/www/aplicacion/`
* `/etc/nginx/sites-available/examen`

---

# 🟩 11. Enviar al servidor del profesor

El profesor te dará IP y usuario.
En FileZilla:

* Conectas
* Vas a tu carpeta
* Subes:

```
portal/
aplicacion/
examen
```

---

# 🎉 **FIN DE LAS RESPUESTAS**

</details>


