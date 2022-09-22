<?php

    /**
     * Cargamos la conexion unicamente se realiza en este archivo
     * ya que sera el primero en cargar
     */

    require_once 'Datos/ConexionBD.php';

    class UsuariosCtrl {

        public $respuesta = null;

        function __construct($peticion){

            switch ($peticion[0]){
                case 'Logear':
                    return self::Logear($this);
                    break;
                case 'Listar':
                    return self::Listar($this);
                    break;
                case 'Registrar':
                    return self::Resgistar($this);
                    break;
                case 'Actualizar':
                    return self::Actualizar($this);
                    break;
                default:
                    $this->respuesta = array(
                        'Estado' => 2,
                        'Mensaje' => 'No se reconece el método del recurso'
                    );
            }
        }

        private static function Logear($obj){

            $usuario = $_POST['datos'];
            $pdo = ConexionBD::obtenerInstancia()->obtenerBD();
            $sql = "SELECT u.usuario, u,clave " .
                   "FROM usuarios as u " . 
                   "WHERE u.usuario = '" . $usuario['username'] .
                   "' AND u.clave = '" . $usuario['clave'] . "' AND u.estado = 1;";
                   
            $sentencia = $pdo->prepare($sql);
            
            if($sentencia->execute()){
                $resultado = $sentencia->fetchAll(PDO::FETCH_ASSOC);
                if($resultado) {
                    $obj->respuesta = array(
                        'Estado' => 1,
                        'Mensaje' => 'Bienvenida',
                        'Usuario' => $resultado
                    );
                } else {
                    $obj->respuesta = array(
                        'Estado' => 2,
                        'Mensaje' => 'Error de verificación de datos'
                    );
                }
            } else {
                $obj->respuesta = null;
            }

        }


    }

?>