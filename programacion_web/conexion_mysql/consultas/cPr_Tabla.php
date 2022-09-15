<?php

    $table = "pr_tabla";

    $primaryKey = 'id';

    $columns = array(
        array('db' => 'id',             'dt' => 'id'),
        array('db' => 'nombre',         'dt' => 'nombre'),
        array('db' => 'pr_apellido',    'dt' => 'pr_apellido'),
        array('db' => 'sg_apellido',    'dt' => 'sg_apellido'),
        array('db' => 'estado',         'dt' => 'estado')
    );

    // SQL mysql

    $sql_detalle = array(
        'user' => 'root',
        'pass' => '',
        'db' => 'adso_55',
        'host' => 'localhost'
    );

    require('SSP.php');

    print(json_encode(SSP::simple($_GET,$sql_detalle,$table,$primaryKey,$columns)));


?>