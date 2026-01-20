# 🧪 Comprobaciones rápidas ANTES del examen (en tu VM)

### ✔ 1) SSH funcionando

Desde tu PC conéctate a la VM:

``ssh alumno@IP_VM``

El comando hostname -I te confirma cuál usa realmente como principal:

``hostname -I`` 

192.168.1.17 [...]

### ✔ 2) nginx instalado y funcionando
``sudo systemctl status nginx``

Debe decir:

``active (running)`` 

Si no:

``sudo apt install nginx`` 

``sudo systemctl start nginx``

### ✔ 3) php-fpm instalado y funcionando
``sudo systemctl status php*-fpm``

Si no:

``sudo apt install php-fpm``

### ✔ 4) Socket php-fpm existe
``ls -l /run/php/``

Debe verse algo como:

``php8.2-fpm.sock``

### ✔ 5) curl instalado
``curl --version``

Si no:
``sudo apt install curl``

### ✔ 6) nano instalado

Normalmente ya viene:

``nano --version``

### ✔ 7) Comprueba que nginx puede reiniciar
``sudo nginx -t``
``sudo systemctl restart nginx``


Si nginx -t va bien → perfecto.

### ✔ 8) Comprueba conexión SFTP desde FileZilla

En tu VM:

``sudo systemctl status ssh``


Debe decir:

``active (running)``


Si no:

``sudo apt install openssh-server``
``sudo systemctl enable --now ssh``


En FileZilla (desde tu PC):

```
Host: sftp://IP_VM

Usuario: alumno

Puerto: 22
```
Debe conectar sin problemas.

## 🟢 TODO LO QUE DEBE FUNCIONAR ANTES DEL EXAMEN

Para que no tengas SORPRESAS el día del examen, asegúrate de:

✔ SSH activo

Puedes entrar a la VM.

✔ nginx instalado y funcionando

systemctl status nginx → running

✔ php-fpm instalado

systemctl status php*-fpm → running
y el socket existe en /run/php/

✔ curl funcional

Para probar PHP dentro de la VM.

✔ FileZilla conecta por SFTP

Para subir la entrega final.

✔ Máquina tiene IP fija o conocida

Para usarla en /etc/hosts en el PC del examen.

✔ Tu usuario tiene sudo sin errores

Para crear carpetas, editar config, reiniciar nginx.


## Importantísimo :bangbang:

> [!TIP]
> Flujo recomendado justo antes o durante el examen (rápido)

Comprueba enabled sites:

```
ls -l /etc/nginx/sites-enabled/
```
Opción rápida y segura (recomendada)

Haz esto como root (si estás con su -, sin sudo):

Mover default y pris.daw.com a archivos “.disabled” (los desactivas pero los guardas):

```
mv /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/default.disabled 2>/dev/null || true
mv /etc/nginx/sites-enabled/pris.daw.com /etc/nginx/sites-enabled/pris.daw.com.disabled 2>/dev/null || true
```

Comprobar sintaxis:

``nginx -t``


Si nginx -t dice OK → reinicia nginx:

``systemctl restart nginx`` 
``systemctl status nginx --no-pager``


Si algo falla y quieres volver atrás, restaura:
```
mv /etc/nginx/sites-enabled/default.disabled /etc/nginx/sites-enabled/default 2>/dev/null || true
mv /etc/nginx/sites-enabled/pris.daw.com.disabled /etc/nginx/sites-enabled/pris.daw.com 2>/dev/null || true
nginx -t && systemctl restart nginx
```
Si default aparece y quieres evitar problemas(cuidado):

```
sudo rm /etc/nginx/sites-enabled/default
```

> [!WARNING]
> Include snippets/fastcgi-php.conf — comprueba que existe

Antes del examen verifica que el fichero existe:

```
ls -l /etc/nginx/snippets/fastcgi-php.conf
```

Si no existe, en Debian suele estar en /etc/nginx/ o se usa /etc/nginx/fastcgi_params. Si falta, tendrás que crear un snippet mínimo o incluir fastcgi_params. Muy raro que falte en la VM del aula, pero compruébalo.
> [!CAUTION]
> Socket PHP-FPM: la ruta exacta puede variar por versión

``/run/php/php-fpm.sock`` suele funcionar si tu php-fpm está configurado así.
Comprueba con:

```
ls -l /run/php/
```

y si ves php7.4-fpm.sock o php8.2-fpm.sock, ajusta fastcgi_pass unix:/run/php/php-fpm.sock; al nombre real o cambia el listen en www.conf para coincidir. Tu guion contempla usar el glob php*-fpm para reinicio, así que está bien; sólo revisa el socket.

---

### 👉Si Debian NO tuviera sudo (muy raro), entonces:

Entras como root:

```su```


Instalas sudo:

```
apt update
apt install sudo
```


Añades tu usuario al grupo sudo:

```usermod -aG sudo alumno```

📌Y desde ese momento YA puedes usar sudo.

---
## Comandos básicos

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
## 🚩 IMPORTANTÍSIMO  
### 🟪 CONECTAR A LA VM DESDE EL PC DEL AULA  
``ssh alumno@IP_VM``


Asegúrate de que SSH está funcionando.

### 🟪ESTRUCTURA OBLIGATORIA DE CARPETAS 
``sudo mkdir -p /var/www/``


SIN permisos correctos → nginx te da errores 403 / 404 / 502.

Imágenes falsas:
``sudo touch /var/www/``

---

### 🟪ACTIVAR MULTISITE + COMPROBAR CONFIG

```
sudo ln -s /etc/nginx/sites-available/multisite /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx
```

Si nginx -t da ERROR → NO SIGAS → corrige. 

---

### 🟪 COMANDOS IMPRESCINDIBLES (APRENDE ESTOS)
Ver puertos:
``ss -putnl``

Ver logs (muy útil): 
``sudo tail -n 50 /var/log/nginx/error.log`` 

``sudo tail -n 50 /var/log/nginx/access.log``

Reiniciar rápido:
``sudo systemctl restart nginx
sudo systemctl restart php*-fpm``

---
### 🔵 ¿Cómo se prueba PHP con curl?

En la VM:

``curl http://localhost/info.php``
o
``curl IP_VM/info.php
`` 

Si PHP-FPM está bien configurado, verás texto muy largo con información de PHP.
