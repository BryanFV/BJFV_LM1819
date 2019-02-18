<?php
//Cree un formulario que pida un número de segundos y devuelva la cantidad de minutos y segundos que son.
// Debe ser un número mayor o igual que 0.
$numero = trim(htmlspecialchars( ($_REQUEST["numero"]), ENT_QUOTES, "UTF-8"));
$division = $numero / 60;
$resto = $numero % 60;
if ($numero >= "60"){
    print "Tienes $division minutos y $resto segundos";
}else($numero <="60"){
    print "Tienes $numero segundos"
}
  
?>