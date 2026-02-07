<?php
// Si existe la cookie, sumamos 1
if (isset($_COOKIE['visitas'])) {
    $visitas = $_COOKIE['visitas'] + 1;
} else {
    // Si no existe, empezamos en 1
    $visitas = 1;
}

// Guardamos la cookie (1 hora)
setcookie("visitas", $visitas, time() + 3600);


// VARIANTE: FECHA Y HORA ÚLTIMA VISITA
/*
if (isset($_COOKIE['ultima_visita'])) {
    $ultima = $_COOKIE['ultima_visita'];
} else {
    $ultima = "Primera visita";
}

setcookie("ultima_visita", date("d/m/Y H:i:s"), time() + 3600);
*/
?>

<h2>Contador de visitas</h2>
<p>Has visitado esta página <?php echo $visitas; ?> veces</p>

<?php
// Mostrar última visita SOLO si usas la variante
/*
echo "<p>Última visita: $ultima</p>";
*/
?>


<!--VARIANTE: BOTÓN RESET (POCO PROBABLE)
<form method="POST">
    <button name="reset">Resetear contador</button>
</form>
-->

<?php
/*
if (isset($_POST['reset'])) {
    setcookie("visitas", "", time() - 3600);
    header("Location: cookies.php");
    exit;
}
*/
?>
