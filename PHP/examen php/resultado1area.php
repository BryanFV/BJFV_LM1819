<?php

$base = trim(htmlspecialchars($_REQUEST["base"], ENT_QUOTES, "UTF-8"));
$altura = trim(htmlspecialchars($_REQUEST["altura"], ENT_QUOTES, "UTF-8"));
//control de seg
$baseOK= false;
$alturaOK= false;
if (empty($base)) {
    print "<p>Base Vacía</p>";
} else if (!is_numeric($base)) {
    print "<p>Base No Numérica</p>";
} else {
    $baseOK = true;
}
if (empty($altura)) {
    print "<p>Altura Vacía</p>";
} else if (!is_numeric($altura)) {
    print "<p>Altura No Numérica</p>";
} else {
    $alturaOK = true;
}
if($baseOK&&$alturaOK){
    echo "El área es:" . ($base * $altura)/2;
}
?>

