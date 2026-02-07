<?php
session_start();

if (isset($_POST['enviar'])) {

    // USUARIO FIJO
    if ($_POST['usuario'] == "admin" && $_POST['password'] == "1234") {
        $_SESSION['usuario'] = $_POST['usuario'];
    }

    // ===============================
    // VARIANTE: USUARIOS DESDE FICHERO
    // ===============================
    /*
    $f = fopen("usuarios.txt", "r");
    while (!feof($f)) {
        $linea = trim(fgets($f));
        if ($linea != "") {
            list($u, $p) = explode(":", $linea);
            if ($_POST['usuario'] == $u && $_POST['password'] == $p) {
                $_SESSION['usuario'] = $u;
            }
        }
    }
    fclose($f);
    */
}

if (isset($_POST['logout'])) {
    session_destroy();
    header("Location: login.php");
    exit;
}
?>

<?php if (isset($_SESSION['usuario'])): ?>

<h2>Bienvenido <?php echo $_SESSION['usuario']; ?></h2>

<form method="POST">
    <button name="logout">Cerrar sesión</button>
</form>

<?php else: ?>

<h2>Login</h2>

<form method="POST">
    <input type="text" name="usuario" placeholder="Usuario">
    <input type="password" name="password" placeholder="Contraseña">
    <button name="enviar">Entrar</button>
</form>

<?php endif; ?>
