




# 🧩 PASO 2 — Instalar LARAVEL INSTALLER

## 🔹 5️⃣ Instalar Laravel con Composer

```bash
composer global require laravel/installer
```

⏳ Puede tardar un poco.

---

## 🔹 6️⃣ Añadir Laravel al PATH (PASO CRÍTICO EN LINUX)

Ejecuta:

```bash
echo $HOME/.config/composer/vendor/bin
```

Si la ruta **NO está en el PATH**, añade esto al final de tu `~/.bashrc` o `~/.zshrc`:

```bash
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
```

Luego recarga:

```bash
source ~/.bashrc
```

(o `source ~/.zshrc` si usas zsh)

---

## 🔹 7️⃣ Comprobar Laravel

```bash
laravel --version
```

✔️ Si sale versión → **PASO 1 COMPLETADO 🎉**

---

## 🧠 Tranquilidad para clase

Estás haciendo:

* Linux real ✔️
* Composer global ✔️
* Laravel Installer ✔️

👉 Es **exactamente** lo que pide la práctica.

---

## 👉 Tu turno ahora

Ve ejecutando **uno a uno** los comandos y dime:

* ✅ hasta qué paso llegaste
* ❌ si aparece algún error, **cópialo tal cual**

Cuando tengas `laravel --version`, pasamos **directos al PASO 2: crear el proyecto `GestorProductos`** 🚀
