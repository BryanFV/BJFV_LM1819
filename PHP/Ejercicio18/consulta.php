<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Consulta</title>
</head>
<body>
    <?php
   $conexion =  mysqli_connect("localhost", "root", "", "cursophp") or die("Problemas de conexión");

   
   $registros = mysqli_query($conexion, "SELECT idAlumno, nombre, mail, codigocurso FROM alumnos") or 
   die ("Problemas en la consulta:".mysqli_error($conexion));
    while($reg=mysqli_fetch_array($registros)){//guarda en el reg los datos del registro
        echo "IdAlumno: " . $reg['idAlumno'] . "<br />";
        echo "Nombre: " . $reg['nombre'] . "<br />";

    } 
    mysqli_close($conexion);
    
    ?>
</body>
</html>