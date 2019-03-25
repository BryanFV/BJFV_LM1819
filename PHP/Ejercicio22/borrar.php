<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Borrar</title>
</head>
<body>
<?php
            $email=trim(htmlspecialchars($_REQUEST["mail"], ENT_QUOTES, "UTF-8"));
            $conexion = mysqli_connect("localhost", "root", "", "cursophp") or die ("problemas de conexión");
            $registros = mysqli_query($conexion, "SELECT * FROM alumnos WHERE mail='$email'") or die ("problemas en la consulta
            " .mysqli_error($conexion));
            if ($reg=mysqli_fetch_array($registros)){
                mysqli_query($conexion. "DELETE FROM alumnos WHERE mail='$email'") or die ("Problemas en la copnsulta
                ".mysqli_error($conexion));
                print"<h3>Alumno Borrado</h3>";
            }else{
                header("Location: inicio.php?error='Email no encontraro'");
            }
            mysqli_close($conexion);
?>
    
</body>
</html>