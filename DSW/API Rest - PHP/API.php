<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$host = 'localhost';
$dbname = 'tienda';
$user = 'postgres';
$password = '123456';
$TOKEN = "123ABC";

try {
    $pdo = new PDO(
        "pgsql:host=$host;dbname=$dbname",
        $user,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );

    $method = $_SERVER['REQUEST_METHOD'];

    /* ========= GET ========= */
    if ($method === 'GET') {
        if (isset($_GET['id'])) {
            $stmt = $pdo->prepare("SELECT * FROM producto WHERE id = :id");
            $stmt->execute(['id' => $_GET['id']]);
            echo json_encode($stmt->fetch());
        } else {
            $stmt = $pdo->query("SELECT * FROM producto");
            echo json_encode($stmt->fetchAll());
        }
    }

    /* ========= POST ========= */
    elseif ($method === 'POST') {
        if (!isset($_SERVER['HTTP_AUTHORIZATION']) ||
            $_SERVER['HTTP_AUTHORIZATION'] !== "Bearer $TOKEN") {
            http_response_code(403);
            echo json_encode(["error" => "Token inválido"]);
            exit;
        }

        $data = json_decode(file_get_contents("php://input"), true);

        $stmt = $pdo->prepare(
            "INSERT INTO producto (nombre, precio, id_fabricante)
             VALUES (:nombre, :precio, :id_fabricante)"
        );

        $stmt->execute([
            'nombre' => $data['nombre'],
            'precio' => $data['precio'],
            'id_fabricante' => $data['id_fabricante']
        ]);

        echo json_encode(["mensaje" => "Producto insertado correctamente"]);
    }

    /* ========= PUT ========= */
    elseif ($method === 'PUT') {
        if (!isset($_SERVER['HTTP_AUTHORIZATION']) ||
            $_SERVER['HTTP_AUTHORIZATION'] !== "Bearer $TOKEN") {
            http_response_code(403);
            echo json_encode(["error" => "Token inválido"]);
            exit;
        }

        if (!isset($_GET['id'])) {
            echo json_encode(["error" => "ID no proporcionado"]);
            exit;
        }

        $data = json_decode(file_get_contents("php://input"), true);

        $stmt = $pdo->prepare(
            "UPDATE producto
             SET nombre = :nombre, precio = :precio, id_fabricante = :id_fabricante
             WHERE id = :id"
        );

        $stmt->execute([
            'nombre' => $data['nombre'],
            'precio' => $data['precio'],
            'id_fabricante' => $data['id_fabricante'],
            'id' => $_GET['id']
        ]);

        echo json_encode(["mensaje" => "Producto actualizado correctamente"]);
    }

    /* ========= DELETE ========= */
    elseif ($method === 'DELETE') {
        if (!isset($_SERVER['HTTP_AUTHORIZATION']) ||
            $_SERVER['HTTP_AUTHORIZATION'] !== "Bearer $TOKEN") {
            http_response_code(403);
            echo json_encode(["error" => "Token inválido"]);
            exit;
        }

        if (!isset($_GET['id'])) {
            echo json_encode(["error" => "ID no proporcionado"]);
            exit;
        }

        $stmt = $pdo->prepare("DELETE FROM producto WHERE id = :id");
        $stmt->execute(['id' => $_GET['id']]);

        echo json_encode(["mensaje" => "Producto eliminado correctamente"]);
    }

} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
