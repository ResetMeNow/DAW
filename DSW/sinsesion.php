<?php
session_start();

// Iniciar sesión
if (isset($_POST['iniciar'])) {
    $_SESSION['activa'] = true;
}

// Cerrar sesión
if (isset($_POST['cerrar'])) {
    session_destroy();
    header("Location: sinsesion.php");
    exit;
}
?>

<?php if (isset($_SESSION['activa'])): ?>

<h2>Sesión iniciada</h2>
<p>Bienvenido a la zona privada.</p>

<form method="POST">
    <button name="cerrar">Cerrar sesión</button>
</form>

<?php else: ?>

<h2>No hay sesión iniciada</h2>

<form method="POST">
    <button name="iniciar">Iniciar sesión</button>
</form>

<?php endif; ?>
