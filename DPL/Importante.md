# 🧪 Comprobaciones rápidas ANTES del examen (en tu VM)

### ✔ 1) SSH funcionando

Desde tu PC conéctate a la VM:

``ssh alumno@IP_VM``

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
