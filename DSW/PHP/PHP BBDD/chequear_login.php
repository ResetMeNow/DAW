<?php
require 'conexion.php';

$usuario = $_POST['usuario'];
$password = $_POST['password'];

$sql = "SELECT * FROM usuarios WHERE usuario='$usuario' AND password='$password'";
$res = $pdo->query($sql);

if ($res->rowCount() == 1) {

    // cookie usuario
    setcookie("usuario", $usuario, time()+3600);

    // cookie visitas
    if (isset($_COOKIE['visitas'])) {
        $visitas = $_COOKIE['visitas'] + 1;
    } else {
        $visitas = 1;
    }
    setcookie("visitas", $visitas, time()+3600);

    // cookie fecha y hora
    setcookie("ultimo_acceso", date("d/m/Y H:i:s"), time()+3600);

    header("Location: tabla.php");
} else {
    echo "Usuario o contraseña incorrectos";
}
