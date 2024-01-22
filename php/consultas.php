<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../style/style.css">
	<title>Consultas MySQL PHP</title>
</head>
<body>
	<?php
		$servername = "localhost";
		$database = "ventas2023";
		$username = "root";
		$password = "";
		// Crear conexión
		$conn = mysqli_connect($servername, $username, $password, $database);
		// Validando la conexión
		if (!$conn) {
		    die("La conexión fallo: " . mysqli_connect_error());
		}
		/*Ejemplo 1:
		$resultado1 = mysqli_query($conn, 'SELECT * FROM cliente');*/

		/*Ejemplo 2:
		$consulta2 = "SELECT * FROM cliente";
		$resultado2 = mysqli_query($conn, $consulta2);*/

		/*Ejemplo 3:
		$resultado3 = mysqli_query($conn, 'SELECT * FROM cliente');
		if($resultado3)
			echo "Consulta implementada correctamente";
		else
			echo "Error enm la implementación de la consulta";*/

		/*Ejemplo 4:
		$resultado4 = mysqli_query($conn, 'SELECT * FROM producto');
		$n_registros4 = mysqli_num_rows($resultado4);
		echo "El número total de productos registrados es: " .$n_registros4;*/

		//Ejemplo 5:
		$cliente = "Carlos López Hurtado";
		$resultado5 = mysqli_query($conn, "SELECT B.* FROM boleta B INNER JOIN cliente C ON B.ID_CLIENTE=C.ID_CLIENTE WHERE CONCAT(C.NOMBRES, ' ', C.PATERNO, ' ', C.MATERNO)='$cliente'");
		$n_registros5 = mysqli_num_rows($resultado5);
		echo "El número total de boletas del cliente: " .$cliente. " es: " .$n_registros5;
		
		// Cerrar conexión
		mysqli_close($conn);
	?>
	
</body>
</html>