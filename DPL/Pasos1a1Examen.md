# 🟦 A) Entrar por SSH o abrir la terminal de la VM

Comando básico (solo si usas SSH):

ssh usuario@IP


En clase normalmente abrirás la terminal de la VM directamente.

# 🟦 B) Navegar por carpetas (importantísimo)
> cd /etc/nginx
 ls
 cd sites-available
 nano multisite


Comandos:

> Comando	Qué hace
- ls	-> listar archivos
- cd	-> entrar en carpeta
- pwd	-> ver dónde estás
- nano archivo	-> editar archivo
- mkdir nombre	-> crear carpeta
- rm archivo	-> borrar
- rm -r carpeta	-> borrar carpeta
- chown -R www-data:www-data carpeta -> cambiar dueño

--- 

# 🟦 C) Editar un archivo de configuración con nano

Esto lo usarás SIEMPRE:

sudo nano /etc/nginx/sites-available/multisite


Dentro:

teclas → arriba/abajo

Ctrl + O para guardar

Enter confirmar

Ctrl + X para salir

# 🟦 D) Activar un sitio
sudo ln -s /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/

# 🟦 E) Probar configuración
sudo nginx -t


Si pone:

syntax is ok
test is successful


→ Perfecto.

Si NO, el examen se suspende porque nginx no reiniciará.

# 🟦 F) Reiniciar nginx
sudo systemctl restart nginx

# 🟦 G) Crear carpetas para los sitios
sudo mkdir -p /var/www/primero
sudo mkdir -p /var/www/agenda
sudo mkdir -p /var/www/agenda/imagenesjpg
sudo mkdir -p /var/www/agenda/secreto/interno
sudo mkdir -p /var/www/agenda/internos


Asignar permisos:

sudo chown -R www-data:www-data /var/www

# 🟦 H) Usar FileZilla

Tu conexión:

Host → IP de tu VM

Usuario → el que tengas (alumno, ubuntu, etc.)

Contraseña → la que elegiste

Puerto → 22 (SSH)

Navegas a:

/var/www/agenda/


y arrastras dentro:

imágenes

index.html

index.dpl

secreto.html

p404.html

info.php

# 🟦 I) Configurar PHP-FPM

Abrir:

sudo nano /etc/php/8.2/fpm/pool.d/www.conf


Modificar:

listen = /run/php/php-fpm.sock


Reiniciar:

sudo systemctl restart php8.2-fpm


Probar que corre:

ss -putnl | grep php

# 🟦 J) Configurar nginx para ejecutar PHP

En tu server:

location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php-fpm.sock;
}

# 🟦 K) Crear info.php
sudo nano /var/www/agenda/info.php


Contenido:

<?php phpinfo(); ?>


Probar:

http://www.miagenda.com/info.php