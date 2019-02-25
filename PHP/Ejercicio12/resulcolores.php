<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>almacenar</title>
</head>
<body>
<?php

$color = trim(htmlspecialchars( strip_tags ($_REQUEST["pintar"]), ENT_QUOTES, "UTF-8"));

if (isset($_REQUEST["pintar"])){
   setcookie("color", $_REQUEST, );
}

?>
<p><a href="colores.php">Volver al inicio</a>    </p>
</body>
</html>

