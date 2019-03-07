<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tercero</title>
</head>
<body>
<div style="margin: 0 auto; width: 400px">
<?php
    print "<p>Fecha Nacimiento: $_REQUEST[edad]</p>";
    print "<p>Fecha Actual:". date('Y-m-d') . "</p>";
    //calcular la diferencia entre el nacimiento y la fecha actual
    list($year, $month, $day) = explode("-",$_REQUEST["edad"]);
    $year_diff = date("Y") - $year;
    $month_diff = date("m") - $month;
    $day_diff = date("d") - $day;
    if ($day_diff < 0 || ($month_diff = 0 && $day_diff < 0)){
        $year_diff--;//el menos menos reduce en 1 el resultado.
    }
    session_start();
    print "<p>Bienvenido $_SESSION[nombreUsuario]</p>";
    print "<p>Su edad es $year_diff años</p>";
?>
<a href="segundo.php">Volver a la EDAD</a>
</div>
</body>
</html>