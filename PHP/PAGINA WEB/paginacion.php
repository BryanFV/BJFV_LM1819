<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Paginacion</title>
      <!-- Bootstrap CSS -->
      <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
</head>
<body>
<?php
    if (isset($_REQUEST['posicion'])){
        $inicio = $_REQUEST['posicion'];
    }else{
            $inicio = 0;
    }
      
            $conexion = mysqli_connect("localhost", "root", "", "cursophp") or die ("problemas de conexión");
            $registros = mysqli_query($conexion, "SELECT nombre, mail, codigocurso, nombreCurso FROM alumnos 
            as alum inner join cursos as cur on alum.codigocurso = cur.idCurso limit $inicio, 2") or die ("problemas en la consulta
            " .mysqli_error($conexion));

            echo "<h1 style=' text-align:center; color:Blue;'>PAGINACION</h2>";

            echo "<table class='table table-stripped'>";
  
            echo "<th>Nombre:</th><th>Email:</th><th>Curso:</th>";
            while ($reg=mysqli_fetch_array($registros)){
                echo "<tr>";
                echo "<td>" . $reg['nombre'] . "</td>";
                echo "<td>" . $reg['mail'] . "</td>";
                echo "<td>" . $reg['nombreCurso'] . "</td>";
                echo "<tr>";
                $contador++;
            }
            echo "</table>";
    
            if ($inicio == 0){
                echo "Anteriores";
            
            }else{
                $anterior = $inicio - 2;
                echo "<a href='paginacion.php?posicion=$anterior'>ANTERIORES</a>";
            }

            if ($contador !=2){
                echo"Siguiente";
            }else{
                $siguiente = $inicio + 2;
                echo "<a href='paginacion.php?posicion=$siguiente'>SIGUIENTES</a>";
            }
            mysqli_close($conexion);
?>
    
     <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</body>
</html>