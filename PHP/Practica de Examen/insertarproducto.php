<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Insertar - Nuevo producto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
    </head>
    <body>
    <!--Muestra una consulta de todos los productos de la tabla productos mostrando el nombre completo del proveedor del producto. 
Además, muestre un mensaje indicando el precio total de todos los productos y la cantidad de productos.
Añade un botón para insertar un producto en la base de datos. Muestra en el formulario todos los proveedores que existen en 
la tabla de proveedores.-->
        <div class="container">
            <h2>Insertar Producto</h2>
            <form action="consultaproducto.php" method="post">
                <div class="form-group">
                    <label for="producto">Nuevo Producto</label>
                    <input type="text" class="form-control" name="producto" id="producto" >
                </div>
                <div class="form-group">
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" class="form-control" name="cantidad" id="cantidad" >
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" class="form-control" name="precio" id="precio" >
                </div>
                <div class="form-group">
                    <label for="proveedor">Proveedores:</label>
                    <select name="proveedor" class="form-control" >
                    <?php
                        //Nos conectamos la base de datos:
                        $conexion = mysqli_connect("localhost", "root", "", "bdejemplo") or die("Problemas de conexión");
                        //Generamos la busquedad:
                        $consulta = mysqli_query($conexion, "SELECT idProducto, idProveedor from bdejemplo.productos;") or 
                        die ("Problemas de sintaxis en la consulta:" .mysqli_error($conexion));
                        /*Y una vez generada la busquedad, guardamos esos datos en un nuevo registro, y con el bucle while generaremos un option
                        para que cada que vez que hagamos un insert en la base de datos se actualice y se muestre en el option.*/
                        while($reg = mysqli_fetch_array($consulta)){
                            echo "<option value='$reg[idProducto]'>$reg[idProveedor]</option>";
                        }
                    ?>
                    </select>
                </div>
                <p>
                    <input type="submit" class="btn btn-primary btn-block" value="Añadir">
                </p>
            </form>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    </body>
</html>