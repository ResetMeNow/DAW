# 🧩 PASO 1 — Preparar el entorno 
Esto es una práctica de Laravel para clases, después de leer contenidos teóricos y hacer el curso de Laravel pasamos a realizar la siguiente práctica.

Antes de crear nada, necesitamos confirmar que el entorno cumple los requisitos.

---

## Comprueba PHP

Ejecuta:

```bash
php -v
```
✔️ Debe salir **PHP 8.x**



## Comprueba Composer

```bash
composer --version
```

✔️ Si aparece versión → perfecto
❌ Si no existe → lo instalamos



## 4️⃣ Comprueba Laravel Installer

```bash
laravel --version
```

✔️ Si aparece versión → **PASO 1 HECHO**
❌ Si no → lo instalamos con Composer


### Si ves eso → **Ready** 

> [!TIP]
> Guía de como instalar.
<details>

<summary>Instalaciones</summary>

# ⏭️ Instalar COMPOSER en LINUX 

## 🔹 1️⃣ Descargar el instalador de Composer

Ejecuta **tal cual**:

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
```

## 🔹 2️⃣ Instalar Composer de forma global

Ejecuta:

```bash
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

## 🔹 3️⃣ Eliminar el instalador (limpieza)

```bash
php -r "unlink('composer-setup.php');"
```

---

## 🔹 4️⃣ Comprobar Composer

```bash
composer --version
```

✔️ Si ves versión → **Composer OK**


👉 Si el comando `composer` **no existe**, Linux dice:

> *No se ha encontrado la orden «composer»*

> *Hay que renombrar composer.phar a composer*

## ✅ SOLUCIÓN 

Si estás como `root`, ejecuta **tal cual** si no, usa root:

```bash
mv /usr/local/bin/composer.phar /usr/local/bin/composer
```

Después dale permisos (por si acaso):

```bash
chmod +x /usr/local/bin/composer
```

---

## 🔎 Comprobación (importante)

Ahora ejecuta:

```bash
composer --version
```

### ✔️ Resultado esperado:

```
Composer version 2.9.3
```
> Importante: `exit` de root para continuar con Laravel.

# ⏭️ Instalar Laravel Installer 
Ejecuta:

```bash
composer global require laravel/installer
```

⏳ Tardará un poco.

---

## 🔧 Añadir Laravel al PATH (MUY IMPORTANTE)

Cuando termine, ejecuta:

```bash
echo $HOME/.config/composer/vendor/bin
```

Ahora abre tu `~/.bashrc`:

```bash
nano ~/.bashrc
```

Y **al final del archivo** añade:

```bash
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
```

Guarda (`Ctrl+O` → Enter) y sal (`Ctrl+X`).

Luego recarga:

```bash
source ~/.bashrc
```

---

## 🔎 Comprobación final del PASO 1

```bash
laravel --version
```


</details>

---

# 🚀 PASO 2 — Crear el proyecto Laravel

(esto ya es la práctica como tal)

## 1️⃣ Elige carpeta de trabajo

```bash
cd ~
```

## 2️⃣ Crear el proyecto **GestorProductos**


```bash
laravel new GestorProductos
```

⏳ Tardará 1–2 minutos.

Cuando termine, debería aparecer una carpeta:

```bash
GestorProductos/
```

## 3️⃣ Entra al proyecto y ábrelo en VS Code

```bash
cd GestorProductos
code .
```

## 🧠

> *He creado un nuevo proyecto Laravel usando el instalador oficial, que genera la estructura MVC completa del framework.*

---

# 💡 PASO 3 — Configuración inicial del proyecto

> [!CAUTION]
> En caso de errores

<details>

<summary>Desplegar</summary>

### ⚠️ Instalar dependencias del proyecto

Algunos proyectos necesitan instalar las dependencias manualmente.

En la **terminal de la MV** (no Git Bash):

```bash
sudo apt update
sudo apt install -y \
php8.3-mbstring \
php8.3-xml \
php8.3-curl \
php8.3-zip \
php8.3-sqlite3 \
php8.3-bcmath
```

⏳ Tarda poco.

### ⚠️ Comprueba que PHP ya las tiene

```bash
php -m | grep -E "mbstring|xml|curl|zip|sqlite"
```

Si ves nombres → ✔️ correcto.

### ⚠️ Problema detectado durante la instalación

Composer requiere `git` para descargar ciertas dependencias.
Si `git` no está instalado, la carpeta `vendor/` se crea incompleta
y Laravel no puede arrancar.

Solución:

```bash
sudo apt install git
rm -rf vendor
composer install

```
Si la instalación de composer da problemas, sigue estos pasos:

### ⚠️ Borra vendor (limpio)

```bash
rm -rf vendor
```
### Instala **SIN** dependencias de desarrollo

Ejecuta **tal cual**:

```bash
composer install --no-dev --ignore-platform-reqs --prefer-dist --no-interaction --no-progress
```
💡 Esto **salta completamente `laravel/pint`**.

</details>


---

