<?php
//trim sirve para quitar espacios por delante o por detrás:
//con todo esta cadena quitamos caracteres especiales
$edad = trim(htmlspecialchars( ($_REQUEST["edad"]), ENT_QUOTES, "UTF-8"));

$email = $_REQUEST["email"];

if (is_numeric ($edad)){
    print "Tu edad es $edad";
} else {
    Echo "ERROR";
}

if(filter_var($email, FILTER_VALIDATE_EMAIL)){
    print "Email correcto";
}else{
    "Email incorrecto";
}

?>