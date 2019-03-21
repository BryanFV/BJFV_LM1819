<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sesiones</title>
</head>
<body>
    <div style="margin: 0 auto; width: 100px">
        <div>
            <?php
                if (isset($_REQUEST["error"])) {
                    print "<p style='color: red'> $_REQUEST[error] </p>";
                }
            ?>
        </div>
        <h1>IMC</h1>
        <form action="resultado2.php" method="POST">
            <p>
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre" value="">
                
            </p>
            <p>
                <input type="submit" value="Enviar">
            </p>
        </form>
    </div>
</body>
</html