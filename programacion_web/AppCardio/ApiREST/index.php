<?php

    /**
     * Crgamos todos los controladores
     */

    require_once 'Controladores/UsuariosCtrl.php';

    /**
     * Definimos que sera una aplicación de tipo JSON
     * Permitimos el acceso a todos los clientes
     * Permitimos que los clientes usen método POST
     * 
     * apache vs nginx
     */

     header('content-type: application/json; charset= utf-8');
     header('Access-Control-Allow-Origin: *');
     header('Access-Control-Allow-Methods: POST');

     $respuesta;
     $instancia;

     if(isset($_GET['PATH_INFO'])){
        $peticion = explode('/',$_GET['PATH_INFO']);
        $recurso = array_shift($peticion); // obtener el recurso a solicitar

        $recursos_existentes = array (
            "UsuariosCtrl"
        ); // Definimos los recursos existentes y validamos que lo solicitado exista

        if(in_array($recurso,$recursos_existentes)){
            // por seguridad validamos el método para que sea POST
            $metodo = strtolower( $_SERVER['REQUEST_METHOD']);

            if($metodo == 'post'){
                // Enrutamos a donde la petición lo desee
                switch($recurso){
                    case 'UsuariosCtrl':
                        $instancia = new UsuariosCtrl($peticion);
                        break;
                }

                $respuesta = $instancia->respuesta;
            } else {
                $respuesta = array(
                    'Estado' => 2,
                    'Mensaje' => 'No se reconce el método'
                );
            }

        } else {
            $respuesta = array(
                'Estado' => 2,
                'Mensaje' => 'No se reconce el recurso'
            );
        }

     } else {
        $respuesta = array(
            'Estado' => 2,
            'Mensaje' => 'No se reconce el petición'
        );
     }

    print(json_encode($respuesta));     
?>