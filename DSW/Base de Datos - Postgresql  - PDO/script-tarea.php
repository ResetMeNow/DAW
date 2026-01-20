<?php
// Datos de la base de datos
$host = 'localhost';
$dbname = 'tienda';
$user = 'postgres';
$password = '123456'; 


try {
    // Conexión a la base de datos PostgreSQL
    $dsn = "pgsql:host=$host;dbname=$dbname";
    $dbh = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    // Muestra el mensaje de error en caso de fallo de conexión
    echo 'Error de conexión: ' . $e->getMessage();
    exit; // Salir del script si la conexión falla
}
    $options = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false,
    );
try {
    // Preparar la consulta SQL
    // Se usan comillas dobles para asegurar la precisión con nombres de tabla o columna en minúscula
    $stmt = $dbh->prepare('SELECT nombre FROM producto');

    // Especificar el modo de obtención de resultados (asociativo)
    $stmt->setFetchMode(PDO::FETCH_ASSOC);

    // Ejecutar la consulta
    $stmt->execute();

    // Mostrar los resultados
    while ($row = $stmt->fetch()) {
        echo "Nombre: " . htmlspecialchars($row['nombre']) . "<br>";
    }
} catch (PDOException $e) {
    echo 'Error al ejecutar la consulta: ' . $e->getMessage();
}
?>

