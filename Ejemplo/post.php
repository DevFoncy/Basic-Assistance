
<?php
	
	require 'funciones.php';

	date_default_timezone_set("America/Bogota");
	$valortag = $_POST;
	$tiempo = date("y-m-d h:i:s");

	$resultado = registrar($valortag["codigo"],$tiempo);

	//$user = obtenerUsuario($valortag["codigo"]);

?>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Registro de Asistencia</title>
		<style>
			body{
				margin: 0;
				padding: 0;
				background: black;
				color: white;
			}

			#usuario{
				width: 300px;
				margin:50 auto;
				border: 1px solid #59df7a;
				text-align: center;				

			}

		</style>
	</head>

	<body>	

		<div id="usuario">
			<p>
		        <?php if($resultado != -1){
		        			$usuario=obtenerUsuario($valortag["codigo"]);
		        			if($resultado == 0){
		        				echo "Entrada registrada </br>"
		        					 .$tiempo." ".$usuario["cod_usuario"]." ".$usuario["nombre"]." ".$usuario["cargo"];
		        			}else echo "Salida registrada </br>"
		        					   .$tiempo." ".$usuario["cod_usuario"]." ".$usuario["nombre"]." ".$usuario["cargo"];
		        		}else echo "Usuario no registrado";
		        ?>
	        </p>

	        <!--<p><?php var_dump($user) ?></p>-->

			<a href="index.html">Inicio</a>			


		</div>	

		
	</body>



</html>