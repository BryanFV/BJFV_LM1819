<?php
$edad =  trim(htmlspecialchars( $_REQUEST["edad"], ENT_QUOTES, "UTF-8"));

if ($edad == ""){
    echo "Error, por favor rellene el campo edad";
    }elseif(!is_numeric($edad)){
            print "Error, por favor escriba su edad en formato numérico";
                    }else{
                        print "Su edad es $edad";
}


?>