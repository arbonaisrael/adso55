<?php
    // importamos los parametros de la conexion 
    require_once 'Parametros.php';
    class Conexion {

        function __construct(){
            $this->conectarDB();
        }

        function __destruct(){
            $this->cerrarDB();
        }
        

        public function conectarDB(){
            $conexion = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE)
            or die ('Sin conexion a la base de datos');
            
            // retornamos la conexion de la base de datos
            return $conexion;
        }

        public function cerrarDB(){
            // Cerrar la conexion de la base de datos
            mysqli_close($this->conectarDB());
        }
    }
?>