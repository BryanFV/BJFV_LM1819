<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Resultado22</title>
</head>
<body>
 
		<a href="resultado2.php" title="Volver"> Atrás</a>;
		
    <?php
/*IMC = peso (kg) / altura² (metros)
imc<18.5 -> "BAJO PESO"
imc>=18.5 y imc<=24.9 -> "NORMAL"
imc>=25 y imc<=29.9 -> "SOBREPESO
imc>29.9 -> "OBESIDAD"
*/
        $altura = trim(htmlspecialchars($_REQUEST["altura"], ENT_QUOTES, "UTF-8"));
        $peso = trim(htmlspecialchars($_REQUEST["peso"], ENT_QUOTES, "UTF-8"));
        //control de seg
    $pesoOK= false;
    $alturaOK= false;

        if (empty($peso)) {
            print "<p>Peso Vacío</p>";
        }else {
            $pesoOK = true;
        }
        if (empty($altura)) {
            print "<p>Altura Vacía</p>";
        } else {
            $alturaOK = true;
        }
        
           
        $imc=($peso)/($altura*$altura);
            
        
        if($pesoOK&&$alturaOK){
            print "<p>IMC = peso (kg) / altura² (metros)</p>";
    
            if($imc<18.5){
                print "BAJO PESO: ".$imc;
     
            }else
     
            if($imc>=18.5 && $imc<=24.9){
              print "NORMAL: ".$imc;
     
     
            }else
            if($imc>=25 && $imc<=29.9){
              print "SOBREPESO: ".$imc;
     
            }else
            if($imc>29.9){
              print "OBESIDAD:".$imc;
     
            }
        
        }
        print "<div style='margin: 0 auto; width: 400px'>";
      
        
        session_start();
        print "<p>Bienvenido ". $_SESSION['nombreUsuario'] ."</p>";
        print "</div>";

 
 
            
    ?>
</body>
</html> 