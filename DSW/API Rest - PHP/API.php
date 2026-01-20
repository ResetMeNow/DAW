<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

// Datos de conexión
$host = 'localhost';
$dbname = 'tienda';
$user = 'postgres';
$password = '123456';

try {
    $dsn = "pgsql:host=$host;dbname=$dbname";
    $pdo = new PDO($dsn, $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // Comprobamos si viene un id
    if (isset($_GET['id'])) {
        $sql = "SELECT * FROM producto WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $_GET['id']]);
        $resultado = $stmt->fetch();
    } else {
        $sql = "SELECT * FROM producto";
        $stmt = $pdo->query($sql);
        $resultado = $stmt->fetchAll();
    }

    echo json_encode($resultado);

} catch (PDOException $e) {
    echo json_encode([
        "error" => $e->getMessage()
    ]);
}
