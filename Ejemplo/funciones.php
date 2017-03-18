<?php

require 'conexion.php';




function obtenerUsuario($codbus){

    $conexion = conexion();
    $strusu = "SELECT * FROM usuario WHERE cod_usuario = $codbus";

    $conusu = mysqli_query($conexion,$strusu) or die('error en la consulta'.mysqli_connect_error());
    $datosUsuario = mysqli_fetch_assoc($conusu);

    return $datosUsuario;

}




function registrar($codreg,$tiempo){


    $conexion = conexion();
    $usuario = obtenerUsuario($codreg);

    if(is_null($usuario)){ // usuario no registrado
        return -1;
    }else{
        $strasis= "SELECT id_asistencia FROM asistencia WHERE cod_usuario=$codreg && timeout is null";
        $conasis = mysqli_query($conexion, $strasis) or die('error en la consulta'.mysqli_connect_error());
        $idasis= mysqli_fetch_assoc($conasis);
        $id=$idasis["id_asistencia"];

        if(is_null($id)){ // usuario registro entrada
            $strregen = "INSERT INTO asistencia values('','$tiempo','',$codreg)";
            mysqli_query($conexion,$strregen) or die('error en la consulta'.mysqli_connect_error());

            return 0;

        }else{ // usuario registro salida
            $strregsa = "UPDATE asistencia SET timeout = '$tiempo' WHERE id_asistencia = $id";
            mysqli_query($conexion,$strregsa) or die('error en la consulta'.mysqli_connect_error());

            return 1;
        }
    }

}







?>
