# 🚨 Guía Paso a Paso: Crear una Web con Bootstrap en 1 Hora (Tipo Examen)

> 🎯 Ideal para la parte práctica del examen de DOR. Basado en el ejercicio de clase. Apto para resolver en **menos de 1 hora**.

---

## ✅ PASOS GENERALES PARA CREAR TU WEB

### 1. Crear los archivos y estructura

* `index.html`
* Carpeta `img/` con logo e imágenes de fondo

### 2. Copiar la plantilla base de Bootstrap

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Canarias</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
  <!-- Contenido aquí -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

---

## 🧩 COMPONENTES QUE DEBES INCLUIR

### 3. Navbar con logo, enlaces y buscador

🔗 [Documentación Navbar](https://getbootstrap.com/docs/5.3/components/navbar/)

* Logo (`img/pdc-logo.png`)
* Enlaces `Portada`, `Deportes`, `Rutas`, `Contáctanos`
* Iconos de Bootstrap (`exclamation`, etc.)
* Input de búsqueda con botón

💡 **Cosas que debes escribir tú**:

* Las rutas de las imágenes
* Los nombres de los links si cambian
* El `id` del collapse del navbar (normalmente `navbarNav` o `navbarText`)

### 4. Grid con tarjetas o contenido

🔗 [Grid Bootstrap](https://getbootstrap.com/docs/5.3/layout/grid/)

* Usa `container`, `row` y `col-lg-4` o `col-md-6`
* Añade `mb-4`, `mt-4` para espaciado

💡 Puedes usar tarjetas con imágenes de fondo o textos informativos.

```html
<div class="container mt-4">
  <div class="row">
    <div class="col-12 col-md-6 col-lg-4">
      <div class="card p-3 text-center">Contenido</div>
    </div>
    <!-- Repetir -->
  </div>
</div>
```

### 5. Tarjetas con imagen y texto

🔗 [Cards Bootstrap](https://getbootstrap.com/docs/5.3/components/card/)

* Puedes usar imágenes de fondo con CSS inline:

```html
<div class="card text-white" style="background-image: url('img/fondo.jpg'); background-size: cover; background-position: center; height: 300px;">
  <div class="card-body bg-dark bg-opacity-75">
    <h5 class="card-title">Título</h5>
    <p class="card-text">Texto aquí</p>
  </div>
</div>
```

---

## ➕ COMPONENTES EXTRA (si te da tiempo)

### - Breadcrumb

🔗 [Breadcrumb](https://getbootstrap.com/docs/5.3/components/breadcrumb/)

```html
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item active">Inicio</li>
  </ol>
</nav>
```

### - Tabla de precios o actividades

🔗 [Table](https://getbootstrap.com/docs/5.3/content/tables/)

```html
<table class="table table-bordered">
  <thead class="table-success">
    <tr><th>Actividad</th><th>Precio</th></tr>
  </thead>
  <tbody>
    <tr><td>Senderismo</td><td>10€</td></tr>
  </tbody>
</table>
```

### - Lista con colores

🔗 [List Group](https://getbootstrap.com/docs/5.3/components/list-group/)

```html
<ul class="list-group">
  <li class="list-group-item list-group-item-success">Naturaleza</li>
  <li class="list-group-item list-group-item-warning">Historia</li>
</ul>
```

---

## 🧠 COSAS QUE DEBES HACER TÚ (¡NO OLVIDES!)

| Elemento            | ¿Automático? | ¿Lo haces tú? |
| ------------------- | ------------ | ------------- |
| CDN Bootstrap       | ✅            | No            |
| CDN Icons           | ✅            | No            |
| Imágenes            | ❌            | ✅ Ruta manual |
| Cambiar textos      | ❌            | ✅ Siempre     |
| Usar `container`    | ❌            | ✅ Siempre     |
| Poner `collapse` ID | ❌            | ✅             |
| Botón responsive    | ✅            | Solo copiar   |

---

## ⏱️ ESTRATEGIA PARA 1 HORA

1. **(10 min)** Copia la estructura base + navbar
2. **(10 min)** Añade imágenes y enlaces
3. **(15 min)** Maqueta 3 columnas con tarjetas
4. **(15 min)** Añade buscador, breadcrumb o lista/tabla
5. **(10 min)** Repasa, corrige rutas, ajusta colores y responsive

✅ ¡Y LISTO!
