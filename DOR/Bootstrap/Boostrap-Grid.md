# Apuntes Esenciales de Bootstrap + Grid

## ✨ INTRODUCCIÓN

Bootstrap es un framework de CSS que te ayuda a construir diseños responsivos rápidos.
Incluye un sistema de columnas (grid), componentes como botones, tarjetas, tablas y utilidades como espaciado, colores, tipografía, etc.

En el examen **podrás consultar la documentación**, pero necesitas **entender cuándo usar cada cosa**.

---

## 🔹 ESTRUCTURA GENERAL EN BOOTSTRAP

```html
<div class="container">
  <div class="row">
    <div class="col">Columna 1</div>
    <div class="col">Columna 2</div>
  </div>
</div>
```

* `.container` = margen automático a los lados (contenido centrado)
* `.container-fluid` = ancho completo
* `.row` = crea una fila para columnas
* `.col` o `.col-4` = columna (12 es el total de columnas por fila)

## 🔹 RESPONSIVE CON GRID

```html
<div class="col-lg-4 col-md-6 col-12">
```

* `col-lg-4`: en pantallas grandes ocupa 4 columnas
* `col-md-6`: en medianas ocupa 6 columnas
* `col-12`: en pequeñas ocupa toda la fila

**Total siempre debe sumar 12 en una fila si las quieres alineadas horizontalmente**.

---

## 🏠 NAVBAR

### Estructura básica

```html
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Marca</a>
    <button class="navbar-toggler" ...></button>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
      </ul>
    </div>
  </div>
</nav>
```

### Claves:

* `navbar-expand-lg`: se colapsa en pantallas pequeñas
* `navbar-dark` + `bg-dark`: textos blancos sobre fondo oscuro
* `navbar-toggler`: botón que muestra/oculta el menú en responsive

### Formulario de búsqueda dentro del navbar:

```html
<form class="d-flex mt-3 mt-lg-0" role="search">
  <input class="form-control me-2 bg-white" type="search" placeholder="Search">
  <button class="btn btn-outline-success" type="submit">Search</button>
</form>
```

---

## 🌐 CLASES RESPONSIVAS COMUNES

* `mt-3`, `mb-4`, `ms-2`, `me-2`: margen arriba, abajo, izquierda, derecha
* `d-flex`: alinea en horizontal (display flex)
* `align-items-center`: centra en vertical
* `gap-2`, `gap-3`: separación entre elementos hijos

---

## 📄 TARJETAS (CARDS)

```html
<div class="card">
  <img src="..." class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">Título</h5>
    <p class="card-text">Texto</p>
  </div>
</div>
```

* Puedes meterlas dentro de `col-*` para hacer grillas
* Se pueden combinar con `list-group` o tablas si hace falta

---

## 📊 TABLAS

```html
<table class="table table-bordered table-hover">
  <thead class="table-dark">
    <tr><th>#</th><th>Producto</th></tr>
  </thead>
  <tbody>
    <tr><td>1</td><td>Queso</td></tr>
  </tbody>
</table>
```

* Usa `thead` para los títulos y puedes colorearlo
* Puedes aplicar `table-warning`, `table-primary`, etc.

---

## 🌟 LISTAS

```html
<ul class="list-group">
  <li class="list-group-item bg-warning-subtle">Elemento</li>
</ul>
```

* Si quieres color, aplícalo al `<li>` y no al `<ul>`

---

## 💡 CONSEJOS PARA EL EXAMEN 


* ✅ Empieza por la estructura: `container > row > col`
* ✅ Usa `d-flex` + `gap-*` para alinear elementos como iconos
* ✅ Apóyate en la documentación de:

  * [Navbar](https://getbootstrap.com/docs/5.3/components/navbar/)
  * [Grid](https://getbootstrap.com/docs/5.3/layout/grid/)
  * [Cards](https://getbootstrap.com/docs/5.3/components/card/)
  * [Tables](https://getbootstrap.com/docs/5.3/content/tables/)
  * [List group](https://getbootstrap.com/docs/5.3/components/list-group/)
  * [Utilities (espaciado, color)](https://getbootstrap.com/docs/5.3/utilities/spacing/)

---

## ✅ 1. Collapse y Responsive

Bootstrap es **mobile first**. Es decir:

* En pantallas pequeñas: todo se apila verticalmente (`col-12`)
* En pantallas grandes: se alinea horizontalmente si usas `col-md-*`, `col-lg-*`, etc.

Ejemplo:

```html
<div class="col-lg-4 col-md-6 col-12">...</div>
```

En los menús colapsables (como el navbar), todo lo que quieras ocultar en pantallas pequeñas debe ir dentro de:

```html
<div class="collapse navbar-collapse" id="navbarNav">...</div>
```

---

## ✅ 2. Alinear íconos con enlaces o botones

Usa `d-flex align-items-center gap-2` para alinear:

```html
<div class="d-flex align-items-center gap-2">
  <ul class="navbar-nav">
    <li><a class="nav-link" href="#">Portada</a></li>
  </ul>
  <i class="bi bi-exclamation-triangle-fill text-warning"></i>
</div>
```

---

## ✅ 3. Breadcrumb

Muy fácil de olvidar, pero también muy fácil de implementar:

```html
<nav style="--bs-breadcrumb-divider: '>'" aria-label="breadcrumb">
  <ol class="breadcrumb m-2">
    <li class="breadcrumb-item active" aria-current="page">Portada</li>
  </ol>
</nav>
```

---

## ✅ 4. Alineación y espaciado con utilidades

| Clase                 | Para qué sirve                |
| --------------------- | ----------------------------- |
| `d-flex`              | Alinear horizontalmente       |
| `align-items-center`  | Centrar verticalmente         |
| `justify-content-end` | Alinear a la derecha          |
| `gap-2` / `gap-3`     | Espacio entre elementos hijos |
| `mt-3`, `mb-4`        | Margen arriba / abajo         |
| `ms-3`, `me-3`        | Margen izq / der              |

---

## ✅ 5. `container` vs `container-fluid`

| Clase             | Uso                                         |
| ----------------- | ------------------------------------------- |
| `container`       | Contenido centrado con márgenes automáticos |
| `container-fluid` | Ocupar todo el ancho de la pantalla         |

---

## ✅ 6. Colorear tablas correctamente

```html
<table class="table table-bordered">
  <thead class="table-warning">
  <tbody class="table-warning">
```

O por fila:

```html
<tr class="table-warning">...</tr>
```

No apliques `bg-warning` al `table` directamente.

---

## ✅ 7. Librería JavaScript obligatoria

El `navbar` (toggler) no funciona si no añades esto al final del `body`:

```html
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
```

---

## ✅ 8. Orden correcto del HTML

```html
<!DOCTYPE html>
<html>
<head> ... </head>
<body>

  <!-- navbar -->
  <!-- breadcrumb -->
  <main class="container">...</main>
  <footer>...</footer>

  <!-- scripts -->
</body>
</html>
```

---

## ✅ Extras recomendables para repasar

* [Navbar - Bootstrap Docs](https://getbootstrap.com/docs/5.3/components/navbar/)
* [Grid System](https://getbootstrap.com/docs/5.3/layout/grid/)
* [Utilities: Spacing](https://getbootstrap.com/docs/5.3/utilities/spacing/)
* [Tables](https://getbootstrap.com/docs/5.3/content/tables/)
* [List group](https://getbootstrap.com/docs/5.3/components/list-group/)


