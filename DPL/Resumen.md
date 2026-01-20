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

# 🎯 Respuesta:

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

# 🎯Respuesta:
> nginx usará el primer servidor porque tiene la directiva default_server. Como la petición llega por IP y no coincide con ningún server_name, el server por defecto es el que se selecciona.

---
# 🧩 ***EJERCICIO 3 — Prioridad del index en raíz vs subdirectorios***

Tenemos este servidor:
```
server {
    listen 80 default_server;
    server_name _;
    root /var/www/primero;

    index subprimero.html;

    location = / {
        index primero.html;
    }
}
```

Y en el sistema de archivos existen:

```
/var/www/primero/primero.html
/var/www/primero/subprimero.html
/var/www/primero/carpeta/subprimero.html
```

👉 Preguntas:
1) Si el cliente pide simplemente:
```http://servidor/```


¿QUÉ ARCHIVO sirve nginx?

2) Si el cliente pide:
```http://servidor/carpeta/```


¿QUÉ ARCHIVO sirve nginx?

## 🤓 CÓMO SABER QUÉ INDEX COGE NGINX
> 📌 Regla 1 — Existe un location = /

```
location = / {
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

👉 Location + Regex + try_files para imágenes jpg/jpeg

# 🧩 ***EJERCICIO 4 — Servir imágenes JPG desde /imagenesjpg***

Tienes este server:
``` 
server {
    listen 80;
    server_name www.miagenda.com;
    root /var/www/agenda;

    index index.dpl index.html;
} 
```

Y en tu sistema tienes:

```
/var/www/agenda/imagenesjpg/foto1.jpg
/var/www/agenda/imagenesjpg/foto2.jpeg
```


Quieres que si el cliente pide:

``http://www.miagenda.com/foto1.jpg``


o

``http://www.miagenda.com/foto2.jpeg``


nginx siempre use la carpeta:

``/var/www/agenda/imagenesjpg/``


para localizar la imagen.
Eso implica usar:

location con expresión regular

``~* (case-insensitive)``

Captura del nombre y la extensión

``try_files con $1 y $2``

--- 

# 📘 Explicación completa: Location + Regex + try_files (estilo examen)
## 1️⃣ ¿Qué queremos conseguir?

Si el usuario pide:

/foto1.jpg
/foto2.jpeg
/FOTO3.JPG


da igual dónde estén esos archivos:
nginx debe buscarlos siempre en:

``/var/www/agenda/imagenesjpg/``


Y si no existen → 404.

## 2️⃣ ¿Cómo se detectan imágenes .jpg o .jpeg?

Con una expresión regular dentro del location.

La sintaxis es:
``
location ~* REGEX {
    ...
}
``

~ → regex

~* → regex case-insensitive (JPG, Jpg, jpg, etc.)

## 3️⃣ Expresión regular que necesitamos

Queremos capturar dos cosas:

El nombre del archivo

La extensión (jpg o jpeg)

## 4️⃣ ¿Qué hace try_files?

``try_files /imagenesjpg/$1.$2 =404;``


nginx probará:

``/var/www/agenda/imagenesjpg/NOMBRE.EXT``

si no existe → error 404

## 5️⃣ Bloque entero explicado línea por línea

``
location ~* /([[:alnum:]]+)\.(jpe?g)$ {
    try_files /imagenesjpg/$1.$2 =404;
}
``
✔ location ~* ...

Captura cualquier petición a un .jpg o .jpeg, sin importar mayúsculas.

✔ $1

Nombre del archivo capturado por la regex.

✔ $2

Extensión capturada (jpg o jpeg).

✔ try_files /imagenesjpg/...

Obliga a nginx a buscar siempre dentro de la carpeta imagenesjpg, aunque el usuario pida:
``
/foto.jpg
/carpeta/otra/foto.jpg
/loquesea/foto.jpeg
``
✔ =404

Si el archivo no existe → nginx responde 404 Not Found.

🎯 Resumen
``
location ~* /([[:alnum:]]+)\.(jpe?g)$ {
    try_files /imagenesjpg/$1.$2 =404;
}
``

~* → regex sin distinguir mayúsculas

$1 → nombre del archivo

$2 → extensión

siempre busca en /imagenesjpg

si no existe → 404

--- 

# 🟣 Añadir un tipo MIME personalizado (para .img como si fueran .png)

En el ejercicio del PDF, se pide que en el segundo servidor, cualquier archivo con extensión:
``
.img``


sea enviado al cliente como si fuera:
``
image/png``


Es decir, tratar archivos .img como imágenes PNG.

## 🔥 ¿Por qué?

Tienes una imagen:

``foto.png``


pero le cambias el nombre a:

``foto.img``


Al pedirla desde el navegador…

``/img/foto.img``


El navegador no sabrá qué tipo de contenido es, porque .img NO existe en mime.types.
Entonces nginx usaría:

``default_type application/octet-stream;``


➡ Eso provoca que el navegador la descargue, en lugar de mostrarla.

Por eso necesitamos enseñar a nginx que .img es lo mismo que un .png.

## 🟣 ¿Cómo se añade un tipo MIME en nginx?

Se usa la directiva:
``
types {
    MIME_TYPE extension;
}
``

Ejemplo general:
``
types {
    text/html dpl;
    image/png img;
}
``
## 🟢 Explicación
``
types {
    text/html dpl;
    image/png img;
}
``
✔ types { ... }

Esta directiva permite añadir o modificar tipos MIME solo dentro del server en el que se define.

✔ image/png img;

Significa:

para cualquier archivo con extensión .img

nginx enviará el encabezado:

``Content-Type: image/png``


➡ El navegador recibirá foto.img pero lo interpretará como una imagen PNG, y la mostrará correctamente.

✔ También añadimos text/html dpl;

Porque también hacía falta que .dpl sea interpretado como HTML.

## 🟣 ¿Por qué poner include mime.types; antes?

En nginx, si tú usas:

``types { ... }``


dentro de un server, se anulan todos los MIME heredados del contexto global a menos que los incluyas otra vez.

Por eso el PDF utiliza:

``include mime.types;``

``types {
    text/html dpl;
    image/png img;
}``


Esto significa:

Cargo todos los MIME normales (html, css, png, jpg…)

Añadir MIME extra para nuevas extensiones (dpl, img)

--- 

## 🟢 Resultado final
# Añadir MIME personalizados dentro del server
```
include mime.types;
>
types {
    # Interpretar archivos .dpl como páginas HTML
    text/html dpl;
    # Interpretar archivos .img como imágenes PNG
    image/png img;
}
>
```

# 🟣 Directiva internal + Página de error personalizada (404)

Te lo explico todo directamente, claro y perfecto para examen.
Formato Markdown listo para GitHub.

# 🟪 ¿Qué es la directiva internal?

internal prohíbe que el cliente (navegador) acceda directamente a una ruta o archivo.
Pero sí permite que nginx acceda internamente para devolver contenido.

Es decir:

Quién accede	¿Puede?
Navegador	❌ NO
nginx (internamente)	✔ SÍ
# 🟪 ¿Por qué se usa en el ejercicio?

En la actividad del PDF, pedimos:

una página personalizada de error 404

que nginx debe servir

pero que el usuario NO pueda visitar directamente

La página era:

``/internos/p404.html``


Queremos:

si el usuario visita /loquesea → error 404 → nginx sirve p404.html

si el usuario visita /internos/p404.html → 403 Forbidden

Para eso usamos error_page + internal.

# 🟪 Paso 1 — Definir la página de error 404
``error_page 404 /internos/p404.html;``


Esto significa:

cuando nginx detecta un error 404

en vez de mostrar la típica página fea

servirá el archivo p404.html que está en /internos

# 🟪 Paso 2 — Proteger la ruta usando internal
``
location /internos {
    internal;
}
``
✔ Significado:

cualquier intento del usuario de entrar a /internos/... dará 403 Forbidden

pero nginx sí podrá entrar ahí cuando necesite entregar la página 404 personalizada

Este comportamiento es EXACTAMENTE lo que pide el profesor.

# 🟣 Código final completo
# Página de error 404 personalizada
``error_page 404 /internos/p404.html;``

# Directorio interno: solo accesible por nginx, no por el cliente
``
location /internos {
    internal;
}
``

# 🟢 ¿Qué ocurre?
📌 Caso 1: El cliente pide un archivo que no existe

Ejemplo:

``/noexiste.html``


nginx ve que no existe → 404

busca la página de error definida en:

``/internos/p404.html``


aunque está en un location internal, nginx sí puede acceder

nginx envía p404.html al cliente

el cliente NO ve la URL real del archivo interno

📌 Caso 2: El cliente intenta entrar a /internos/p404.html

El navegador pide:

``/internos/p404.html``


Pero nginx responde:

403 Forbidden


¿Por qué?
✔ Porque internal bloquea accesos directos de clientes.

# 🟣 Resumen
- `error_page 404 /internos/p404.html;`
  → nginx usará esa página cuando haya un 404.

- `location /internos { internal; }`
  → los clientes no pueden acceder a /internos (403),
    pero nginx sí puede usar los archivos internos.

---

# 🟣 Redirección interna con try_files dentro de /secreto

Cuando entres a /secreto o /secreto/

nginx te lleve automáticamente a:

``/secreto/interno/secreto.html``


Independientemente de si el usuario pone el archivo o no.

Vamos a explicarlo todo clarísimo, con el código final y la lógica interna paso a paso.

# 🟪 Situación inicial

Estructura de directorios:
``
/var/www/agenda/secreto/secreto.html
/var/www/agenda/secreto/interno/secreto.html
``

Se quiere:

✔ /secreto
✔ /secreto/
❗ ambos deben mostrar automáticamente:
``/secreto/interno/secreto.html``


Pero si el usuario pide:

``/secreto/secreto.html``


Debe mostrar el que está en /secreto/, no el de interno.

—

# 🟪 Código que se usa en el PDF:
``
location /secreto {
    index secreto.html;
    try_files $uri/interno/ $uri/ $uri =404;
}
``

# 🟣 Explicación completa del try_files

El bloque es:

``try_files $uri/interno/ $uri/ $uri =404;``


Cada opción se prueba en orden.

🔹 Opción 1: $uri/interno/

Esto significa:

si ``$uri`` es /secreto

nginx prueba: ``/secreto/interno/``

Si existe un directorio llamado interno dentro de secreto, nginx hace una redirección implícita y vuelve a evaluar /secreto/interno/.

✔ Sí existe → /secreto/interno/ → entonces se recarga la petición apuntando ahí.

🔹 Opción 2: $uri/

Si ahora la URI es:

``/secreto/interno/``


nginx prueba:

``/secreto/interno/``


Esto sí es un directorio, así que nginx añade el index:

``/secreto/interno/secreto.html``


Y lo sirve al cliente.

🔹 Opción 3: $uri

Si el usuario pide:

``/secreto/secreto.html``


Entonces:

``$uri/interno/`` → no existe

``$uri/`` → no tiene / final, no existe

``$uri`` → es un archivo real → se sirve

Esto es EXACTAMENTE lo que pide el profesor:
✔ /secreto/secreto.html muestra la versión “normal”
✔ /secreto muestra la versión de interno

🔹 Última opción: =404

Si todo lo anterior falla → error 404.

# 🟢 Comportamiento final (Resumen claro):
✔ Si entras a /secreto

nginx hace:

```
/secreto/interno/ → existe

/secreto/interno/ es un directorio → usa index secreto.html
```

Sirve:

``/secreto/interno/secreto.html``

✔ Si entras a /secreto/

Resultado idéntico al anterior.

✔ Si entras a /secreto/secreto.html

``$uri/interno/`` no existe

``$uri/`` no existe

``$uri`` existe →
nginx sirve:

``/secreto/secreto.html``

✔ Si entras a /secreto/inexistente

No existe → 404 personalizado si está configurado.

# 🟣 Código completo final para tu repositorio
```
location /secreto {
    # Archivo por defecto cuando estemos en un directorio con index
    index secreto.html;

    # Redirección interna controlada:
    # 1. /secreto → /secreto/interno/
    # 2. /secreto/ → /secreto/interno/
    # 3. /secreto/secreto.html → ese archivo directamente
    try_files $uri/interno/ $uri/ $uri =404;
}
```
