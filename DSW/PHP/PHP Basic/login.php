<?php
session_start();

if (isset($_SESSION['usuario'])) {
    header("Location: frases.php");
    exit;
}

$error = isset($_SESSION['error_login']) ? $_SESSION['error_login'] : '';
if (isset($_SESSION['error_login'])) {
    unset($_SESSION['error_login']);
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>LOGIN</h2>
    
    <?php if ($error): ?>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php endif; ?>
    
    <form method="POST" action="chequear_login.php">
        <p>Usuario: <input type="text" name="usuario" required></p>
        <p>Contraseña: <input type="password" name="contrasena" required></p>
        <p><input type="submit" value="Entrar"></p>
    </form>
</body>
</html>
