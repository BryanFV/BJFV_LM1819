<?php
function calculaExtension($fichero){
    //$nombreExt = explode(".", $fichero);
    //return strtoupper($nombreExt[1]);
    $inicio = strrpos($fichero, ".") + 1; //strpos=la primer ocurrencia, strrpos=la ultima ocurrencia
    return  strtoupper (substr($fichero, $inicio));
}

$nombreFichero = "fichero.txt";
$ext = calculaExtension($nombreFichero);
print "<p>La extensión del archivo $nombreFichero es .$ext</p>"



?>