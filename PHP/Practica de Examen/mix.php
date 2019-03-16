<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>tabla</title>
</head>
<body>
    <?php
       $filas = 3;
       $columnas = 4;
        echo "<table style ='border: 2px solid black'>";
        for ($i=0; $i < $filas; $i++) { 
            echo "<tr>";
            for ($j=0; $j < $columnas ; $j++) { 
                echo "<td style='border: 2px solid black'>$j</td>";
            }
            echo "</tr>";
        }
        echo "</table>";

        echo "<br />";

        define ("PESETAS", 166.386);
        for ($i=0; $i < 5 ; $i++) { 
            print ("$i € = ". $i*PESETAS . "pts<br />");
        }

        echo date ("H").PHP_EOL;
        echo "<br />";
        $hora = date ("H");
        if ( $hora >=8 && $hora <=12){
            echo "Buenos días, son las $hora de la mañana";
        }elseif($hora >=13 && $hora <= 20){
            echo "Buenas tardes, son las $hora de la tarde";
        }else{
            echo "Buenas noches, son las $hora de la noche";
        }
        echo "<br />";

        $aleatorio = rand(1, 100);
        $contador = strlen($aleatorio);
        echo "$aleatorio tiene $contador digitos";

        function calcularExtension($fichero){
            $nombreExt = explode(".", $fichero);
            return strtoupper($nombreExt[1]);
        }
        $nombreFichero = "fichero.txt";
        $ext = calcularExtension($nombreFichero);
        print "<p>La extensión del archivo $nombreFichero es  igual a: $ext</p>";
    
        
    ?>
</body>
</html>