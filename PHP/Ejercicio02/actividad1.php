<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<?php
//Con la función "rand" devuelva un valor entre 1 y 10. Si el valor es menor que 5 debe mostrar
//el mensaje "El valor .... es menor que 5" en rojo. Si el valor es mayor que 5 debe mostrar el
//mensaje "El valor ... es mayor que 5" en azul. Si el valor es 5 debe mostrar el mensaje 
//"El valor es 5" en verde.

//$numeros = [10, 5, 15, 11];

   // if (in_array(15, $numeros)){
       // print "Está el 15";
   // }elseif{
        //echo rand(1, 10);
   // }
   // else{
       // print "No está";
   // };

   $rand = rand(1, 10);
   print $rand;
   if ($rand < 5){
       print "el valor $rand es menor que 5";
   }elseif ($rand > 5){
       print "el valor $rand es mayor que 5";
   }else ($rand = 5){
       print "es 5";
   }
?>
</body>
</html>