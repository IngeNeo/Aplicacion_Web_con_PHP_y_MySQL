-- ! Estas sentencias permiten administrar el objeto de tipo tabla dentro de una base de datos activa.

-- * Motor de almacenamiento:
-- * MyISAM = Es considerado como el motor por defecto y es comúnmente usado para administrar las consultas de la sentencia SELECT de MySQL

CREATE TABLE NOMBRE_DE_TABLA(
	columna1	tipo_datos,
	columna2	tipo_datos,
	...
	columnaN	tipo_dato
) ENGINE=MyISAM;

-- TODO: Example:
CREATE TABLE IF NOT EXISTS cliente(
				idCliente INT,
				nombres VARCHAR(30),
				apellidos VARCHAR(30),
				email VARCHAR(50)
		) ENGINE = MyISAM;

-- * InnoDB = Se recomienda su aplicación cuando se realice transacciones, ya que estas podrán asegurar su registro con commit y cancelar con rollback. Estas características aumentan el rendimiento para gestionar multiples usuarios.
CREATE TABLE NOMBRE_DE_TABLA(
				columna1 tipo_datos,
				columna2 tipo_datos,
				...
				columnaN tipo_dato
		) ENGINE = InnoDB;

-- TODO: Example:
CREATE TABLE IF NOT EXISTS cliente1(
				idCliente INT,
				nombres VARCHAR(30),
				apellidos VARCHAR(30),
				email VARCHAR(50)
		) ENGINE = InnoDB;

-- ? Tipo de datos: NUMÉRICOS ENTEROS:
-- BIT: Sus valores se encuentran entre 0 y 1
-- TINYINT: Sus valores se pueden dar en rango de -128 a +127 cuando tiene signo y de 0 a 255 cuando no tiene signo
-- SMALLINT: Sus valores se pueden dar en rango de - 32768 a +32767 cuando tiene signo y de 0 a 65535 cuando no tiene signo
-- MEDIUMINT: Sus valores se pueden dar en rango de - 8388608 a + 8388607 cuando tiene signo y de 0 a 4294967295 cuando no tiene signo
-- BIGINT: Sus valores se pueden dar en rango de - 9223372036854775808 a + 9223372036854775807 cuando tiene signo y de 0 a 18446744073709551615 cuando no tiene signo
-- INTEGER: Sus valores se pueden dar en rango de - 2147483648 a + 2147483647 cuando tiene signo y de 0 a 65535 cuando no tiene signo

-- ? Tipo de datos: NUMÉRICOS FRACCIONARIOS:
-- FLOAT: Es llamado número pequeño en coma flotante de precisión simple, el rango de -3.402823466e+38 a -1.175494351e-38 y desde 1.175494351e-38 a 3.402823466e+38
-- DOUBLE: Es llamado número en coma flotante de precisión doble, el rango de -1.7976931348623157e+308 a -2.2250738585072014e-308 y desde 2.2250738585072014e-308 a    1.7976931348623157e+308
-- DECIMAL: Es llamado número de punto flotante sin empaquetar, donde se representa el total de dígitos numéricos (n), incluido el punto decimal y del número de decimales (d); (n,d)  --> decimal(8,2)

-- ? Tipo de datos: CADENA DE CARACTERES:
-- CHAR: Permite registrar caracteres hasta un máximo de 255, sin la cantidad es menor a su máximo limite se rellena de caracteres en blanco
-- VARCHAR: Permite registrar una cadena de caracteres similar a char con la diferencia que si el valor es menor a su limite este no se autorrellena.
-- TINYTEXT: Permite registrar caracteres hasta un máximo de 255
-- TEXT: Permite registrar caracteres hasta un máximo de 65535 
-- MEDIUMTEXT: Permite registrar caracteres hasta un máximo de 16777215 
-- LONGTEXT: Permite registrar caracteres hasta un máximo de 4294967295 

