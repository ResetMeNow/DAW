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
