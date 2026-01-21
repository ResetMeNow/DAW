<?php
// Datos de conexión
$host = "localhost";
$dbname = "tienda";
$user = "postgres";
$password = "123456";

try {
    $conexion = new PDO(
        "pgsql:host=$host;dbname=$dbname",
        $user,
        $password
    );
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}

// Consulta
$sql = "SELECT * FROM producto";
$stmt = $conexion->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de productos</title>

    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            margin-top: 20px;
            width: 60%;
        }
        th {
            background-color: #222;
            color: white;
        }
        td, th {
            border: 1px solid #999;
            padding: 8px 12px;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

<h1>Listado de productos</h1>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
        </tr>
    </thead>
    <tbody>
        <?php
        while ($producto = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>{$producto['id']}</td>";
            echo "<td>{$producto['nombre']}</td>";
            echo "<td>{$producto['precio']}</td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>

</body>
</html>