-- ? Tipo de datos: FECHA Y HORA:
-- DATE: Permite registrar una fecha con el siguiente formato 'YYYY-MM-DD' --> 2023/07/28
-- DATETIME: Permite registrar una fecha y hora con el siguiente formato 'YYYY-MM-DD HH:MM:SS' --> 2023/07/28 09:00:30
-- TIME: Permite registrar una hora con el siguiente formato 'HH:MM:SS' --> 09:12:42
-- YEAR: Permite registrar valores numéricos pertenecientes a un año de una fecha, tanto de 2 cifras como de 4 --> 2023

-- * Creación de una tabla: Las tablas en una base de datos permiten almacenar información referente a la misma.Se debe tener en cuenta que el nombre que se asigne debe ir acorde con su contenido.
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO,
				COLUMNA2 TIPO ,
				...
				COLUMNAN TIPO 
		);

-- CREATE = Sentencia de definición de datos que permite crear un objeto en el servidor de MySQL
-- TABLE = Palabra reservada que asocia a la sentencia CREATE permite crear un objeto de tipo tabla en la base de datos activa.
-- IF NOT EXISTS = Cláusula que permite omitir el error que se ocasionaría si la tabla existiera en la base de datos activa.
-- NOMBRE_DE_TABLA  = Se especifica el nombre de la tabla que desea implementar, tenga en cuenta que dicho nombre no debe tener espacios en blanco ni símbolos.
-- COLUMNA = Nombre de los campos de la tabla, tiene la misma regla que el nombre asignado a la tabla
-- TIPO = Es el tipo de datos de cada columna especifica en la implementación de la tabla.

-- TODO: Example:
CREATE TABLE IF NOT EXISTS  producto(
				idProducto CHAR(5),
				descripcion VARCHAR(100),
				precio DECIMAL(6,2),
				stock INT,
				fechaVen DATE
		);

-- * Agregando columna a la tabla: Una vez creada la tabla se puede agregar una o más columnas sin necesidad de eliminar la tabla
ALTER TABLE NOMBRE_DE_TABLA ADD COLUMN NOMBRE_COLUMNA TIPO;

-- ALTER TABLE = Sentencia para modificar un objeto de tipo tabla en la base de datos activa.
-- NOMBRE_DE_TABLA = nombre de la tabla que vamos a modificar.
-- ADD COLUMN = Sentencia para adicionar una columna en la tabla designada.
-- NOMBRE_COLUMNA = Nombre de la columna que vamos a adicionar.
-- TIPO = Tipo de datos para la columna nueva que deseamos crear.

-- TODO: Example:
ALTER TABLE producto ADD COLUMN estado VARCHAR(20) NULL;
DESCRIBE producto;

-- ! Eliminar columna a la tabla: Una vez creada la tabla se puede eliminar una o más columnas sin necesidad de eliminar la tabla
ALTER TABLE NOMBRE_DE_TABLA DROP COLUMN NOMBRE_COLUMNA;

-- ALTER TABLE = Sentencia para modificar un objeto de tipo tabla en la base de datos activa.
-- NOMBRE_DE_TABLA = nombre de la tabla que vamos a eliminar.
-- DROP COLUMN = Sentencia para eliminar una columna en la tabla designada.
-- NOMBRE_COLUMNA = Nombre de la columna que vamos a eliminar.

-- ! TODO: Example:
ALTER TABLE producto DROP COLUMN estado;

DESCRIBE producto;

-- * Implementación de columnas con valores nulos y no nulos: Esta definición permite asignar a una columna el registro de un valor nulo, o hacer obligatorio su registro en otros casos.
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO NOT NULL,
				COLUMNA2 TIPO NULL,
				...
				COLUMNAN TIPO 
		);

-- TODO: Example:
CREATE TABLE IF NOT EXISTS  producto(
				idProducto CHAR(5) NOT NULL,
				descripcion VARCHAR(100) NOT NULL ,
				precio DECIMAL(6,2) NOT NULL ,
				stock INT NOT NULL ,
				fechaVen DATE NOT NULL
		);

