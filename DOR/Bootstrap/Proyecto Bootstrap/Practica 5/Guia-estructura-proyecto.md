* Cómo estructurar el proyecto
* Qué debes hacer tú manualmente
* Qué partes se sacan directamente de la documentación de Bootstrap

---

## ✅ ESTRUCTURA BÁSICA DEL PROYECTO

### 1. Archivos que debes tener:

```
📁 proyecto/
├── index.html
├── deportes.html
├── rutas.html
├── contacto.html
├── 📁 img/
│   ├── pdc-logo.png
│   └── (otras imágenes)
├── 📁 css/ (opcional)
│   └── styles.css (si necesitas CSS adicional)
```

---

## 🧩 PASOS A SEGUIR

### PASO 1: Añadir Bootstrap

Copia esto dentro de `<head>`:

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
```

Y al final del `<body>`:

```html
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
```

### PASO 2: Crear el `navbar`

🔗 [Documentación navbar](https://getbootstrap.com/docs/5.3/components/navbar/)

Incluye:

* Logo: `<img src="img/pdc-logo.png" width="20" height="30"> Canarias`
* Links: Portada, Deportes, Rutas, Contáctanos
* Dos iconos SVG: `exclamation-circle-fill` y `exclamation-triangle-fill`
* Buscador: input + botón `btn-outline-success`

🛠 **Debes hacer tú**:

* Insertar el logo con tamaño exacto
* Poner los enlaces con rutas correctas
* Asegurar que el `navbar-collapse` colapse para xs, sm, md
* Alinear los iconos y el formulario correctamente

---

### PASO 3: Breadcrumb

🔗 [Documentación breadcrumb](https://getbootstrap.com/docs/5.3/components/breadcrumb/)

* En `index.html` aparece solo “Inicio”
* En las otras páginas aparece: “Inicio > Página actual”

---

### PASO 4: Grid con secciones y tarjetas

🔗 [Grid system](https://getbootstrap.com/docs/5.3/layout/grid/)

* Divide en dos zonas:

  * Un `nav` lateral con enlaces internos (secciones)
  * Un `main` con tarjetas/listas/tablas

---

### PASO 5: Contenido de `index.html`

#### 1. List Group con `badge` para población por provincias

🔗 [List group](https://getbootstrap.com/docs/5.3/components/list-group/)
🔗 [Badge](https://getbootstrap.com/docs/5.3/components/badge/)

* Usa `list-group-item` y al pasar el mouse, se sombrea (`list-group-item-action`)

#### 2. Tablas o secciones con contenido

🔗 [Table](https://getbootstrap.com/docs/5.3/content/tables/)

---

### PASO 6: Footer y ajustes finales

* Añade un `<footer>` con clase `bg-dark text-white text-center py-3`
* Asegúrate de usar clases de espaciado como `mt-4`, `mb-3`, `gap-2`, `text-center`

---

## 🔁 REPITE PARA LAS OTRAS PÁGINAS

* Usa la misma cabecera + breadcrumb ajustado
* Cambia el contenido del `main` según el archivo: deportes, rutas, contacto

---

## 🧠 CONSEJO FINAL

Empieza por montar **`index.html`** completo. Cuando funcione bien, **copia y adapta** para el resto de páginas. No empieces todas a la vez.

