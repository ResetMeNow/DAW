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

# ⏭️ PASO 1 — Instalar COMPOSER en LINUX 

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

# ⏭️ PASO 2 — Instalar Laravel Installer 
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


