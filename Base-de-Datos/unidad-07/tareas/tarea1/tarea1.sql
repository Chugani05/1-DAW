-- TAREA 1 
-- TRABAJO CON ÍNDICES

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea1

-- Accedemos a la base de datos con el coamndo:
USE tarea1

-- Se pide:
-- 1. Elimine la tabla "alumno" si existe.
-- Nota: Muestra el comando y la salida.
DROP TABLE IF EXISTS alumno;
/** Query OK, 1 row affected, 1 warning (0,02 sec) **/

-- 2. Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
-- Nota: Muestra el comando y la salida.
CREATE TABLE alumno (
    numero_inscripcion INT,
    anio_inscripcion INT,
    nombre VARCHAR(50),
    cial VARCHAR(20),
    domicilio VARCHAR(50),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    PRIMARY KEY (numero_inscripcion, anio_inscripcion)
);
/** Query OK, 0 rows affected (0,14 sec) **/

-- 3. Define los siguientes indices:
-- 3.1 Un índice único por el campo "documento" y un índice común por ciudad y provincia.
-- Nota: Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
CREATE UNIQUE INDEX idx_documento ON alumno(cial);
CREATE INDEX idx_ciudad_provincia ON alumno(ciudad, provincia);
/** Query OK, 0 rows affected (0,07 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/

-- 3.2 Vea los índices de la tabla.
-- Nota: Muestra el comando y la salida "show index".
SHOW INDEXES FROM alumno;
/** 
+--------+------------+----------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name             | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY              |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY              |            2 | anio_inscripcion   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | idx_documento        |            1 | cial               | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 4. Intente ingresar un alumno con clave primaria repetida.
-- Nota: Muestra el comando y la salida.
INSERT INTO alumno (numero_inscripcion, anio_inscripcion, nombre, cial, domicilio, ciudad, provincia) 
VALUES (1, 2022, 'Juan', '12345678A', '25 de la Calle Rodeo', 'Ciudad A', 'Provincia A'),
(2, 2022, 'María', '23456789B', '17 de la Calle Circo', 'Ciudad B', 'Provincia B'),
(3, 2022, 'Pedro', '34567891C', '01 de la Calle Ambulatorio', 'Ciudad C', 'Provincia C'),
(1, 2022, 'Lola', '45678912D', '13 de la Calle Sal', 'Ciudad D', 'Provincia D');
/** ERROR 1062 (23000): Duplicate entry '1-2022' for key 'alumno.PRIMARY' **/

-- 5. Intente ingresar un alumno con documento repetido.
-- Nota: Muestra el comando y la salida.
INSERT INTO alumno (numero_inscripcion, anio_inscripcion, nombre, cial, domicilio, ciudad, provincia) 
VALUES (1, 2022, 'Juan', '12345678A', '25 de la Calle Rodeo', 'Ciudad A', 'Provincia A'),
(2, 2022, 'María', '23456789B', '17 de la Calle Circo', 'Ciudad B', 'Provincia B'),
(3, 2022, 'Pedro', '34567891C', '01 de la Calle Ambulatorio', 'Ciudad C', 'Provincia C'),
(4, 2022, 'Lola', '12345678A', '13 de la Calle Sal', 'Ciudad D', 'Provincia D');
/** ERROR 1062 (23000): Duplicate entry '12345678A' for key 'alumno.idx_documento' **/

-- 6. Ingrese varios alumnos de la misma ciudad y provincia.
-- Nota: Muestra el comando y la salida.
INSERT INTO alumno (numero_inscripcion, anio_inscripcion, nombre, cial, domicilio, ciudad, provincia) 
VALUES (1, 2022, 'Juan', '12345678A', '25 de la Calle Rodeo', 'Ciudad A', 'Provincia A'),
(2, 2022, 'María', '23456789B', '17 de la Calle Circo', 'Ciudad B', 'Provincia B'),
(3, 2022, 'Pedro', '34567891C', '01 de la Calle Ambulatorio', 'Ciudad C', 'Provincia C'),
(4, 2022, 'Lola', '45678912D', '13 de la Calle Sal', 'Ciudad A', 'Provincia A');
/** Query OK, 4 rows affected (0,03 sec)
Records: 4  Duplicates: 0  Warnings: 0 **/

-- 7. Elimina los indices creados, y muestra que ya no se encuentran.
-- Nota: Muestra el comando y la salida.
DROP INDEX idx_documento ON alumno;
DROP INDEX idx_ciudad_provincia ON alumno;
/** Query OK, 0 rows affected (0,06 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
/**
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | anio_inscripcion   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/