<?php
//Ejercicio para comprobar que el email es correcto, coincide con su confirmación y se aplican los distintos select.
$email = trim(htmlspecialchars( ($_REQUEST["email"]), ENT_QUOTES, "UTF-8"));
$confirmacion = trim(htmlspecialchars( ($_REQUEST["confirmacion"]), ENT_QUOTES, "UTF-8"));
$noticias = trim(htmlspecialchars( ($_REQUEST["noticias"]), ENT_QUOTES, "UTF-8"));

if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
    print "Error en el email";
 }else if(!filter_var($confirmacion, FILTER_VALIDATE_EMAIL)){
   print "Error en la confirmación";
} else if ($email != $confirmacion) {
    print "Los emails deben coincidir, es decir, ser iguales :D";
} else if ($noticias == -1){
    print "Debe indicar si desea recibir noticias";
} else{
    if ($noticias == 0){
        print "Su correo $email va a recibir noticias";
    }else{
        print "Su correo no $email va a recibir noticias";
    }
}
?>