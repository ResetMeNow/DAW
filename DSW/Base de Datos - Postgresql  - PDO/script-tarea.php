<?php
// Datos de conexión
$host = 'localhost';
$dbname = 'tienda';
$user = 'postgres';
$password = '123456';

try {
    // Cadena de conexión
    $dsn = "pgsql:host=$host;dbname=$dbname";

    // Opciones de PDO
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];

    // Conexión a la base de datos
    $pdo = new PDO($dsn, $user, $password, $options);

    // Consulta SQL
    $sql = "SELECT * FROM producto";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Mostrar resultados
    while ($fila = $stmt->fetch()) {
        echo $fila['id'] . " - ";
        echo $fila['nombre'] . " - ";
        echo $fila['precio'] . " - ";
        echo $fila['id_fabricante'] . "<br>";
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

