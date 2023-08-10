* Conectar MySQL a PHP

* Función de conexión MySQL
mysqli_connect($servername, $username, $password, $database);

- $servername: Es el nombre del servidor; en entornos de prueba sera probable que este sea "localhost"
- $username: Es el nombre del usuario de la base de datos
- $password: Es la clave del usuario de la base de datos que vamos a usar
- $database: Nombre de la base de datos a la que nos vamos a conectar

- TODO: Example:
$conn = mysqli_connect($servername, $username, $password, $database);
		if (!$conn) {
		    die("La conexión fallo: " . mysqli_connect_error());
		}
		echo "La conexión fue exitosa!";
		mysqli_close($conn);

- die: La función die es la encargada de mostrar un mensaje, ademas de detener la ejecución de las demás sentencias PHP.

* Función de cierre del servidor
- Toda conexión correcta a un servidor debe ser cerrada para el proximo uso. Mantenerla abierta conlleva a posibles errores cuando vuelva a conectarse al servidor.
mysqli_close($variable_e_conexión_al_servidor);

* Función que ejecuta una sentencia de consulta MySQL en PHP
- Una vez realizada la conexión y seleccionada una base de datos desde el servidor, puede recuperar información desde las tablas de la base de datos activa.
$resultado = mysqli_query($variable_conexión, 'sentencia_mysql');

- TODO: Example:
$resultado = mysqli_query($conn, 'SELECT * FROM cliente');

* Función que determine el total de registros devueltos por la función mysql1_query usando la sentencia SELECT
- Sera de mucha importancia determinar el numero encontrados por la función mysqli_query, ya que desde aquí puede determinar exactamente cuántos registros vienen de la consulta o cuántos registros fueron afectados por la misma.
$variable = mysqli_num_rows($variable_de_consulta);

- $variable = Es el numero total de registros resultantes de una consulta.
- $variable_de_consulta = Es aquella variable que ejecuta la función mysqli_query

- TODO: Example:
$resultado = mysqli_query($conn, 'SELECT * FROM cliente');
$n_registros = mysqli_num_rows($resultado);

