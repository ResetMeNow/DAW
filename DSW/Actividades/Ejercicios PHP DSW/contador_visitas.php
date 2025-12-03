<html>
<head>
    <title>Contador de visitas mediante cookies</title>
</head>
<body>
    <?php
     $fecha = date(format:"d-m-y");
     $hora = date(format:"H.i.s");
     echo ("Hola, hoy es " . $fecha . " y son las" . $hora . ".");
     $accesosPagina = 1;
     if(isset($_COOKIE ['accesos'])){
         $accesosPagina = $_COOKIE['accesos'];//recuperamos una cookie
         setcookie (name: 'accesos', value: ++$accesosPagina, expires_or_options: time()+60); //le asignamos
    } 
     else
         setcookie(name: 'accesos', value: 1 , expires_or_options: time()+60);
     echo ("Has accedido a esta página" . $_COOKIE['accesos'] . "veces"); 
    ?>
    </b></p>
</body>
</html>
