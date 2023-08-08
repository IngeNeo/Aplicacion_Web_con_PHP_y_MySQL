-- * Creando la base de datos Ventas2023
DROP DATABASE IF EXISTS VENTAS2023;
CREATE DATABASE VENTAS2023;

--* Activando la base de datos
USE VENTAS2023;

--* Implementando la tabla de producto
--! Validando la existencia de la tabla producto y en caso de existir eliminarla
DROP TABLE IF EXISTS producto;

--? Creando la tabla de producto
CREATE TABLE producto(
	ID_PRODUCTO CHAR(5),
	DESCRIPCION VARCHAR(50),
	PRECIO DECIMAL(8,2),
	STOCK INT(11),
	FECHA_VENC DATE
);

--? Agregando la llave primaria
ALTER TABLE producto ADD PRIMARY KEY(ID_PRODUCTO);
ALTER TABLE producto MODIFY ID_PRODUCTO CHAR(5) NOT NULL;
ALTER TABLE producto MODIFY DESCRIPCION VARCHAR(50) NOT NULL;
ALTER TABLE producto MODIFY PRECIO DECIMAL(8,2) NOT NULL;
ALTER TABLE producto MODIFY STOCK INT NOT NULL;

--* Implementando la tabla de distrito 
--! Validando la existencia de la tabla distrito y en caso de existir eliminarla
DROP TABLE IF EXISTS distrito;
CREATE TABLE distrito(
	ID_DISTRITO CHAR(5) NOT NULL,
	DESCRIPCION VARCHAR(50) NOT NULL
);

--? Agregando la llave primaria
ALTER TABLE distrito ADD PRIMARY KEY(ID_DISTRITO);

--* Implementando la tabla de cliente  
--! Validando la existencia de la tabla cliente y en caso de existir eliminarla
DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente(
	ID_CLIENTE CHAR(5) NOT NULL,
	NOMBRES VARCHAR(30) NOT NULL,
	PATERNO VARCHAR(30) NOT NULL,
	MATERNO VARCHAR(30) NOT NULL,
	DIRECCION VARCHAR(40) NULL,
	FONO CHAR(15) NULL,
	EMAIL VARCHAR(50) NULL,
	ID_DISTRITO CHAR(5) NOT NULL
	);

--? Agregando la llave primaria
ALTER TABLE cliente ADD PRIMARY KEY(ID_CLIENTE);
--? Agregando la llave foránea
ALTER TABLE cliente ADD FOREIGN KEY(ID_DISTRITO) REFERENCES distrito(ID_DISTRITO);

--* Implementando la tabla de boleta 
--! Validando la existencia de la tabla boleta y en caso de existir eliminarla
DROP TABLE IF EXISTS boleta;
CREATE TABLE boleta(
		NUM_BOLETA INT AUTO_INCREMENT,
		FECHA DATE NOT NULL,
		ID_CLIENTE CHAR(5) NOT NULL,
		PRIMARY KEY(NUM_BOLETA)
	);

--? Agregando la llave foránea
ALTER TABLE boleta ADD FOREIGN KEY(ID_CLIENTE) REFERENCES cliente(ID_CLIENTE);
--? Modificando el numero autoincrementado
ALTER TABLE boleta AUTO_INCREMENT 1;

--* Implementando la tabla de detalleBoleta 
--! Validando la existencia de la tabla detalleBoleta y en caso de existir eliminarla
DROP TABLE IF EXISTS detalleBoleta;
CREATE TABLE detalleBoleta(
	NUM_BOLETA INT(11) NOT NULL,
	ID_PRODUCTO CHAR(5) NOT NULL,
	CANTIDAD INT(11) NOT NULL
);

--? Agregando la llave primaria
ALTER TABLE detalleBoleta ADD PRIMARY KEY(NUM_BOLETA, ID_PRODUCTO);
--? Agregando la llave foránea boleta
ALTER TABLE detalleBoleta ADD FOREIGN KEY(NUM_BOLETA) REFERENCES boleta(NUM_BOLETA);
--? Agregando la llave foránea producto
ALTER TABLE detalleBoleta ADD FOREIGN KEY(ID_PRODUCTO) REFERENCES producto(ID_PRODUCTO);