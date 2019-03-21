<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Datos</title>
</head>
<body>
    <?php
    $email=trim(htmlspecialchars($_REQUEST["email"], ENT_QUOTES, "UTF-8"));
    $conexion = mysqli_connect("localhost", "root", "", "cursophp") or die ("Problemas de conexión");
    $registro = mysqli_query($conexion, "SELECT * FROM alumnos WHERE mail like'$email';") or die
    ("Problemas en la conslta: ".mysqli_error($conexion)); 
    if ($reg=mysqli_fetch_array($registro)) {
    }else{
        print"<p>Email no encontrado en la BD</p>";
    }
    ?>
</body>
</html>