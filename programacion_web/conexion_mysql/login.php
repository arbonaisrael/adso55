<?php
    require_once 'utilidades/Conexion.php';

    if(!empty($_POST)){
        $db = new Conexion();
        $usuario = $_POST['usuario'];

        $consulta = "SELECT usuarios.login,usuarios.contrasena ".
                    "FROM usuarios WHERE login = '$usuario' LIMIT 1;";
                    
        $query_exec = mysqli_query($db->conectarDB(),$consulta)
        or die ('Error en la consulta');

        $row = mysqli_fetch_array($query_exec);

        if($row){
            $contrasena = $_POST['contrasena']; 
            if ($contrasena == $row['contrasena']){
                header('location:inicio.php');
            } else {
                print("
                <script>
                    alert('Constraseña no es correcta');
                </script>
            "); 
            }

        } else {
            print("
                <script>
                    alert('Usuario no existe');
                </script>
            ");
        }

    }

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <title>Inicio</title>
</head>
<body>

    <div class="login-dark">
        <form action="?" method="POST">
            <h2 class="sr-only">Login</h2>
            <div class="illustration"> <i class="icon ion-ios-body-outline"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="usuario" placeholder="Usuario"></div>
            <div class="form-group"><input class="form-control" type="password" name="contrasena" placeholder="Contraseña"></div>
            <div class="form-group"><input class="btn btn-primary btn-block" type="submit" name="ingresar" value="Ingresar"></div>
            <a href="#" class="forgot">Olvido su Usuario o Contraseña</a>
        </form>
    </div>
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>