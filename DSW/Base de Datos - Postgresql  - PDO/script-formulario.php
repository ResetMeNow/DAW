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

        echo "<p>Conexión realizada correctamente.</p>";

        $stmt = $pdo->query("SELECT * FROM producto");
        $filas = $stmt->rowCount();

        foreach ($stmt as $fila) {
            echo $fila['id'] . " - ";
            echo $fila['nombre'] . " - ";
            echo $fila['precio'] . " - ";
            echo $fila['id_fabricante'] . "<br>";
        }

        echo "<p>La tabla producto contiene $filas filas.</p>";

    } catch (PDOException $e) {
        echo "<p>Error de conexión: " . $e->getMessage() . "</p>";
    }

} else {
?>
<form method="post">
    <label>Servidor:</label><br>
    <input type="text" name="host" value="localhost"><br><br>

    <label>Base de datos:</label><br>
    <input type="text" name="dbname" value="tienda"><br><br>

    <label>Usuario:</label><br>
    <input type="text" name="user" value="postgres"><br><br>

    <label>Contraseña:</label><br>
    <input type="password" name="password"><br><br>

    <button type="submit">Conectar</button>
</form>
<?php
}
