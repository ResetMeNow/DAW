<?php
 header('Content-Type: application/json');
 
 $HOST = 'localhost';
 $USER = 'postgres';                    
 $PASSWORD = 'XXXX';     
 $DBNAME = 'bd_examen';

 try {
     $dsn = "pgsql:host=$HOST;dbname=$DBNAME";
     $pdo = new PDO($dsn, $USER, $PASSWORD);            
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo json_encode(['Error de conexión a la base de datos ']);
        exit();
 }

 $method = $_SERVER['REQUEST_METHOD'];

 if ($method == 'GET') {
     $sql = "SELECT * FROM producto";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();

        $datos = $stmt->fetchAll(PDO::FETCH_ASSOC); 
        echo json_encode($datos);
        exit();
}

    if ($method == 'POST') {

    $data = json_decode(file_get_contents('php://input'), true);
    $sql = "INSERT INTO producto (nombre, id_fabricante, precio)
        VALUES (:nombre, :id_fabricante, :precio)";


    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':nombre', $data['nombre']);
    $stmt->bindParam(':id_fabricante', $data['id_fabricante']);
    $stmt->bindParam(':precio', $data['precio']);
    
    if ($stmt->execute()) {
        echo json_encode(['message' => 'Producto creado exitosamente']);
    } else {
        echo json_encode(['message' => 'Error al crear el producto']);
    }
    exit();
}

echo json_encode(['message' => 'Método no soportado']);
 