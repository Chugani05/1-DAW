-- TAREA 3
-- TRABAJO CON ÍNDICES

-- Las operaciones son las siguientes:
-- 1. Crea una base de datos que tendrá por nombre Base_Indices.
CREATE DATABASE Base_Indices;

-- Accedemos a la base de datos con el coamndo:
USE Base_Indices;

-- 2. En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:
CREATE TABLE MOVIMIENTO (
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    Articulo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL
);

-- 3. Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.
-- Nota: Muestra el resultado y razona la respueta.
SHOW INDEXES from MOVIMIENTO;
/**
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 4. Ejecuta la siguiente sentencia sql para generar datos de prueba:
    CREATE TABLE NumerosUnicos (
    Numero INT AUTO_INCREMENT PRIMARY KEY
    );

    INSERT INTO NumerosUnicos (Numero)
    SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
    SELECT 
        n.Numero,
        CONCAT('Producto', n.Numero),
        DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
        FLOOR(RAND() * 1000000) + 1
    FROM 
        NumerosUnicos n;

        DROP TABLE NumerosUnicos;
-- Nota: Muestra el resultado y razona la respueta. Ejecuta un count sobre la tabla.
/**
+----------------------+
| count(Identificador) |
+----------------------+
|                 3588 |
+----------------------+
**/

-- 5. Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a la que llamaremos MOVIMIENTO_BIS.
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
-- Nota: Muestra el resultado y razona la respueta.
/** Query OK, 3588 rows affected (0,25 sec)
Records: 3588  Duplicates: 0  Warnings: 0 **/

-- 6. Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?
-- Nota: Compara el resultado con la tabla MOVIMIENTO.
describe MOVIMIENTO_BIS;
/**
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
**/
/** No se clonan las 'Key' ni los 'Extra' **/

-- 7. Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.
explain select * from MOVIMIENTO where identificador=3;
/**
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
**/
explain select * from MOVIMIENTO_BIS where identificador=3;
/**
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3588 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
**/
/** En la tabla MOVIMIENTO va directamente a esa columna porque tiene primary key, en cambio, en la tabla MOVIMIENTO_BIS tiene que recorrer una por una todas las columnas**/

-- 8. Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).
CREATE INDEX IX_FECHA_BIS ON MOVIMIENTO_BIS(Fecha);
/** Query OK, 0 rows affected (0,26 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
CREATE INDEX IX_IDENTIFICADOR ON MOVIMIENTO_BIS(Identificador);
/** Query OK, 0 rows affected (0,26 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
SHOW INDEXES from MOVIMIENTO_BIS;
/**
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO_BIS |          1 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3588 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 9. Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: 
/** Consulta1: **/ select * from MOVIMIENTO where identificador=3;
/** Consulta 2 **/ select identificador from MOVIMIENTO_BIS where identificador=3;
-- Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así? En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.
/** En la consulta 1, el motor de base de datos está buscando a través del índice PRIMARY, que generalmente es el índice principal de la tabla y generalmente está asociado con la clave primaria de la tabla. Dado que estamos filtrando por el campo identificador, que podría ser parte de la clave primaria, el motor de base de datos opta por usar este índice para la búsqueda, ya que es eficiente para buscar valores únicos.
En la consulta 2, el motor de base de datos está buscando a través del índice IX_IDENTIFICADOR, que probablemente es un índice secundario creado específicamente en la columna identificador. Esto se hace para optimizar las consultas que filtran por este campo. El motor de base de datos utiliza este índice porque está diseñado para permitir búsquedas eficientes basadas en el campo identificador, que es precisamente lo que estamos haciendo en la consulta. **/

-- 10. Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
/** Consulta 1: **/ SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ and ‘01/03/2012’;
/** Consulta 2: **/ SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN ‘01/01/2012’ and ‘01/03/2012’;
-- Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así? En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.
/** En la consulta 1, el motor de base de datos realizará un escaneo completo de la tabla para encontrar las filas dentro del rango de fechas especificado.
En la consulta 2, el motor de base de datos utilizará el índice 'IX_FECHA_BIS' para buscar eficientemente las filas dentro del rango especificado, lo que debería ser más eficiente que un escaneo completo de la tabla. **/

-- 11. Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.
CREATE INDEX IX_FECHA ON MOVIMIENTO(Fecha);
/** Query OK, 0 rows affected (0,20 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/

-- 12. Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.
SHOW INDEXES FROM MOVIMIENTO;
/**
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/
SHOW INDEXES FROM MOVIMIENTO_BIS;
/**
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO_BIS |          1 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3588 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 13. Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
/** Consulta 1: **/ SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
/** Consulta 2: **/ SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
/** Consulta 3: **/ SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
/** Consulta 4: **/ SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN ‘01/01/2012’ AND ‘01/03/2012’;
/** Consulta 1: selecciona solo la columna fecha, utilizará el índice en fecha para buscar eficientemente dentro del rango especificado.
Consulta 2: selecciona todas las columnas, opta por realizar un escaneo completo de la tabla debido a la selección de todas las columnas.
Consulta 3: selecciona solo la columna fecha, utilizará el índice en fecha para buscar eficientemente dentro del rango especificado.
Consulta 4: selecciona todas las columnas, opta por realizar un escaneo completo de la tabla debido a la selección de todas las columnas. **/