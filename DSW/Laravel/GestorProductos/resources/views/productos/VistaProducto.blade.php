<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Producto</title>
</head>
<body>

<h1>Producto</h1>

@if ($producto)
    <p><strong>ID:</strong> {{ $producto->id }}</p>
    <p><strong>Nombre:</strong> {{ $producto->nombre }}</p>
@else
    <p>Producto no encontrado.</p>
@endif

<a href="/productos">Volver al listado</a>

</body>
</html>
