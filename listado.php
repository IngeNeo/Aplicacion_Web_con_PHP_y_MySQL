<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style/style.css">
	<title>Listado</title>
</head>
<body>
<header>
	<h2>LISTADO DE CLIENTES</h2>
</header>
<section>
	<?php
		//Conexión al servidor
		$servername = "localhost";
		$usuario = "root";
		$clave="";
		$basedatos= "ventas2023";

		$conexion = mysqli_connect($servername, $usuario, $clave, $basedatos);
		if(!$conexion)
			die("currió un error al conectar la base de datos " . mysqli_connect_error());

		$resultado = mysqli_query($conexion, "SELECT * FROM cliente");
		$fila = mysqli_fetch_row($resultado);
	?>
	<TABLE BORDER="1" WIDTH="550" CELLSPACING="0" CELLPADDING="0">
		<TR>
			<TD>Código</TD>
			<TD><?php echo $fila[0]; ?></TD>
		</TR>
		<TR>
			<TD>Nombre del cliente</TD>
			<TD><?php echo ($fila[1] .' '.$fila[2].' '.$fila[3]); ?></TD>
		</TR>
		<TR>
			<TD>Dirección</TD>
			<TD><?php echo $fila[4]; ?></TD>
		</TR>
		<TR>
			<TD>Celular</TD>
			<TD><?php echo $fila[5]; ?></TD>
		</TR>
		<TR>
			<TD>Email</TD>
			<TD><?php echo $fila[6];?></TD>
		</TR>
		<TR>
			<TD>Código de departamento</TD>
			<TD><?php echo $fila[7]; ?></TD>
		</TR>

	</TABLE>
	<?php
		//Cerrar conexión
		mysqli_close($conexion);
	?>
</section>
<footer>
	<h4>Todos los derechos reservados IngeCorp @2023</h4>
</footer>
</body>
</html>