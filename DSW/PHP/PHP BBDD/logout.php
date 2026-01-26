<?php
setcookie("usuario", "", time()-1);
setcookie("visitas", "", time()-1);
setcookie("ultimo_acceso", "", time()-1);
header("Location: login.php");
