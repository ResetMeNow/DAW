<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de productos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            padding: 30px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
        }

        th {
            background: #222;
            color: white;
        }

        h1 {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Listado de productos</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
        </tr>

        @foreach ($productos as $producto)
            <tr>
                <td>{{ $producto->id }}</td>
                <td>{{ $producto->nombre }}</td>
            </tr>
        @endforeach
    </table>
</div>

</body>
</html>

