<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Producto</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            padding: 30px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,.1);
        }

        h1 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background: #222;
            color: white;
            width: 30%;
        }

        a {
            text-decoration: none;
            color: #0066cc;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Producto</h1>

    @if ($producto)
        <table>
            <tr>
                <th>ID</th>
                <td>{{ $producto->id }}</td>
            </tr>
            <tr>
                <th>Nombre</th>
                <td>{{ $producto->nombre }}</td>
            </tr>
        </table>
    @else
        <p class="error">Producto no encontrado.</p>
    @endif

    <a href="/productos">← Volver al listado</a>
</div>

</body>
</html>
