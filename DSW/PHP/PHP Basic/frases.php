<?php
$archivo = "frases.txt";
$mensaje = "";

if (!file_exists($archivo)) {
    fopen($archivo, "w");
    $mensaje = "El archivo frases.txt no existía y ha sido creado.";
}
if (isset($_POST['frase']) && $_POST['frase'] != "") {
    $f = fopen($archivo, "a");
    fwrite($f, $_POST['frase'] . PHP_EOL);
    fclose($f);
}

// ===============================
// BORRAR TODO EL CONTENIDO
// ===============================
/*
if (isset($_POST['borrar'])) {
    $f = fopen($archivo, "w"); // modo w borra el contenido
    fclose($f);
}
*/
?>

<h2>Almacenar frases</h2>

<?php
if ($mensaje != "") {
    echo "<p>$mensaje</p>";
}

if (filesize($archivo) == 0) {
    echo "<p>El archivo frases.txt está vacío.</p>";
} else {
    echo "<p>Frases almacenadas en el archivo:</p>";
    $f = fopen($archivo, "r");
    while (!feof($f)) {
        echo fgets($f) . "<br>";
    }
    fclose($f);
}
?>



<form method="POST">
    <input type="text" name="frase">
    <button>Guardar frase</button>
</form>

<!-- ===============================
VARIANTE: BOTÓN BORRAR
================================ -->

<!--
<form method="POST">
    <button name="borrar">Borrar todo</button>
</form>
-->
