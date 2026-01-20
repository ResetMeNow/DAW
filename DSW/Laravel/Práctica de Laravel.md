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
## 0️⃣ Instalar dependencias del proyecto

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

---

### 2️⃣ Comprueba que PHP ya las tiene

```bash
php -m | grep -E "mbstring|xml|curl|zip|sqlite"
```

Si ves nombres → ✔️ correcto.

---

Luego: 

```bash
composer install
```
</details>

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

## 🧠

> *El proyecto Laravel está correctamente configurado, con servidor funcional, archivo de entorno creado y clave de aplicación generada.*

---
