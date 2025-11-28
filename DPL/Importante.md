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
