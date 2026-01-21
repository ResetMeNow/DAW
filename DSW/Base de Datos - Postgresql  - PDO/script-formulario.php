<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario conexión</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            padding: 30px;
        }
        .container {
            max-width: 800px;
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
        input, button {
            padding: 6px;
            margin: 5px 0;
            width: 100%;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        a {
            display: inline-block;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="container">

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $host = $_POST['host'];
    $dbname = $_POST['dbname'];
    $user = $_POST['user'];
    $password = $_POST['password'];

    try {
        $dsn = "pgsql:host=$host;dbname=$dbname";
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]);

        echo "<p class='success'>Conexión realizada correctamente.</p>";

        $stmt = $pdo->query("SELECT * FROM producto");
        $filas = $stmt->rowCount();

        echo "<table>";
        echo "<tr><th>ID</th><th>Nombre</th><th>Precio</th><th>Fabricante</th></tr>";

        foreach ($stmt as $fila) {
            echo "<tr>";
            echo "<td>{$fila['id']}</td>";
            echo "<td>{$fila['nombre']}</td>";
            echo "<td>{$fila['precio']}</td>";
            echo "<td>{$fila['id_fabricante']}</td>";
            echo "</tr>";
        }

        echo "</table>";
        echo "<p>La tabla producto contiene $filas filas.</p>";
        echo "<a href='script-formulario.php'>Volver al formulario</a>";

    } catch (PDOException $e) {
        echo "<p>Error de conexión: {$e->getMessage()}</p>";
    }

} else {
?>

<h1>Formulario de conexión</h1>

<form method="post">
    <label>Servidor</label>
    <input type="text" name="host" value="localhost">

    <label>Base de datos</label>
    <input type="text" name="dbname" value="tienda">

    <label>Usuario</label>
    <input type="text" name="user" value="postgres">

    <label>Contraseña</label>
    <input type="password" name="password">

    <button type="submit">Conectar</button>
</form>

<?php } ?>

</div>
</body>
</html>

