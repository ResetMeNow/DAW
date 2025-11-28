
# 🟣 2. Servidor de aplicaciones PHP — nginx + PHP

Nginx NO puede ejecutar PHP por sí mismo.
Para ejecutar scripts .php, siempre necesita otro servicio.

Ese servicio puede ser:

un servidor PHP simple (php -S)

PHP-FPM (lo usado en producción)

El funcionamiento siempre es:

Cliente → Nginx → Servidor PHP (PHP-FPM) → Nginx → Cliente


Nginx actúa como intermediario (reverse proxy).

# 🟪 2.1 Cómo funciona una petición PHP

Supongamos que el cliente envía:

``GET /login.php?usuario=angel&passwd=1234``


Nginx debe:

Detectar que es un archivo PHP

Reenviar la petición al servidor PHP

Esperar la respuesta

Devolverla al cliente (sin modificar nada)

Nginx no ejecuta PHP —solo lo pasa al backend que lo ejecuta.

# 🟣 2.2 Usar un servidor PHP simple (php -S)

Esto es útil para aprender, pero no se usa en producción.

Ejemplo:
``
cd /var/www/html
php -S 0.0.0.0:9000
``

Esto abre un servidor PHP básico escuchando en el puerto 9000.

# 🟪 Configurar nginx para enviarle los .php
``
location ~ \.php$ {
    proxy_pass http://localhost:9000;
}
``

Esto significa:

Si la URL termina en .php

nginx reenvía la petición vía HTTP a php -S

Pero esto no se usa en servidores reales.

# 🟣 2.3 PHP-FPM (LO IMPORTANTE PARA EL EXAMEN)

PHP-FPM es un servidor de procesos especializado para ejecutar PHP.

Es lo que SIEMPRE se usa en producción.

## 🟢 1) Instalar PHP-FPM

Ejemplo:

``apt install php8.2-fpm``


Esto inicia un servicio llamado:

``php8.2-fpm.service``

## 🟢 2) Configurar PHP-FPM para que escuche en un puerto (TCP)

Archivo:

``/etc/php/8.2/fpm/pool.d/www.conf``


Cambiar:

``listen = 127.0.0.1:9000``


Reiniciar:

``systemctl restart php8.2-fpm``


Comprobar:

``ss -putnl``

# 🟣 2.4 Variables necesarias para que PHP-FPM ejecute PHP

Cuando nginx pasa la petición a FPM vía fastcgi, debe enviar:
```
SCRIPT_FILENAME

QUERY_STRING

REQUEST_METHOD

CONTENT_LENGTH

CONTENT_TYPE
```
etc.

Para eso nginx usa un archivo predefinido:

``/etc/nginx/snippets/fastcgi-php.conf``


Ese archivo contiene las variables que PHP-FPM necesita.

# 🟪 2.5 Configurar nginx correctamente para PHP-FPM

Este bloque es el que debes memorizar para examen:
``
location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass 127.0.0.1:9000;
}
``

Significado:

``location ~ .php$`` → detecta archivos .php

``include snippets/fastcgi-php.conf`` → carga variables necesarias

``fastcgi_pass`` → envía la petición a PHP-FPM

# 🟣 2.6 Usar un socket UNIX (mejor que TCP)

MUY IMPORTANTE PARA EXAMEN.

En vez de usar un puerto TCP (más lento), es mejor usar un socket local.

Cambiar en:

``/etc/php/8.2/fpm/pool.d/www.conf``


De:

``listen = 127.0.0.1:9000``


A:

``listen = /run/php/php-fpm.sock``


Reiniciar:

``systemctl restart php8.2-fpm``

## 🔥 Nginx con socket UNIX
``
location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php-fpm.sock;
}
``

Este bloque es el más usado en producción.

# 🟪 2.7 Diferencia TCP vs UNIX socket
Método	Ejemplo	Característica
TCP	fastcgi_pass 127.0.0.1:9000	Más lento, más compatible
Socket UNIX	fastcgi_pass unix:/run/php/php-fpm.sock	Más rápido, recomendado, solo local
# 🟣 2.8 RESUMEN FINAL PARA EXAMEN
## 🔥 Resumen de nginx + PHP-FPM

- Nginx NO ejecuta PHP.  
- Los scripts .php se envían a PHP-FPM usando fastcgi.  

### Nginx debe incluir:

```nginx
include snippets/fastcgi-php.conf;
```

→ Contiene todas las variables necesarias para PHP-FPM.

### Nginx debe reenviar la petición:

#### Opción 1 (TCP)
```nginx
fastcgi_pass 127.0.0.1:9000;
```

#### Opción 2 (Socket UNIX) — RECOMENDADO
```nginx
fastcgi_pass unix:/run/php/php-fpm.sock;
```

### Archivo crítico (PHP-FPM):
```
/etc/php/8.2/fpm/pool.d/www.conf
```

- Aquí cambiamos `listen =`
- Puede ser un puerto o un socket.

### Flujo final:
Cliente → Nginx → (fastcgi) → PHP-FPM → Nginx → Cliente
