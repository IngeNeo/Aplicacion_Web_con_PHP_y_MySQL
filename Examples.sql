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
UPDATE
  animales
SET
  estado = 'Feliz'
WHERE
  id = '4';
-- Actualiza el valor de estado en la tabla animales en donde su llave principal o primaria sea 2
DELETE FROM
  animales
WHERE
  estado = 'Feliz';
-- Elimina el registro de la tabla animales donde si estado sea Feliz, aunque este ejemplo arroja error pues por seguridad MySQL no permite la eliminación de registros si no se realiza a traves de una llave primaria
DELETE FROM
  animales
WHERE
  id = '3';
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
SELECT
  *
FROM
  user;
SELECT
  *
FROM
  user
LIMIT
  1;
-- Limita la consulta a 1 solo resultado
SELECT
  *
FROM
  user
WHERE
  edad > 12;
-- la consulta debe cumplir el criterio que la edad sea mayor a 12 años
SELECT
  *
FROM
  user
WHERE
  edad >= 12;
SELECT
  *
FROM
  user
WHERE
  edad > 12
  AND email = 'oscar@gmail.com';
-- Debe cumplir con ambas condiciones para ser desplegado el resultado
SELECT
  *
FROM
  user
WHERE
  edad > 60
  OR email = 'dylan@gmail.com';
-- Debe cumplir con alguna de las condiciones para ser desplegado el resultado, sea edad o el correo
SELECT
  *
FROM
  user
WHERE
  email != 'dylan@gmail.com';
-- Nos mostrara todos los registro cuyo email sea diferente a dylan@gmail
SELECT
  *
FROM
  user
WHERE
  edad BETWEEN 10
  AND 40;
-- Nos mostrara los registros donde la edad este en el rango de 10 a 40 años
SELECT
  *
FROM
  user
WHERE
  email LIKE '%gmail%';
-- buscara en el campo email todos los registros que contengan la cadena gmail sin importar en que posición este dicha palabra
SELECT
  *
FROM
  user
WHERE
  email LIKE 'gmail%';
-- busca la palabra gmail al comienzo de la cadena sin importar como termina
SELECT
  *
FROM
  user
WHERE
  email LIKE '%gmail';
-- busca la palabra gmail al final de la cadena sin importar como inicia
SELECT
  *
FROM
  user
WHERE
  email LIKE 'hernan%';
SELECT
  *
FROM
  user
ORDER BY
  edad ASC;
-- Ordena la búsqueda por edad en orden ascendente
SELECT
  *
FROM
  user
ORDER BY
  edad DESC;
-- Ordena la búsqueda por edad en orden descendente
SELECT
  MAX(edad) AS Mayor
FROM
  user;
-- trae los datos del registro cuya edad sea la mayor con el "alias Mayor" usando el comando "AS" y el nombre de dicho alias que deseamos que se muestre
SELECT
  MIN(edad) AS Menor
FROM
  user;
-- trae los datos del registro cuya edad sea la menor con el "alias Menor" usando el comando "AS" y el nombre de dicho alias que deseamos que se muestre
SELECT
  id,
  name
FROM
  user;
SELECT
  id,
  name AS Nombre
FROM
  user;
-- Podemos "renombrar" como deseamos que se vea el nombre del campo el la salida de la consulta en este caso en Nombre
  CREATE Table products(
    id int not null AUTO_INCREMENT,
    name VARCHAR(50) not null,
    created_by int not null,
    marca VARCHAR(50) not null,
    PRIMARY KEY (id),
    FOREIGN KEY(created_by) REFERENCES user(id)
  );
RENAME TABLE products to product;
-- Renombra la tabla products a product en singular
INSERT INTO
  product (NAME, created_by, marca)
VALUES
  ('ipad', 1, 'apple'),
  ('iphone', 1, 'apple'),
  ('watch', 2, 'apple'),
  ('macbook', 1, 'apple'),
  ('imac', 3, 'apple'),
  ('ipad mini', 2, 'apple');
-- Podemos insertar varios elementos en una sola sentencia de esta forma
SELECT
  *
FROM
  product;
--LEFT JOIN
SELECT
  U.id,
  U.email,
  P.name
FROM
  user U
  LEFT JOIN product P ON U.id = P.created_by;
-- Este es el uso del left join, el cual consiste en la unión de 2 tablas, trayendo la información de la tabla user con los productos creados por dicho usuario si no tiene productos lo deja vacio.
  --RIGHT JOIN
SELECT
  U.id,
  U.email,
  P.name
FROM
  user U
  RIGHT JOIN product P ON U.id = P.created_by;
-- Este es el uso del right join, el cual consiste en la unión de 2 tablas, trayendo la información de la tabla productos con los usuarios que los crearon si no tiene productos asociados no muestra al user.
  --INNER JOIN
SELECT
  U.id,
  U.email,
  P.name
FROM
  user U
  INNER JOIN product P ON U.id = P.created_by;
-- Este es el uso del inner join, el cual consiste en la unión de 2 tablas, trayendo la información de la tabla productos y de user solo si coinciden en ambas tablas.
  -- GROUP BY
SELECT
  COUNT(id),
  marca
FROM
  product
GROUP BY
  marca;
-- Nos agrupa el resultado basado en la marca y nos hace un conteo de registros
  -- GROUP BY y LEFT JOIN
SELECT
  COUNT(p.id),
  u.name
FROM
  product p
  LEFT JOIN user u on u.id = p.created_by
GROUP BY
  p.created_by;
-- Nos agrupa el resultado basado en la cantidad de productos creados por los usuarios en la tabla user
  -- GROUP BY y LEFT JOIN
SELECT
  COUNT(p.id),
  u.name
FROM
  product p
  LEFT JOIN user u on u.id = p.created_by
GROUP BY
  p.created_by;
-- Nos agrupa el resultado basado en la cantidad de productos creados por los usuarios en la tabla user
  -- GROUP BY y HAVING
SELECT
  COUNT(p.id),
  u.name
FROM
  product p
  LEFT JOIN user u on u.id = p.created_by
GROUP BY
  p.created_by
HAVING
  COUNT(p.id) >= 2;
-- Nos agrupa el resultado basado en la cantidad de productos creados por los usuarios en la tabla user y descarta cuando el conteo se menor a 2
  -- DROP TABLE
  DROP TABLE animales;
-- Elimina la tabla y sus registros de la base de datos