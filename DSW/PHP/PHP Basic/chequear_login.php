<?php
session_start();

// Verificar que se han recibido los datos por POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['usuario']) || !isset($_POST['contrasena'])) {
    header("Location: login.php");
    exit;
}

$usuario = trim($_POST['usuario']);
$contrasena = trim($_POST['contrasena']);

// Validar que no estén vacíos
if (empty($usuario) || empty($contrasena)) {
    $_SESSION['error_login'] = "El usuario y la contraseña no pueden estar vacíos.";
    header("Location: login.php");
    exit;
}

// Ruta del archivo de accesos
$archivo_accesos = 'accesos.txt';

// Verificar que el archivo de accesos existe
if (!file_exists($archivo_accesos)) {
    $_SESSION['error_login'] = "Error: El archivo de accesos no existe. Por favor, intente más tarde.";
    header("Location: login.php");
    exit;
}

// Leer el archivo de accesos
$accesos = file($archivo_accesos, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

// Verificar credenciales
$usuario_valido = false;
foreach ($accesos as $linea) {
    list($user_archivo, $pass_archivo) = explode(':', $linea, 2);
    $user_archivo = trim($user_archivo);
    $pass_archivo = trim($pass_archivo);
    
    if ($usuario === $user_archivo && $contrasena === $pass_archivo) {
        $usuario_valido = true;
        break;
    }
}

if ($usuario_valido) {
    // Crear sesión con el usuario
    $_SESSION['usuario'] = $usuario;
    header("Location: frases.php");
    exit;
} else {
    // Credenciales inválidas
    $_SESSION['error_login'] = "Usuario o contraseña incorrectos.";
    header("Location: login.php");
    exit;
}
?>
