<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Primero</title>
</head>
<body>
<div style="margin: 0 auto; width: 200px">
<div>
         <?php
        if(isset($_REQUEST['error'])){
            print "<p style='color:red'>$_REQUEST[error] </p>";
        }
         ?>
        </div>

    <form method="POST" action ="segundo.php">

    <p>
        <label for="usuario">Usuario</label>
        <input type="text" name="usuario" id="usuario" value=" <?php
            if(isset($_COOKIE["usuarioWeb"])){
                echo $_COOKIE["usuarioWeb"];}?>" />
    </p>
    <p>
        <label for="password">Contraseña</label>
        <input type="pass" name="password" id="password"  />
    </p>
    <p>
        <input type="submit" name="enviar" id="enviar" value="Entrar" />
    </p>

    </form>

</div>
</body>
</html>