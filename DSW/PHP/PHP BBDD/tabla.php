<?php
/* --- PROTECCIÓN --- */
if (!isset($_COOKIE['usuario'])) {
    die("Acceso denegado");
}

require 'conexion.php';

/* --- COOKIES --- */
$usuario = $_COOKIE['usuario'];
$visitas = $_COOKIE['visitas'] ?? 1;
$ultimo  = $_COOKIE['ultimo_acceso'] ?? 'Primera visita';

/* --- INSERTAR PRODUCTO --- */
if (isset($_POST['insertar'])) {
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $id_fabricante = $_POST['id_fabricante'];

    $sqlInsert = "
        INSERT INTO producto (nombre, precio, id_fabricante)
        VALUES (?, ?, ?)
    ";
    $stmt = $pdo->prepare($sqlInsert);
    $stmt->execute([$nombre, $precio, $id_fabricante]);
}

/* --- CONSULTA BD --- */
$sql = "
SELECT 
    producto.id,
    producto.nombre,
    producto.precio,
    fabricante.nombre AS fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY fabricante.nombre, producto.precio, producto.id
";
$resultado = $pdo->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
</head>
<body>

<h2>Bienvenido <?= $usuario ?></h2>

<p>
    Visitas: <?= $visitas ?><br>
    Último acceso: <?= $ultimo ?>
</p>

<hr>

<h3>Productos en la base de datos</h3>

<table border="1">
<tr>
    <th>Nombre</th>
    <th>Precio</th>
    <th>Fabricante</th>
</tr>

<?php while ($fila = $resultado->fetch()): ?>
<tr>
    <td><?= $fila['nombre'] ?></td>
    <td><?= $fila['precio'] ?> €</td>
    <td><?= $fila['fabricante'] ?></td>
</tr>
<?php endwhile; ?>

</table>

<hr>

<h3>Añadir producto</h3>

<form method="post">
    Nombre: <input type="text" name="nombre" required><br><br>
    Precio: <input type="number" step="0.01" name="precio" required><br><br>
    ID fabricante: <input type="number" name="id_fabricante" required><br><br>
    <input type="submit" name="insertar" value="Añadir producto">
</form>

<br>
<a href="logout.php">Salir</a>

</body>
</html>
