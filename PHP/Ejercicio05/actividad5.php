
<?php
function calculaExtension($fichero){
    $nombreExt = explode(".", $fichero);
    return strtoupper($nombreExt[1]);
}

$nombreFichero = "fichero.txt";
$ext = calculaExtension($nombreFichero);
print "<p>La extensión del archivo $nombreFichero es .$ext</p>"









//funcion con nombre y fichero y devuelva la funcion con nombre de fichero


//$extension= new SplFileInfo('texto.txt');
//var_dump($extension->getExtension());

//$extension= new SplFileInfo('foto.jpg');
//var_dump($extension->getExtension());

//$extension = new SplFileInfo('archivos.tar.gz');
//var_dump($extension->getExtension());


?>