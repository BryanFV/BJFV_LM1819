<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Funciones</title>
</head>
<body>
    <?php
        function calculaHipotenusa($par1, $par2){
         $hipo = sqrt($par1*$par1 + $par2*$par2);
         return $hipo;   
        }
    $cat1 = 12;
    $cat2 = 16;
    $hipotenusa = calculaHipotenusa($cat1, $cat2);
    print "<p> El triángulo de lado $cat1, $cat2 y Hipotenusa $hipotenusa</p>";
    //devolver un resultado como ejecución de la función
    ?>
</body>
</html>