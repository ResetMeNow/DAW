***Explicaciones del próximo Exámen***
---
# 🧩 ***EJERCICIO 1 — ¿Qué hace nginx cuando piden info.php?***

Situación:

No hay PHP configurado

mime.types NO contiene “php"

```default_type = application/octet-stream```

Único location:

```location / {
    try_files $uri $uri/ =404;
}
```

El cliente pide:

http://www.miservidor.org/info.php



 ✅ **Respuesta**

1️⃣ El cliente pide:
`info.php`

2️⃣ Nginx entra en el `location /` y ejecuta:

```nginx
try_files $uri $uri/ =404;
```

3️⃣ Busca el archivo físico `/var/www/html/info.php`
✔ **Existe** → así que lo sirve.

4️⃣ Como la extensión **php NO está en mime.types**, nginx **no sabe qué tipo MIME usar** → por tanto aplica:

```
default_type application/octet-stream;
```

5️⃣ Resultado final:
➡ **nginx NO ejecuta el script PHP**
➡ **Envía el archivo tal cual**
➡ **El navegador lo descargará como un archivo** (`info.php`)

---

# 🎯 Respuesta de examen:

> Como PHP no está configurado ni existe su MIME, nginx encuentra el archivo info.php pero no lo ejecuta. Usa el tipo por defecto `application/octet-stream`, así que el navegador lo descarga.

---
# 🧩***EJERCICIO 2 — ¿Qué servidor virtual selecciona nginx?***

Tenemos esta configuración:

```
server {
    listen 80 default_server;
    server_name _;
    root /var/www/primero;
}

server {
    listen 80;
    server_name www.miagenda.com;
    root /var/www/agenda;
}
```

Situación:

El cliente abre en su navegador:

http://10.108.99.100/


(no pone dominio, solo la IP)

👉 Tu misión:
¿Qué server usa nginx? ¿El primero o el segundo?
Y por qué.

✅ **Respuesta correcta explicada**

Cuando el cliente escribe solo la IP:

http://10.108.99.100/


La cabecera Host será:

Host: 10.108.99.100


Y nginx intenta buscar un server_name que coincida con eso.
Pero en tu configuración:

```server_name _; (guion bajo) → NO coincide con 10.108.99.100```

server_name www.miagenda.com; → tampoco coincide

Por tanto…

👉 No coincide con ningún server_name, así que nginx usa el que tiene:

```listen 80 default_server;```


✔ Ese es el servidor “por defecto”
✔ Siempre se usa cuando no hay coincidencias de nombre

---

# 🎯Respuesta de examen:
> nginx usará el primer servidor porque tiene la directiva default_server. Como la petición llega por IP y no coincide con ningún server_name, el server por defecto es el que se selecciona.

---
# 🧩 ***EJERCICIO 3 — Prioridad del index en raíz vs subdirectorios***

Tenemos este servidor:

server {
    listen 80 default_server;
    server_name _;
    root /var/www/primero;

    index subprimero.html;

    location = / {
        index primero.html;
    }
}


Y en el sistema de archivos existen:

/var/www/primero/primero.html
/var/www/primero/subprimero.html
/var/www/primero/carpeta/subprimero.html

👉 Preguntas:
1) Si el cliente pide simplemente:
http://servidor/


¿QUÉ ARCHIVO sirve nginx?

2) Si el cliente pide:
http://servidor/carpeta/


¿QUÉ ARCHIVO sirve nginx?

## 🤓 CÓMO SABER QUÉ INDEX COGE NGINX
> 📌 Regla 1 — Existe un location = /

```location = / {
    index primero.html;
}
```


Esto significa:

✔ SOLO se aplica exactamente cuando la URL es /
❌ No se aplica en subdirectorios
❌ No se aplica en ninguna otra ruta


> 📌 Regla 2 — Fuera del location = /, el servidor usa:
index subprimero.html;


Esto aplica a todos los directorios excepto el raíz exacto.

🎯 AHORA RESPONDEMOS A LAS DOS PREGUNTAS
1) Petición:
http://servidor/


La URI es exactamente /.

✔ Coincide con location = /
✔ Por tanto usa:

index primero.html;


📌 Respuesta 1: nginx sirve primero.html

2) Petición:
http://servidor/carpeta/


La URI NO es / sino /carpeta/.

❌ No coincide con location = /
✔ Por tanto se usa la directiva global del server:

index subprimero.html;


Como dentro de /var/www/primero/carpeta/ sí existe subprimero.html, ese es el que sirve.

📌 Respuesta 2: nginx sirve carpeta/subprimero.html

🎓 Resumen para memorizar (muy fácil):

/ → primero.html

/loquesea/ → subprimero.html