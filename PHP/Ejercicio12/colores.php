<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>pintar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body style="background-color:
<?php
if (isset($_COOKIE['color'])){
    echo $_COOKIE['color'];
}

?>">
    <form action="resulcolores.php">

        <p><label>¿Pintamos?</label>
        <input type="checkbox" name="pintar" value="" />
       </p>
       <p>
           <input type="radio" name="rojo" value="#F80000" />Rojo
           <input type="radio" name="amarillo" value="#F0F800"/>Amarillo
           <input type="radio" name="verde" value="#40F800"/>Verde
       </p>
    
        <p>

            <input type="submit" value="Pintar"/>
        </p>
    </form>
    
</body>
</html>