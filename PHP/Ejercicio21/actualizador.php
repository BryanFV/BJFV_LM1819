<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Actualizador</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
    </head>
    <body><?php
            $identificador=trim(htmlspecialchars($_REQUEST["identificador"], ENT_QUOTES, "UTF-8"));
            $nombre=trim(htmlspecialchars($_REQUEST["nombre"], ENT_QUOTES, "UTF-8"));
            $curso=trim(htmlspecialchars($_REQUEST["curso"], ENT_QUOTES, "UTF-8"));

            $conexion = mysqli_connect("localhost", "root", "", "cursophp") or die ("Problemas de conexión");
            $registro = mysqli_query($conexion, "UPDATE alumnos SET nombre='$nombre', codigocurso=$curso WHERE idAlumno=
            $identificador") or die
            ("Problemas en la consulta: ".mysqli_error($conexion)); 
            
        ?>
        <div class="container">
            <h1 style="text-align:center; color:blue;">Email</h1>
            <form action="datos.php" method="post">
                <div class="form-group">
                    <label for="email">Email Alumno</label>
                    <input type="email" class="form-control" name="email" id="email" required>
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