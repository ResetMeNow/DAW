# 🛠️ Configuración del proyecto Laravel (post-clone)

Este proyecto **NO incluye** los archivos `vendor/` ni `.env` por motivos de seguridad y buenas prácticas.

### 📥 1️⃣ Clonar el repositorio

```bash
git clone <url-del-repo>
cd GestorProductos
```

---

### 📦 2️⃣ Instalar dependencias

```bash
composer install
```

Esto generará la carpeta `vendor/`.

---

### ⚙️ 3️⃣ Crear archivo `.env`

Copia el archivo de ejemplo:

```bash
cp .env.example .env
```

---

### 🔑 4️⃣ Generar la clave de Laravel

```bash
php artisan key:generate
```

---

### 🗄️ 5️⃣ Configurar la base de datos

Edita el archivo `.env` y **ajusta estos valores** según tu entorno:

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1  
DB_PORT=5432
DB_DATABASE=tienda
DB_USERNAME=postgres
DB_PASSWORD=123456
```

> ⚠️ La base de datos `tienda` debe existir previamente
> (se creó en una práctica anterior).

---

### ▶️ 6️⃣ Arrancar el servidor

```bash
php artisan serve
```

Abrir en el navegador:

```
http://127.0.0.1:8000
```

---

### 📌 Rutas disponibles

* `/` → página de bienvenida de Laravel
* `/productos` → listado de productos
* `/productos/{id}` → detalle de un producto

---

## 🚫 Archivos ignorados por Git

El proyecto ignora correctamente:

```gitignore
/vendor
.env
```

---

## ✅ Estado del proyecto

✔ MVC funcionando
✔ Conexión a base de datos `tienda`
✔ Rutas, controlador, modelo y vistas operativas


