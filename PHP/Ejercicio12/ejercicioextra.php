<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>email/login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <form action="resultado.php">
        <p>
            <label for="email">email:</label>
            <input type="email" name="mailUsu" id="email"
            value="
            <?php
            if (isset($_COOKIE['mailUsu'])){
                echo $_COOKIE['mailUsu'];
            }
            
            ?>
            
            "/>
        </p>
        <p>
            <label for="pass">Password</label>
            <input type="password" name="pass" id="pass"/>
        </p>
        <p>
            <label for="checkbox">Recordar email</label>
            <input type="checkbox" name="checked" id="checked"/>
        </p>
        <p>

            <input type="submit" value="almacenar"/>
        </p>
    </form>
    
</body>
</html>