-- * Modificar la tabla y columna para asignar el valor nulo o no nulo en ella

-- TODO: Example:
ALTER TABLE producto MODIFY idProducto CHAR(5) NOT NULL;
ALTER TABLE producto MODIFY descripcion VARCHAR(100) NOT NULL;
ALTER TABLE producto MODIFY precio DECIMAL(6,2) NOT NULL;
ALTER TABLE producto MODIFY stock INT NOT NULL;

-- * Implementación de columnas con valores por defecto
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO  DEFAULT 'VALOR',
				...
				COLUMNAN TIPO 
		);

-- TODO: Example:
CREATE TABLE IF NOT EXISTS  cliente(
				idCliente INT NOT NULL,
				nombres VARCHAR(70) NOT NULL,
				email VARCHAR(100) DEFAULT 'No cuenta',
				fechaReg TIMESTAMP DEFAULT LOCALTIME
		);

-- * Restringir la duplicidad de valores: En ocasiones, una columna puede restringir los valores para que no se registre de otra forma, es decir no existan repetidos.ADD
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO UNIQUE,
				COLUMNA2 TIPO,
				...
				COLUMNAN TIPO 
		);

-- TODO: Example:
CREATE TABLE IF NOT EXISTS  producto(
				idProducto CHAR(5) NOT NULL,
				descripcion VARCHAR(100) NOT NULL UNIQUE,
				precio DECIMAL(6,2) NOT NULL ,
				stock INT NOT NULL ,
				fechaReg TIMESTAMP DEFAULT LOCALTIME
		);

-- o crear la tabla y luego modificarla:
CREATE TABLE IF NOT EXISTS  producto(
				idProducto CHAR(5) NOT NULL,
				descripcion VARCHAR(100) NOT NULL,
				precio DECIMAL(6,2) NOT NULL ,
				stock INT NOT NULL ,
				fechaReg TIMESTAMP DEFAULT LOCALTIME
		);
ALTER TABLE producto MODIFY descripcion VARCHAR(100) NOT NULL UNIQUE;

-- ! Creación de tablas relacionales:
-- * Asignación de la llave primaria: La llave primaria, también conocida como principal o simplemente clave, permite definir un identificador único en una tabla, Una o mas columnas pueden ser declaradas como llave dentro de la misma tabla.

-- ? Primera forma:
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO NOT NULL PRIMARY KEY,
				COLUMNA2 TIPO,
				...
				COLUMNAN TIPO 
		);
-- ? Segunda forma:
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO NOT NULL,
				COLUMNA2 TIPO,
				...
				COLUMNAN TIPO,
				PRIMARY KEY (COLUMNA1)
		);
-- ? Tercera forma:
CREATE TABLE IF NOT EXISTS  NOMBRE_DE_TABLA(
				COLUMNA1 TIPO NOT NULL,
				COLUMNA2 TIPO,
				...
				COLUMNAN TIPO 
		);
ALTER TABLE NOMBRE_DE_TABLA ADD PRIMARY KEY(COLUMNA1);

-- * Asignación de llave foránea: La asignación de una llave foránea implementa una base de datos relacional. normalmente se aplica en una columna de la tabla secundaria
ALTER TABLE NOMBRE_DE_TABLA ADD FOREIGN KEY(columna_actual) REFERENCES NOMBRE_DE_TABLA_ASOCIADA(columna_asociada);

-- TODO: Example:
CREATE TABLE IF NOT EXISTS  detalleBoleta(
				NUM_BOLETA INT NOT NULL PRIMARY KEY,
				ID_PRODUCTO CHAR(5) NOT NULL,
				CANTIDAD INT NOT NULL
		);
ALTER TABLE detalleBoleta ADD FOREIGN KEY(ID_PRODUCTO) REFERENCES producto(idProducto);
DESCRIBE detalleBoleta;