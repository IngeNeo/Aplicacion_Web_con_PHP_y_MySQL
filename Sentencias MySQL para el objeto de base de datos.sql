-- Crear bases de datos
CREATE DATABASE [IF NOT EXISTS] NOMBRE_BASE_DATOS; --Creación de una base de datos;

CREATE -->							Sentencia de definición de datos que permite crear un objeto en el servidor de MysQL
DATABASE --> 						Palabra reservada que asocia a la sentencia CREATE permite crear un objeto de base de datos
IF NOT EXISTS -->				Cláusula que permite omitir el error que se ocasionaría si la base de datos que deseamos crear ya existiera en el servidor de MySQL 
NOMBRE_BASE_DATOS; -->	Se especifica el nombre de la base de datos que desea implementar, tener en cuenta que dicho nombre no debe tener espacios ni símbolos y finalizar la sentencia con "punto y coma ;"

--Examples:
CREATE DATABASE ventas; --> Se debe tener en cuenta que si la base de datos Ventas no existe en el servidor, la sentencia se ejecutará correctamente; en caso contrario, emitirá un mensaje de error y no se continuará con la ejecución de las demás sentencias.

DROP DATABASE IF EXISTS ventas; --> Eliminar la base de datos ventas solo si existe
CREATE DATABASE ventas; --> Crea la base de datos sin inconveniente pues previamente se a eliminado

CREATE DATABASE IF NOT EXISTS ventas; --> La base de datos Ventas se creará si no existe en el servidor.

-- Mostrar todas las bases de datos en el servidor MySQL
SHOW DATABASES; --> Nos permite listar las bases de datos que tenemos actualmente en el servidor MySQL

-- Activar la base de datos que vamos a usar
USE NOMBRE_BASE_DATOS;

--Example:
USE ventas; --> activa la base de datos; mostrando en MySQl la base de datos activa, se ve resaltada en negrita.

-- Mostrar la base de datos activa
SELECT DATABASE(); --> Mostrar el nombre de la base de datos activa en el momento.

-- Eliminar bases de datos
DROP DATABASE NOMBRE_BASE_DATOS; --> La eliminación de una base de datos del servidor es irreversible, es decir, no podrá recuperar la información almacenada en dicha base de datos

--Example:
DROP DATABASE ventas; --> Esta sentencia podría emitir un error si la base de datos que deseamos eliminar no existe
DROP DATABASE IF EXISTS ventas; --> Al incluir la clausula IF EXISTS, se verifica que la base de datos exista, si es asi lo eliminara del servidor MySQL; en caso contrario, emitirá un mensaje de advertencia.