## 1️⃣ Comprobar que el proyecto funciona

Desde la carpeta del proyecto:

```bash
php artisan serve
```

Salida esperada:

```
Starting Laravel development server: http://127.0.0.1:8000
```

🔎 Abre en el navegador:

```
http://127.0.0.1:8000
```

✔️ Si aparece la página de bienvenida de Laravel → **servidor funcionando**

---

## 2️⃣ Crear el archivo `.env`

Laravel no usa directamente `.env.example`, hay que copiarlo.

```bash
cp .env.example .env
```

✔️ Se crea el archivo de configuración real del proyecto.

---

## 3️⃣ Generar la clave de la aplicación

```bash
php artisan key:generate
```

Salida esperada:

```
Application key set successfully.
```

🧠

> *La clave APP_KEY se utiliza para cifrado y seguridad interna del framework.*

---

## 4️⃣ Revisar configuración básica del `.env`

Abrimos el archivo:

```
.env
```

Y comprobamos que existen las siguientes variables (sin modificarlas todavía):

```env
APP_NAME=Laravel
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost
```

Y la configuración de base de datos:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=
```

> ⚠️ La base de datos **se configurará más adelante**, según indique la práctica.

---

> 🧠 *El proyecto Laravel está correctamente configurado, con servidor funcional, archivo de entorno creado y clave de aplicación generada.*

> [!CAUTION]
> En caso de errores 2

<details>
<summary>Desplegar</summary>

## ⚠️ Problemas encontrados y soluciones

### ❌ Error 1 — No existía la carpeta `vendor`

**Síntoma:**

```text
Failed opening required 'vendor/autoload.php'
```

**Causa:**
El proyecto Laravel se creó correctamente, pero **no se habían instalado las dependencias**.

**Solución:**

```bash
composer install
```

Esto creó la carpeta `vendor/` necesaria para que Laravel funcione.

---

### ❌ Error 2 — Archivo `.env` inexistente

**Síntoma:**
Laravel no encontraba configuración de entorno ni base de datos.

**Causa:**
Solo existía el archivo `.env.example`.

**Solución:**

```bash
cp .env.example .env
php artisan key:generate
```

---

### ❌ Error 3 — Error 500: base de datos SQLite inexistente

**Síntoma:**

```text
Database file does not exist
```

**Causa:**
Laravel venía configurado por defecto con **SQLite**, pero la práctica usa una base de datos llamada `tienda`.

**Solución:**
Modificar el archivo `.env` para conectar con la base de datos **tienda** usada en prácticas anteriores:

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=tienda
DB_USERNAME=postgres
DB_PASSWORD=123456
```

---

### ❌ Error 4 — Tablas `sessions` y `cache` no existen

**Síntoma:**

```text
relation "sessions" does not exist
relation "cache" does not exist
```

**Causa:**
Laravel intentaba guardar sesiones y caché en base de datos, pero esas tablas no existen en la BD `tienda`.

**Solución:**
Cambiar el sistema de sesiones a archivos (modo simple):

```env
SESSION_DRIVER=file
```

---

### ✅ Resultado final

* Laravel arranca correctamente
* Se muestra la página de bienvenida
* La conexión a la base de datos `tienda` funciona
* El entorno queda listo para continuar la práctica

```bash
php artisan serve
```

✔️ **Servidor funcionando correctamente**

</details>

---

# 🧱 PASO 4 — Crear controlador, modelo y vista

Según el enunciado de la práctica:

> *Para desarrollar nuestro proyecto crearemos un controlador, un modelo y una vista.*

* **Controlador**: `ControladorProductos`
* **Modelo**: `ModeloProductos`
* **Vista**: `VistaProductos`

---

### 1️⃣ Crear el controlador

Desde la raíz del proyecto, ejecuta:

```bash
php artisan make:controller ControladorProductos
```

✔️ Se crea el archivo:

```
app/Http/Controllers/ControladorProductos.php
```

🧠

> El controlador será el encargado de recibir las peticiones del usuario, comunicarse con el modelo y devolver la vista correspondiente.

---

### 2️⃣ Crear el modelo

Ejecuta:

```bash
php artisan make:model ModeloProductos
```

✔️ Se crea el archivo:

```
app/Models/ModeloProductos.php
```

🧠

> El modelo representará la tabla de productos de la base de datos `tienda` y permitirá realizar consultas desde Laravel.

---

### 3️⃣ Crear la vista

Las vistas se crean **manualmente** dentro de `resources/views`.

Ejecuta:

```bash
mkdir resources/views/productos
nano resources/views/productos/VistaProductos.blade.php
```

(El contenido lo rellenaremos en el siguiente paso, tal y como indica el PDF.)

---


## 🧭 PASO 5 — Definir las rutas de la aplicación

Ahora necesitamos decirle a Laravel **qué URL llama a qué controlador**.

---

### 1️⃣ Abrir el archivo de rutas

Edita el archivo:

```bash
nano routes/web.php
```

---

### 2️⃣ Añadir la ruta de productos

