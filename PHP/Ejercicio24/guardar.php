<?php
 $autor=trim(htmlspecialchars($_REQUEST["autor"], ENT_QUOTES, "UTF-8"));
 $titulo=trim(htmlspecialchars($_REQUEST["titulo"], ENT_QUOTES, "UTF-8"));
 $categoria=trim(htmlspecialchars($_REQUEST["categoria"], ENT_QUOTES, "UTF-8"));
 $fecha=trim(htmlspecialchars($_REQUEST["fecha"], ENT_QUOTES, "UTF-8"));
 $texto=trim(htmlspecialchars($_REQUEST["texto"], ENT_QUOTES, "UTF-8"));

 $conexion = mysqli_connect("db4free.net:3306", "root", "root", "cursophp") or die ("Problemas de conexión");



?>