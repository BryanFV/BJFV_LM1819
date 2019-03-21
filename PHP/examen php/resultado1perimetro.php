<?php
$ladoa = trim(htmlspecialchars($_REQUEST["ladoa"], ENT_QUOTES, "UTF-8"));
$ladob = trim(htmlspecialchars($_REQUEST["ladob"], ENT_QUOTES, "UTF-8"));
$ladoc = trim(htmlspecialchars($_REQUEST["ladoc"], ENT_QUOTES, "UTF-8"));
//control de seg
$ladoaOK= false;
$ladobOK= false;
$ladocOK= false;
//resultado
$suma = $ladoa + $ladob + $ladoc;
if (empty($ladoa)) {
    print "<p>Lado A Vacío</p>";
} else if (!is_numeric($ladoa)) {
    print "<p>Lado A No Numérica</p>";
} else {
    $ladoaOK = true;
}
if (empty($ladob)) {
    print "<p>Lado B Vacío</p>";
} else if (!is_numeric($ladob)) {
    print "<p>Lado B No Numérica</p>";
} else {
    $ladobOK = true;
}
if (empty($ladoc)) {
    print "<p>Lado C Vacío</p>";
} else if (!is_numeric($ladoc)) {
    print "<p>Lado C No Numérica</p>";
} else {
    $ladocOK = true;
}
if($ladoaOK&&$ladobOK&&$ladocOK){
    echo "El perimetro es:" . $suma;
}

?>