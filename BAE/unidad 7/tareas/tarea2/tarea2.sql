-- TAREA 2
-- TRABAJO CON ÍNDICES

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea2

-- Accedemos a la base de datos con el coamndo:
USE tarea2

-- Se pide:
-- 1. Elimine la tabla "cliente" si existe.
-- Nota: Muestra el comando y la salida.
DROP TABLE IF EXISTS cliente;
/** Query OK, 0 rows affected, 1 warning (0,02 sec) **/

-- 2. Cree la tabla si clave primaria y incluye a posteriori esta.
-- Nota: Muestra el comando y la salida.
CREATE TABLE clientes (
    documento char (8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar (20),
    telefono varchar(11)
);
/** Query OK, 0 rows affected (0,14 sec) **/
ALTER TABLE clientes ADD PRIMARY KEY(documento);
/** Query OK, 0 rows affected (0,46 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/

-- 3. Define los siguientes indices:
-- 3.1 Un índice único por el campo "documento" y un índice común por ciudad y provincia.
-- Nota: Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
CREATE UNIQUE INDEX idx_documento ON clientes(documento);
/** Query OK, 0 rows affected (0,10 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
CREATE INDEX idx_ciudad_provincia ON clientes(ciudad, provincia);
/** Query OK, 0 rows affected (0,06 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/

-- 3.2 Vea los índices de la tabla.
-- Nota: Muestra el comando y la salida "show index".
SHOW INDEXES from clientes;
/**
+----------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clientes |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 4. Agregue un índice único por el campo "telefono".
-- Nota: Muestra el comando y la salida.
CREATE INDEX idx_telefono ON clientes(telefono);
/** Query OK, 0 rows affected (0,07 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
/**
+----------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clientes |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | idx_telefono         |            1 | telefono    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 5. Elimina los índices.
-- Nota: Muestra el comando y la salida.
DROP INDEX idx_documento ON clientes;
/** Query OK, 0 rows affected (0,05 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
DROP INDEX idx_ciudad_provincia ON clientes;
/** Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
DROP INDEX idx_telefono ON clientes;
/** Query OK, 0 rows affected (0,08 sec)
Records: 0  Duplicates: 0  Warnings: 0 **/
/** 
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clientes |          0 | PRIMARY  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

ALTER TABLE DROP PRIMARY