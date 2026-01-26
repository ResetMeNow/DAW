<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit;
}

$usuario = $_SESSION['usuario'];
$archivo = 'frases_' . $usuario . '.txt';
$mensaje = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['logout'])) {
        session_destroy();
        header("Location: login.php");
        exit;
    }
    
    if (isset($_POST['nueva_frase'])) {
        $frase = trim($_POST['nueva_frase']);
        if (!empty($frase)) {
            file_put_contents($archivo, $frase . "\n", FILE_APPEND);
            $mensaje = "Frase agregada";
        } else {
            $mensaje = "La frase no puede estar vacía";
        }
    }
}

$frases = file_exists($archivo) ? file($archivo, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) : [];
?>
<!DOCTYPE html>
<html>
<head>
    <title>Mis Frases</title>
</head>
<body>
    <h1>MIS FRASES</h1>
    
    <p>Usuario: <strong><?php echo $usuario; ?></strong></p>
    
    <?php if ($mensaje): ?>
        <p><?php echo $mensaje; ?></p>
    <?php endif; ?>
    
    <h3>Frases almacenadas:</h3>
    <?php if (count($frases) > 0): ?>
        <ul>
            <?php foreach ($frases as $frase): ?>
                <li><?php echo htmlspecialchars($frase); ?></li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>No hay frases aún</p>
    <?php endif; ?>
    
    <form method="POST">
        <p>
            <textarea name="nueva_frase" rows="5" cols="40" placeholder="Escribe una frase..."></textarea>
        </p>
        <p>
            <input type="submit" value="Agregar">
            <input type="submit" name="logout" value="Salir">
        </p>
    </form>
</body>
</html>
