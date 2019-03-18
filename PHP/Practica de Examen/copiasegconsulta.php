<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Prueba-Examen-Consulta</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">

</head>

<body>
    <div class="container">
        <?php
/*Muestra una consulta de todos los productos de la tabla productos mostrando el nombre completo del proveedor del producto. 
Además, muestre un mensaje indicando el precio total de todos los productos y la cantidad de productos.
Añade un botón para insertar un producto en la base de datos. Muestra en el formulario todos los proveedores que existen en 
la tabla de proveedores.*/
//Capturamos los 4 componentes necesarios:
$descripcion = trim(htmlspecialchars(strip_tags($_REQUEST["descripcion"]), ENT_QUOTES, "UTF-8"));
$cantidad = trim(htmlspecialchars(strip_tags($_REQUEST["cantidad"]), ENT_QUOTES, "UTF-8"));
$precio = trim(htmlspecialchars(strip_tags($_REQUEST["precio"]), ENT_QUOTES, "UTF-8"));
$idProveedor = trim(htmlspecialchars(strip_tags($_REQUEST["proveedor"]), ENT_QUOTES, "UTF-8"));
//Hacemos un control de errores con un condificional:
$descripcionOK = false;
$cantidadOK = false;
$precioOK = false;
$proveedorOK = false;

    if (empty($producto)){
        print "<p>Error, campo producto vacío</p>";
    }else{
        $productoOK = true;
    }
   
    if (empty($cantidad)){
        print "<p>Error, campo cantidad vacío</p>";
    }elseif(!filter_var($cantidad,FILTER_VALIDATE_FLOAT)){
        print "<p>Error, campo cantidad no es un número entero.</p>";
    }elseif($cantidad <= 0){
        print "<p>Error, el campo cantidad Tiene que ser superior a 0.</p>";
    }else{
        $cantidadOK = true;
    }

    if (empty($precio)){
        print "<p>Error, campo precio vacío</p>";
    }elseif(!filter_var($precio,FILTER_VALIDATE_INT)){
        print "<p>Error, campo precio no es un número.</p>";
    }elseif($precio <= 0){
        print "<p>Error, el campo precio Tiene que ser superior a 0</p>";
    }else{
        $precioOK = true;
    }
    if(!isset($proveedor)){
        print "<p>Error, no se ha seleccionado un proveedor.</p>";
    }else{
        $proveedorOK = true;
    }
    if ($productoOK && $cantidadOK && $precioOK && $proveedorOK){
$conexion = mysqli_connect("localhost", "root", "", "bdejemplo") or die("Problemas de conexión");
    }
$consulta = mysqli_query($conexion, "SELECT idProductos, descripcion, cantidad, precio, idProveedor from bdejemplo.productos;") or 
die ("Problemas de sintaxis en la consulta:" .mysqli_error($conexion));
    

    echo "<table class='table table-stripped'>";
    echo "<h1 style=' text-align:center; color:Blue;'>Productos</h1>";
    echo "<th>Nombre del Proveedor:</th><th>Cantidad:</th><th>Precio:</th>";
    
    
        while($reg=mysqli_fetch_array($consulta)){
            echo "<tr>";
            echo "<td>" . $reg['idProductos'] . "</td>";
            echo "<td>" . $reg['cantidad'] . "</td>";
            echo "<td>" . $reg['precio'] . "</td>";
            echo "</tr>";
    }
    echo "</table>";
            mysqli_close($conexion);    
        ?>
    </div>



    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>