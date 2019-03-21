<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Inicio</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
    </head>
    <body>
    <h1 style="text-align:center; color:blue;">DATOS</h1>
    <?php
            $email=trim(htmlspecialchars($_REQUEST["email"], ENT_QUOTES, "UTF-8"));
            $conexion = mysqli_connect("localhost", "root", "", "cursophp") or die ("Problemas de conexión");
            $registro = mysqli_query($conexion, "SELECT * FROM alumnos WHERE mail like'$email';") or die
            ("Problemas en la consulta: ".mysqli_error($conexion)); 
            if ($reg=mysqli_fetch_array($registro)) {
            ?>
        <div class="container">
            
          
                <div class="form-group">
                <form action="actualizador.php" method="post">
                
                    
                    <label for="nombre">Nombre: </label>
                    <input type="text" name="nombre" id="nombre" value="<?php echo $reg['nombre'];?> " readonly/>
                    <p>
                    <label for="email">Email:</label>
                    <input type ="hidden" name="identificador" id="identificador" value="<?php echo $reg[1]; ?>"/>
                    </p>
                </div>
                
                    <label for="nombre">Curso: </label>
                    <select type="name" name="curso" id="curso">
                        <?php
                        $recursos = mysqli_query($conexion, "SELECT * FROM cursos") or die ("PROBLEMAS EN LA CONSULTA: ". 
                        mysqli_error($conexion));
                         while ($regc = mysqli_fetch_array($recursos)){
                             if ($regc['idCurso']==$reg['codigocurso']){
                                echo "<option value='$regc[idCurso]' selected>$regc[nombreCurso]</option>";

                             }
                             echo "<option value='$regc[idCurso]'>$regc[nombreCurso]</option>";
                         }


                        ?>
                    </select>
                    <p><input type="submit" value="actualizar"></p>
                </div>
                <?php
            }else{
                    print"<p>Email no encontrado en la BD</p>";
                }
    ?>
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