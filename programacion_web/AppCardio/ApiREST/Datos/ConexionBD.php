<?php

    /**
     * Clase que envuelve una instacia de la clase PDO
     * para el manejo de la base Mysql
     */

     require_once 'loginMysql.php';

     class ConexionBD {
        
        // Unica instacia de la clase
        private static $db = null;

        // Instancia de PDO
        private static $pdo;


        final private function __construct() {
            try {
                // creamos la nueva conexion
                self::obtenerBD();
            } catch (PDOException $e) {
                // Manejo de excepciones
            }
        }

        function __destructor() {
            self::$pdo = null;
        }


        /**
         * Retorna en la unica instancia de la clase
         * en la constante de conexion
         * @return PDO objeto PDO
         */
        public static function obtenerInstancia() {
            if (self::$db == null) {
                self::$db = new self();
            }

            return self::$db;
        }

        public function obtenerBD(){
            if (self::$pdo == null){
                self::$pdo = new PDO(
                    'mysql:dbname=' . DATABASE .
                    ';host=' . HOST . ";" ,
                    USER,
                    PASSWORD,
                    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
                );

                // Habilitamos excepciones
                self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            }

            return self::$pdo;
        }


        final protected function __clone() {

        }

     }

?>