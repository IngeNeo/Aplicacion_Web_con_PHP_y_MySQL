<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../style/style.css">
	<title>Conexión con PHP a MySQL</title>
</head>
<body></body>
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
		echo "La conexión fue exitosa!";
		//$info = mysqli_get_client_info();
		//$info = mysqli_get_client_version();
		$info = mysqli_get_server_info($conn);
		echo "$info";
		mysqli_close($conn);
	?>
</body>
</html>