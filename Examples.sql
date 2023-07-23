-- Crea una base de datos llamada "cursosql"
CREATE DATABASE cursosql;
-- "USE" es utiliza para seleccionar la base de datos en la que queremos trabajar
USE cursosql;
-- "CREATE TABLE" se usa para la creación de una tabla en este caso "animales"
CREATE TABLE animales(
  id int not null AUTO_INCREMENT,
  -- el campo es de tipo auto incremental
  tipo varchar(255) not null,
  estado varchar(255) not null,
  PRIMARY KEY(id) -- Se determina cual sera la llama primaria o identificador principal de la tabla
);
-- "INSERT INTO" es las sentencia usada para ingresar datos a la tabla anteriormente creada
INSERT INTO
  animales (tipo, estado)
VALUES('Tigre', 'Hambriento');
-- Se define los campos y los valores a ingresar
  -- "SELECT" sera el comando para realizar una búsqueda o consulta en la base de datos sobre la tabla, en este caso animales.
SELECT
  *
FROM
  animales;
-- "SHOW CREATE" lo podemos usar para que MySQL nos muestre la instrucción usada para crear la tabla animales
  SHOW CREATE TABLE animales;
-- Otros registros
INSERT INTO
  animales (tipo, estado)
VALUES('Leon', 'de Juda');
INSERT INTO
  animales (tipo, estado)
VALUES('Aguila', 'Atenta');
CREATE TABLE user(
    id int not null AUTO_INCREMENT,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    PRIMARY KEY(id)
  );
INSERT INTO
  user (name, edad, email)
VALUES('Oscar', 25, 'oscar@gmail.com');
INSERT INTO
  user (name, edad, email)
VALUES('Julieth', 35, 'juliy@gmail.com');
INSERT INTO
  user (name, edad, email)
VALUES('Dylan', 12, 'dylan@gmail.com');
INSERT INTO
  user (name, edad, email)
VALUES('Yolanda', 52, 'yoly@gmail.com');
INSERT INTO
  user (name, edad, email)
VALUES('Hernan', 55, 'hernan@gmail.com');