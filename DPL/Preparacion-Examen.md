***Explicaciones del próximo Exámen***
---
🧩 **EJERCICIO 1 — ¿Qué hace nginx cuando piden info.php?**

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



# ✅ **Respuesta**

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

