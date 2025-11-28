###👉 Si Debian NO tuviera sudo (muy raro), entonces:

Entras como root:

```su```


Instalas sudo:

```apt update
apt install sudo```


Añades tu usuario al grupo sudo:

```usermod -aG sudo alumno```

📌Y desde ese momento YA puedes usar sudo.

---

### 🔵 ¿Cómo se prueba PHP con curl?

En la VM:

curl http://localhost/info.php


o

curl IP_VM/info.php

Si PHP-FPM está bien configurado, verás texto muy largo con información de PHP.