-- ! Sentencias de Manipulación de Datos SMD
-- * Las sentencias de manipulación corresponden al manejo de todos los datos que se pueden registrar en tablas previamente implementadas

--! Sentencia INSERT
--? Permite insertar registros en una tabla de un base de datos activa.
INSERT INTO NOMBRE_TABLA [(LISTA_COLUMNAS)] VALUES ('LISTA_VALORES');

-- INSERT INTO  = Es la palabra clave que se usa para insertar.
-- NOMBRE_TABLA = Es el nombre de la tabla destino, es decir, la que recibirá los datos.
-- LISTA_COLUMNAS = Esta permite especificar las columnas que tendrán un valor de registro, esta a su vez define el orden de ingreso de dichos valores.
-- VALUES = Sentencia para indicar que a continuación vendrán los valores a registrar.
-- LISTA_VALORES = Aquí se registran los valores según las columnas especificas en la tabla de destino. Se debe registrar valores separados por comas.

-- TODO: Example:
--? Caso 1:
INSERT INTO producto VALUES ('P0001', 'PYE DE MANZANA', 20, 500, '2023/08/04');
--? Caso 2:
INSERT INTO producto (`idProducto`, `descripcion` , precio, stock, `fechaVen`) VALUES ('P0001', 'PYE DE MANZANA', 20, 500, '2023/08/04');

--! Sentencia UPDATE
--? Permite modificar o actualizar un conjunto de registros de una tabla. Estos cambios dependerán directamente de na condición sobre una o más columnas de la tabla.
UPDATE NOMBRE_TABLA SET COLUMNAS = VALOR_A_INGRESAR WHERE CONDICION;

-- UPDATE = Es la palabra para denotar que se va a realizar la operación de modificación
-- NOMBRE_TABLA = Aquí se especifica el nombre de la tabla sober la cual se van a realizar las operaciones
-- SET = Aquí se especifica la o las columnas que se actualizarán en una determinada tabla.
-- COLUMNAS = Aquí se especifica el nombre de las columna que desea actualizar.
-- VALOR_A_INGRESAR  = Puede asignar un valor directamente para ser actualizado.
-- WHERE = Palabra reservada para especificar que se deben cumplir una o varias condiciones ejecutar la sentencia.
-- CONDICION = La condición especifica que debe cumplir y que de ser asi realice la modificación sobre la tabla

-- TODO: Example:
--? Caso 1:
UPDATE producto SET stock = stock*2 WHERE `idProducto`='P0001';
--? Caso 2:
UPDATE producto SET `fechaVen` = '2023/08/05' WHERE `idProducto`='P0001';

--! Sentencia DELETE
--? Permite eliminar todos los registros específicos en una determinada tabla.
DELETE FROM NOMBRE_TABLA WHERE CONDICION;

-- DELETE = Palabra reservada que permite indicar que se va a realizar la eliminación de un registros sobre una tabla determinada.
-- FROM = Se usa para determinar a continuación la tabla sobre la uqe se desea trabajar.
-- NOMBRE_TABLA = Se indica la tala sobre  la qu se desea realizar la eliminación del registro
-- WHERE = Palabra para establecer la condición a cumplirse
-- CONDICION = La condición que debe cumplirse para realizar la eliminación del registro

-- TODO: Example:
DELETE FROM producto WHERE `idProducto` = 'P0001';

--! Sentencia TRUNCATE
--? Permite eliminar todos los registros de una tabla, se diferencia con DELETE en el tiempo de respuesta.

TRUNCATE NOMBRE_TABLA;

-- TODO: Example:
TRUNCATE producto;

--! Consulta básica con la sentencia SELECT
--? La sentencia SELECT es la única que permite consultar información de forma que puede devolver un registro completo de datos o un valor.
--? Caso 1 todas las columnas:
SELECT * FROM NOMBRE_TABLA;
-- TODO: Example:
SELECT * FROM producto;

--? Caso 2 limitando las columnas:
SELECT COLUMNAS FROM NOMBRE_TABLA;
-- TODO: Example:
SELECT idProducto, descripcion, stock FROM producto ;

--? Caso 3 dándole nombre a las columnas a mostrar:
SELECT COLUMNAS as NOMBRE_PARA_COLUMNA FROM NOMBRE_TABLA;
-- TODO: Example:
SELECT idProducto AS 'Cod del producto', descripcion as 'Descripcion del producto', stock as 'Cantidad en inventario' FROM producto ;

--! Restringir la muestra de datos repetidos DISTINCT
--? DISTINCT, Este tipo de consulta permite listar los registros de una tabla sin repetirse
SELECT DISTINCT NOMBRE_COLUMNA FROM NOMBRE_TABLA;

-- TODO: Example:
SELECT DISTINCT `id_distrito` FROM cliente;
SELECT DISTINCT YEAR(`fechaVen`) FROM producto;

--! Ordenar de forma ascendente o descendente los registros de una tabla ORDER BY 
--? ORDER BY ASC DESC
SELECT NOMBRE_COLUMNA FROM NOMBRE_TABLA ORDER BY COLUMNA ASC|DESC;

-- TODO: Example:
--? Caso 1 Orden ascendente
SELECT * FROM producto ORDER BY descripcion ASC;
--? Caso 2 Orden descendente
SELECT * FROM producto ORDER BY descripcion DESC;

--! Limitar los resultados de una consulta LIMIT
--? Este tipo de consulta nos permite lista una cantidad de registros a partir de una consulta
SELECT * FROM NOMBRE_TABLA LIMIT NUMERO_REGISTROS;

