
    

<?php
function cabecera($titulo){
   print "<!DOCTYPE html>";
   print "<html lang='es'>";
   print "<head>";
   print     "<meta charset='UTF-8'>";
   print    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
   print    "<meta http-equiv='X-UA-Compatible' content='ie=edge'>";
   print     "<title>Document</title>";
   print  "</head>";
   print  "<body>";
   print "<h1>$titulo</h2>";
}

function pie(){
    print "</body>";
    print "</html>";
}

?>