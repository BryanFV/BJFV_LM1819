<?php
//trim sirve para quitar espacios por delante o por detrás:
//con todo esta cadena quitamos caracteres especiales
$nombre = trim(htmlspecialchars( strip_tags ($_REQUEST["nombre"]), ENT_QUOTES, "UTF-8"));
if ($nombre !=""){
    print "<p>Su nombre es $nombre</p>";
}

if (isset($_REQUEST["opcion"])){
    print "<p>Opción Marcada</p>";
}
print_r($_REQUEST);
print_r($_FILES);


?>