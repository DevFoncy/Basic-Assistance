<?php

function conexion() {

    $hostname_db = "localhost";
    $database_db = "regasis";
    $username_db = "root";
    $password_db = "";

    $conexion = mysqli_connect($hostname_db,$username_db, $password_db);	

    mysqli_select_db($conexion, $database_db)
    or die ("Ninguna DB seleccionada" . mysql_error());

    return $conexion;
}