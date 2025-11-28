# 🟣 ESQUEMA REAL DEL EXAMEN – SOLO 2 BLOQUES:
# 🟦 BLOQUE 1 — Configuración avanzada de Nginx (1.1.3)

Te pedirán algo MUY parecido a esto (te lo dejo ya en formato de comandos reales):

## 1️⃣ Crear dos sitios web

Comandos reales:

sudo mkdir -p /var/www/primero
sudo mkdir -p /var/www/agenda

sudo chown -R www-data:www-data /var/www/primero
sudo chown -R www-data:www-data /var/www/agenda


Crear archivo de config:

sudo nano /etc/nginx/sites-available/multisite


Contenido típico:

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

    include mime.types;

    index index.dpl index.html;

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

    location /internos {
        internal;
    }
}


Activarlo:

sudo ln -s /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

## 2️⃣ Crear las carpetas que el examen te pedirá

Tu profesor SIEMPRE pide imágenes, carpetas secreto, etc.

sudo mkdir /var/www/primero/imagenesjpg
sudo mkdir -p /var/www/agenda/imagenesjpg
sudo mkdir -p /var/www/agenda/secreto/interno
sudo mkdir -p /var/www/agenda/internos


Subes archivos con FileZilla a esas ubicaciones.

# 🟦 BLOQUE 2 — PHP-FPM + Nginx (punto 2 del PDF)
## 1️⃣ Instalar PHP-FPM
sudo apt install php8.2-fpm

## 2️⃣ Comprobar que PHP-FPM está funcionando
systemctl status php8.2-fpm

## 3️⃣ Configurar PHP-FPM para usar socket (recomendado)

Abrir:

sudo nano /etc/php/8.2/fpm/pool.d/www.conf


Buscar:

listen = 


Cambiar por:

listen = /run/php/php-fpm.sock


Reiniciar:

sudo systemctl restart php8.2-fpm

## 4️⃣ Configuración Nginx para .php

Añadir a tu server (segundo servidor normalmente):

location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php-fpm.sock;
}


Reiniciar nginx:

sudo nginx -t
sudo systemctl restart nginx

## 5️⃣ Crear un archivo php para probar
sudo nano /var/www/agenda/info.php


Meter:

<?php phpinfo(); ?>


Probar desde navegador:

http://www.miagenda.com/info.php


Si ves el panel morado de phpinfo → FUNCIONA.