-- TODO: Example:
--? Caso 1
SELECT * FROM producto LIMIT 3;
--? Caso 2
SELECT * FROM producto ORDER BY precio DESC LIMIT 3;

--! Combinación de tablas con INNER JOIN
--? La combinación de tablas permite mostrar información cruzada entre dos o más tablas para diferentes procesos. Todo proviene dela llave foránea de una tabla, ya que es la que permite acceder a otras tablas y así combinarlas.
INNER JOIN NOMBRE_TABLA1 ON NOMBRE_TABLA2;
-- TODO: Example:
--? Caso 1
SELECT * FROM cliente C INNER JOIN distrito D ON C.id_distrito = D.id_distrito;

--! LEFT JOIN
--? La combinación con LEFT JOIN permite mostrar información de ambas tablas, haciendo que la tabla de la izquierda muestre todos los registros; esto forzará a la tabla de la derecha a mostrar NULL en aquellos valores que no se combinen
SELECT * FROM NOMBRE_TABLA1 LEFT JOIN NOMBRE_TABLA2 ON NOMBRE_TABLA1.COLUMNA = NOMBRE_TABLA2.COLUMNA;

-- TODO: Example:
--? Caso 1
SELECT * FROM DISTRITO D LEFT JOIN CLIENTE C ON D.id_distrito = C.id_distrito;
--? Caso 2
SELECT D.* FROM DISTRITO D LEFT JOIN CLIENTE C ON D.id_distrito = C.id_distrito WHERE C.idCliente IS NULL;

--! RIGHT JOIN
--? La combinación con RIGHT JOIN permite mostrar información de ambas tablas, haciendo que la tabla de la derecha muestre todos los registros; esto forzará a la tabla de la izquierda a mostrar NULL en aquellos valores que no se combinen
SELECT * FROM NOMBRE_TABLA1 RIGHT JOIN NOMBRE_TABLA2 ON NOMBRE_TABLA1.COLUMNA = NOMBRE_TABLA2.COLUMNA;

-- TODO: Example:
--? Caso 1
SELECT * FROM cliente C RIGHT JOIN DISTRITO D ON C.id_distrito = D.id_distrito;
--? Caso 2
SELECT D.* FROM DISTRITO D RIGHT JOIN CLIENTE C ON D.id_distrito = C.id_distrito WHERE C.idCliente IS NULL;

--! Clausula GROUP BY
--? La clausula GROUP BY agrupa un conjunto de registros de acuerdo a los valores de una o más columnas de una tabla.
SELECT COLUMNA_AGRUPAR, FUNCION_AGREGADA FROM NOMBRE_TABLA GROUP BY COLUMNA_AGRUPAR;
-- COLUMNA_AGRUPAR = Aquí se especifica el nombre de la columna a la que se desea crear la agrupación. Es necesario considerar que si hay más de una columna, estas deberán estar especificadas también en la clausula GROUP BY
-- FUNCION_AGREGADA = Es una función estándar de MySQL como SUM, COUNT, MAX, MIN y AVG

--? COUNT = Esta función permite contar un determinado numero de registros según el criterio especificado pr el usuario.
COUNT(*) o COUNT(NOMBRE_COLUMNA);
-- TODO: Example:
SELECT COUNT(*) AS 'TOTAL DE CLIENTES' FROM cliente;

--? SUM = Esta función permite devolver la suma de todos los valores contenidos en una columna de valores numéricos
SUM(NOMBRE_COLUMNA O EXPRESIÓN);
-- TODO: Example:
SELECT SUM(producto.stock) AS 'TOTAL DE PRODUCTOS' FROM producto;

--? MAX = Esta función permite determinar el valor máximo encontrado en una columna de valores numéricos, el tipo de dato debe ser entero de lo contrario genera un error.
MAX(NOMBRE_COLUMNA O EXPRESIÓN);
-- TODO: Example:
SELECT MAX(precio) AS 'PRECIO ALTO' FROM producto;

--? MIN = Esta función permite determinar el valor mínimo encontrado en una columna de valores numéricos, el tipo de dato debe ser entero de lo contrario genera un error.
MIN(NOMBRE_COLUMNA O EXPRESIÓN);
-- TODO: Example:
SELECT MIN(precio) AS 'PRECIO BAJO' FROM producto;

--? AVG = Esta función permite determinar el promedio de los valores de un determinado grupo. Se debe considerar que dicha columna debe ser numérica.
AVG(NOMBRE_COLUMNA O EXPRESIÓN);
-- TODO: Example:
SELECT AVG(precio) AS 'PROMEDIO DE PRECIOS' FROM producto;

--? HAVING = Permite condicionar los resultados a partir de una agrupación, es decir, evaluará qué registros debe mostrar después de la agrupación de valores. Normalmente HAVING es usado después de la clausula GROUP BY
HAVING(CONDICIÓN);
-- TODO: Example:
SELECT YEAR(B.FECHA) AS 'AÑO' SUM(D.CANTIDAD*PRECIO) AS 'SUBTOTAL' 
FROM BOLETA B 
INNER JOIN DETALLEBOLETA D ON B.NUM_BOLETA = D.NUM_BOLETA 
INNER JOIN PRODUCTO P ON P.idProducto = D.ID_PRODUCTO
GROUP BY YEAR(B.FECHA)
HAVING AÑO= 2023;
