<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$host = 'localhost';
$dbname = 'tienda';
$user = 'postgres';
$password = '123456';
$TOKEN = "123ABC";

try {
    $dsn = "pgsql:host=$host;dbname=$dbname";
    $pdo = new PDO($dsn, $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    $method = $_SERVER['REQUEST_METHOD'];

    // ===== GET =====
    if ($method === 'GET') {

        if (isset($_GET['id'])) {
            $stmt = $pdo->prepare("SELECT * FROM producto WHERE id = :id");
            $stmt->execute(['id' => $_GET['id']]);
            $data = $stmt->fetch();
        } else {
            $stmt = $pdo->query("SELECT * FROM producto");
            $data = $stmt->fetchAll();
        }

        echo json_encode($data);
    }

    // ===== POST =====
    elseif ($method === 'POST') {

        if (!isset($_SERVER['HTTP_AUTHORIZATION'])) {
            http_response_code(401);
            echo json_encode(["error" => "Token no proporcionado"]);
            exit;
        }

        if ($_SERVER['HTTP_AUTHORIZATION'] !== "Bearer $TOKEN") {
            http_response_code(403);
            echo json_encode(["error" => "Token incorrecto"]);
            exit;
        }

        $input = json_decode(file_get_contents("php://input"), true);

        $stmt = $pdo->prepare(
            "INSERT INTO producto (nombre, precio, id_fabricante)
             VALUES (:nombre, :precio, :id_fabricante)"
        );

        $stmt->execute([
            'nombre' => $input['nombre'],
            'precio' => $input['precio'],
            'id_fabricante' => $input['id_fabricante']
        ]);

        echo json_encode(["mensaje" => "Producto insertado correctamente"]);
    }

} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