Dentro del archivo, añade **debajo de la ruta existente**:

```php
use App\Http\Controllers\ControladorProductos;

Route::get('/productos', [ControladorProductos::class, 'index']);
```

📌 El archivo debería quedar parecido a esto:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ControladorProductos;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/productos', [ControladorProductos::class, 'index']);
```

Guarda (`Ctrl + O` → Enter) y sal (`Ctrl + X`).

---


> Se ha definido una ruta `/productos` que llama al método `index` del controlador `ControladorProductos`.
> Cuando el usuario acceda a esa URL, Laravel ejecutará dicho método.

---

### 4️⃣ Probar la ruta (aún dará error, es normal)

Con el servidor levantado:

```bash
php artisan serve
```

Abre en el navegador:

```
http://127.0.0.1:8000/productos
```

❌ Verás un error porque **el método `index` todavía no existe**.
👉 Eso es correcto y esperado.

---


# 🎲 PASO 6 — Lógica del controlador (según PDF)

### 1️⃣ Abrir el controlador

```bash
nano app/Http/Controllers/ControladorProductos.php
```

### 2️⃣ Añadir el método `index`

Déjalo **así de simple**, sin BD todavía (tal como indica la práctica):

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ControladorProductos extends Controller
{
    public function index()
    {
        return view('productos.VistaProductos');
    }
}
```

Guarda: **Ctrl + O → Enter**
Sal: **Ctrl + X**

---

### 3️⃣ Editar la vista

```bash
nano resources/views/productos/VistaProductos.blade.php
```

Contenido mínimo para probar:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
</head>
<body>
    <h1>Listado de productos</h1>
    <p>VistaProductos funcionando correctamente.</p>
</body>
</html>
```

Guarda y sal.

---

### 4️⃣ Probar en el navegador

Con el servidor levantado:

```bash
php artisan serve
```

Abre:

```
http://127.0.0.1:8000/productos
```

✔️ **Ahora YA NO debe haber error**
✔️ Debes ver el texto de la vista

---



# 🎯 PASO 7 — Conectar el MODELO con la base de datos `tienda`

Ahora toca **lo que indica exactamente el PDF**:
👉 decirle al **modelo** qué tabla de la BD va a usar.

---

## 1️⃣ Editar el modelo `ModeloProductos`

Abre el archivo:

```bash
nano app/Models/ModeloProductos.php
```

---

## 2️⃣ Déjalo así (muy importante el `$table`)

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ModeloProductos extends Model
{
    protected $table = 'producto';
}
```

📌 Esto **NO lo habíamos hecho antes**, así que **sí es nuevo**.

* `producto` debe llamarse **igual que la tabla** en la BD `tienda`
* No añadimos nada más por ahora (tal como el PDF)

Guarda:

* `Ctrl + O` → Enter
* `Ctrl + X`


> *Se ha configurado el modelo ModeloProductos para que esté asociado a la tabla `producto` de la base de datos `tienda`.*

---



# 🔗 PASO 8 — Usar el MODELO en el CONTROLADOR

Ahora toca **leer datos reales de la base de datos `tienda`** usando el modelo y enviarlos a la vista.

---

## 1️⃣ Editar el controlador

Abre:

```bash
nano app/Http/Controllers/ControladorProductos.php
```

---

## 2️⃣ Código del controlador (según PDF)

Déjalo así:

```php
<?php

namespace App\Http\Controllers;

use App\Models\ModeloProductos;

class ControladorProductos extends Controller
{
    public function index()
    {
        $productos = ModeloProductos::all();

        return view('productos.VistaProductos', compact('productos'));
    }
}
```

📌 Qué hace esto:

* Usa el modelo `ModeloProductos`
* Consulta la tabla `producto`
* Pasa los datos a la vista como `$productos`

Guarda (`Ctrl + O` → Enter, `Ctrl + X`).

---

## 3️⃣ Ajustar la vista para mostrar datos

Edita la vista:

```bash
nano resources/views/productos/VistaProductos.blade.php
```

Cambia el contenido por:

```blade
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
</head>
<body>

<h1>Listado de productos</h1>

<ul>
    @foreach ($productos as $producto)
        <li>{{ $producto->nombre }}</li>
    @endforeach
</ul>

</body>
</html>
```

⚠️ `nombre` debe existir como columna en la tabla `producto`
(si en tu BD se llama distinto, me lo dices y lo adaptamos).

Guarda.

---

## 4️⃣ Probar en el navegador

Con el servidor activo:

```bash
php artisan serve
```

Abre:

```
http://127.0.0.1:8000/productos
```

### Resultado esperado:

* ✅ Si hay datos → lista de productos
* ❌ Si da error de columna → nombre del campo no coincide
* ❌ Si sale vacío → la tabla no tiene registros (también es válido)

---

> *En el controlador se utiliza el modelo ModeloProductos para obtener todos los registros de la tabla `producto` y enviarlos a la vista VistaProductos, donde se muestran en un listado.*

