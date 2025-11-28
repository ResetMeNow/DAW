🟣 GUION DEFINITIVO DEL EXAMEN (1.1.3 + PHP-FPM)
💻 Desde el PC del aula → te conectas por SSH a tu VM

(Este es el paso que te dijo tu compañero)

ssh alumno@IP_DE_LA_VM

🟩 PASO 1 — Crear estructura de carpetas (en la VM)
sudo mkdir -p /var/www/primero
sudo mkdir -p /var/www/agenda/imagenesjpg
sudo mkdir -p /var/www/agenda/secreto/interno
sudo mkdir -p /var/www/agenda/internos
sudo chown -R www-data:www-data /var/www
sudo chmod -R 755 /var/www

🟩 PASO 2 — Crear archivos necesarios (HTML + PHP)
Primer servidor:
sudo nano /var/www/primero/primero.html
sudo nano /var/www/primero/subprimero.html

Segundo servidor:
sudo nano /var/www/agenda/index.dpl
sudo nano /var/www/agenda/index.html

sudo nano /var/www/agenda/secreto/secreto.html
sudo nano /var/www/agenda/secreto/interno/secreto.html
sudo nano /var/www/agenda/internos/p404.html

PHP info:
sudo nano /var/www/agenda/info.php


Contenido:

<?php phpinfo(); ?>

Imágenes “falsas”:
sudo touch /var/www/agenda/imagenesjpg/foto1.jpg
sudo touch /var/www/agenda/imagenesjpg/foto2.jpeg
sudo touch /var/www/agenda/img
sudo touch /var/www/agenda/img/foto.img

🟩 PASO 3 — Crear y editar archivo multisite
sudo nano /etc/nginx/sites-available/multisite


Pega este contenido (versión resumida, memorizable y válida):

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


Guardar:
CTRL + O → ENTER → CTRL + X

🟩 PASO 4 — Activar el multisite
sudo ln -s /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/

🟩 PASO 5 — Comprobar nginx y reiniciarlo
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx


Si hay error → corregir línea indicada → repetir.

🟩 PASO 6 — Instalar y configurar PHP-FPM
sudo apt update
sudo apt install -y php-fpm


Editar configuración del pool:

sudo nano /etc/php/*/fpm/pool.d/www.conf


Buscar:

listen =


Cambiar a:

listen = /run/php/php-fpm.sock


Reiniciar:

sudo systemctl restart php*-fpm
sudo systemctl status php*-fpm

🟩 PASO 7 — Probar PHP
Desde navegador del PC:
http://IP_VM/info.php


o

http://www.miagenda.com/info.php

Desde la VM (opcional):
curl http://localhost/info.php


Si ves texto → PHP funciona.

🟩 PASO 8 — Probar todo en el navegador (PC del aula)

Editar hosts en el PC:

sudo nano /etc/hosts


Añadir:

IP_VM   www.miagenda.com


Probar:

http://IP_VM/

http://www.miagenda.com/

http://www.miagenda.com/secreto

http://www.miagenda.com/noexiste

http://www.miagenda.com/info.php

🟩 PASO 9 — Archivo de logs (si algo falla)
sudo tail -n 50 /var/log/nginx/error.log
sudo tail -n 50 /var/log/nginx/access.log

🟩 PASO 10 — Al acabar el examen → usar FILEZILLA desde el PC
Para descargar lo que creaste en la VM:

En FileZilla:

Host: sftp://IP_VM

Usuario: alumno

Contraseña: tu pass

Puerto: 22

Panel derecho → navegar a:

/var/www/agenda
/var/www/primero
/etc/nginx/sites-available/multisite


Descarga arrastrando al panel izquierdo (tu PC).

🟩 PASO 11 — Subir los archivos al servidor del profesor

Tu profe te dará:

IP

Usuario

Contraseña

Carpeta destino

Puerto (22 o 21)

En FileZilla:

Conectar al servidor del profesor

Ir a tu carpeta con tu nombre

Arrastrar desde tu PC → servidor del profe:

carpeta /var/www/agenda

carpeta /var/www/primero

archivo multisite

Listo.