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
//si el checked esta marcado hacemos un set coockies con valor dolar request de ese campo 
//y el tiempo puede ser time(11 days),
//si no esta marcado hacemos lo mismo q antes pero en el time tenemos q 
//poner time -1000 y nos volvemos al login y cuando vamos tenemos que rellenar el capo email
// con el campo value que será la coockie


$email = trim(htmlspecialchars( strip_tags ($_REQUEST["mailUsu"]), ENT_QUOTES, "UTF-8"));

if (isset($_REQUEST["checked"])){
   setcookie("mailUsu", $email, time()+60*60*24*365);
}else{
    setcookie("mailUsu", $email, time()-1000);
}


?>
<p><a href="ejercicioextra.php">Volver al inicio</a>    </p>
</body>
</html>

