<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Prueba-Examen-Consulta</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">

</head>

<body>
<?php

//Capturamos los 4 componentes necesarios:
$busca = trim(htmlspecialchars(strip_tags($_REQUEST["pais"]), ENT_QUOTES, "UTF-8"));

//Hacemos un control de errores con un condificional:
    $paisOK = false;


    
        if (empty($busca)){
            print "<p>Error, campo producto, está vacío</p>";
        }else{
            $paisOK = true;
        }
        if ($paisOK){
        //realizamos la busqueda
        $conexion = mysqli_connect("localhost", "root", "", "bdpersonas") or die("Problemas de conexión");
        
        $consulta = mysqli_query($conexion,
        "SELECT * FROM bdpersonas.personas;") or die("Problemas en el insert". mysqli_error($conexion));
        mysqli_close($conexion);
        //Mostramos que todo ha ido bien con un aviso:
        while($reg=mysqli_fetch_array($consulta)){
            echo "<p>" . $reg['nombre'] . "</p>";
            
        }
       if($busca == mysqli_query($conexion,
       "SELECT * FROM bdpersonas.personas;") or die("Problemas en el insert". mysqli_error($conexion));
       mysqli_close($conexion);)
       {print "está";}
        }

?>



    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>