<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>REsultado2</title>
</head>
<body>
<a href="ejercicio2.php" title="Volver"> Atrás</a>;
    <?php
        $usuario = trim(htmlspecialchars($_REQUEST["nombre"], ENT_QUOTES, "UTF-8"));
            session_start();
            $_SESSION['nombreUsuario'] = $usuario;
            ?>
            <div style="margin: 0 auto; width: 200px">
                <h1>PESO y Altura</h1>
                <form action="resultado22.php" method="POST">
                    <p>
                        <label for="peso">Peso(KG): </label>
                        <input type="text" name="peso" id="peso">
                    </p>
                    <p>
                        <label for="altura">Altura(Metros). Usa puntos y no comas: </label>
                        <input type="text" name="altura" id="altura">
                    </p>
                    <p>
                        <input type="submit" value="Enviar">
                    </p>
                </form>
            </div>
    <?php
    
    ?>
</body>
</html>