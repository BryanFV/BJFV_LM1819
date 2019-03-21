<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ejercicio3</title>
      <!-- Bootstrap CSS -->
      <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
</head>
<body><?php
    /*Realice el siguiente ejercicio de BD. Muestre un formulario para rellenar una caja de texto 
    con el nombre de un país. Al pulsar el botón “Buscar” realice una consulta a la base de datos 
    “bdpersonas” en la tabla “personas” para mostrar todas las personas de ese país. Si no existe el
     país en la base de datos, mostrar un mensaje indicandolo. */
?>
<?php
echo "<h1 style=' text-align:center; color:Blue;'>Personas y Paises Actuales</h1>";
//Comenzamos abriendo la conexión a mysql.
$conexion = mysqli_connect("localhost", "root", "", "bdpersonas") or die("Problemas de conexión");

//Generamos la consulta y la guardamos en la variable consulta.
$consulta = mysqli_query($conexion, "SELECT * FROM bdpersonas.personas;")
            or die("Problemas en el select".mysqli_error($conexion));


    echo "<table class='table table-stripped'>";
  
    echo "<th>Persona:</th><th>Pais:</th>";
    
        while($reg=mysqli_fetch_array($consulta)){
            echo "<tr>";
            echo "<td>" . $reg['nombre'] . "</td>";
            echo "<td>" . $reg['pais'] . "</td>";
            echo "</tr>";
    }
    echo "</table>";

            mysqli_close($conexion);    

        ?>
        <div class="container">
            <h2>Buscame!</h2>
            <form action="resultado3.php" method="post">
                <div class="form-group">
                    <label for="prod">Nombre de PAis</label>
                    <input type="text" class="form-control" name="pais" id="pais" >
                </div>
            
                </div>
                <p>
                    <input type="submit" class="btn btn-primary btn-block" value="Buscar">
                </p>

            </form>
        </div>
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
</body>
</html>