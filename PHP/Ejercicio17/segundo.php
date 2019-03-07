<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Segundo</title>
</head>
<body>
<?php
    $referer = filter_var($_SERVER['HTTP_REFERER'],FILTER_VALIDATE_URL);//SE GUARDA LA ULTIMA URL VISITADA
    if(!empty($referer)){
        echo "<p><a href='$referer'>Volver</a></p>";
    }else{
        echo "<p><a href='javascript:history.go(-1)'>Volver</a></p>";
    }

$usuario=trim(htmlspecialchars($_REQUEST["usuario"], ENT_QUOTES, "UTF-8"));
$password=trim(htmlspecialchars($_REQUEST["password"], ENT_QUOTES, "UTF-8"));

if (empty($usuario) || empty($password)){
    header('location: primero.php?error=Debe Rellenar los campos');//para indicar el error en la barra de navegación.

} elseif ($password != "1234"){
    header('location: primero.php?error=Password Incorrecta');//para indicar el error en la barra de navegación.

}else{
    setcookie("usuarioWeb", $usuario, time()+60*60*24*365);
    session_start();
    $_SESSION['nombreUsuario']=$usuario;
    ?>
    <div style="margin: 0 auto; width: 200px">
    <form method="GET" action="tercero.php">
    <p>
        <label for="Edad">Edad:</label>
        <input type="date" name="edad" id="edad"/>
    </p>
    <p><input type="submit" name="enviar" value="Enviar"/></p>
    </form>
    </div>
    <?php
}
?>

</body>
</html>