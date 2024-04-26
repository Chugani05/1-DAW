-- TAREA 2
-- MIGRACIÓN Y PRIMEROS PASOS EN MYSQL
-- Migramos la BBDD dada en sqlite3 a MySQL:
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(50)
);

INSERT INTO clientes (nombre, direccion) VALUES
    ('Cliente 1', 'Dirección 1'),
    ('Cliente 2', 'Dirección 2'),
    ('Cliente 3', 'Dirección 3'),
    ('Cliente 4', 'Dirección 4'),
    ('Cliente 5', 'Dirección 5'),
    ('Cliente 6', 'Dirección 6'),
    ('Cliente 7', 'Dirección 7'),
    ('Cliente 8', 'Dirección 8'),
    ('Cliente 9', 'Dirección 9'),
    ('Cliente 10', 'Dirección 10'),
    ('Cliente 11', 'Dirección 11'),
    ('Cliente 12', 'Dirección 12'),
    ('Cliente 13', 'Dirección 13'),
    ('Cliente 14', 'Dirección 14'),
    ('Cliente 15', 'Dirección 15'),
    ('Cliente 16', 'Dirección 16'),
    ('Cliente 17', 'Dirección 17'),
    ('Cliente 18', 'Dirección 18'),
    ('Cliente 19', 'Dirección 19'),
    ('Cliente 20', 'Dirección 20');

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio FLOAT
);

INSERT INTO productos (nombre, precio) VALUES
    ('Producto 1', 10.99),
    ('Producto 2', 20.50),
    ('Producto 3', 30.99),
    ('Producto 4', 40.50),
    ('Producto 5', 50.99),
    ('Producto 6', 60.50),
    ('Producto 7', 70.99),
    ('Producto 8', 80.50),
    ('Producto 9', 90.99),
    ('Producto 10', 100.50),
    ('Producto 11', 110.99),
    ('Producto 12', 120.50),
    ('Producto 13', 130.99),
    ('Producto 14', 140.50),
    ('Producto 15', 150.99),
    ('Producto 16', 160.50),
    ('Producto 17', 170.99),
    ('Producto 18', 180.50),
    ('Producto 19', 190.99),
    ('Producto 20', 200.50);

CREATE TABLE IF NOT EXISTS ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO ordenes (id_cliente, id_producto, cantidad) VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 3),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2),
    (11, 11, 3),
    (12, 12, 2),
    (13, 13, 1),
    (14, 14, 2),
    (15, 15, 3),
    (16, 16, 2),
    (17, 17, 1),
    (18, 18, 2),
    (19, 19, 3),
    (20, 20, 2);

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea2

-- Accedemos a la base de datos con el coamndo:
USE tarea2


-- Realiza las siguientes consultas:
-- Consultas simples:
-- 1. Mostrar todos los clientes.
select * from clientes;
/**
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|          2 | Cliente 2  | Dirección 2   |
|          3 | Cliente 3  | Dirección 3   |
|          4 | Cliente 4  | Dirección 4   |
|          5 | Cliente 5  | Dirección 5   |
|          6 | Cliente 6  | Dirección 6   |
|          7 | Cliente 7  | Dirección 7   |
|          8 | Cliente 8  | Dirección 8   |
|          9 | Cliente 9  | Dirección 9   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
|         14 | Cliente 14 | Dirección 14  |
|         15 | Cliente 15 | Dirección 15  |
|         16 | Cliente 16 | Dirección 16  |
|         17 | Cliente 17 | Dirección 17  |
|         18 | Cliente 18 | Dirección 18  |
|         19 | Cliente 19 | Dirección 19  |
|         20 | Cliente 20 | Dirección 20  |
+------------+------------+---------------+
**/

-- 2. Mostrar todos los productos.
select * from productos;
/**
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           1 | Producto 1  |  10.99 |
|           2 | Producto 2  |   20.5 |
|           3 | Producto 3  |  30.99 |
|           4 | Producto 4  |   40.5 |
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |   60.5 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |   80.5 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 |  100.5 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 |  120.5 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 |  140.5 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 |  160.5 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 |  180.5 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 |  200.5 |
+-------------+-------------+--------+
**/

-- 3. Mostrar todas las órdenes.
select * from ordenes;
/**
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        2 |          2 |           2 |        1 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        5 |          5 |           5 |        1 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|        9 |          9 |           9 |        1 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       13 |         13 |          13 |        1 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       17 |         17 |          17 |        1 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+
**/

-- 4. Mostrar los primeros 5 clientes ordenados por nombre.
select * from clientes order by nombre limit 5;
/**
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
+------------+------------+---------------+
**/

-- 5. Mostrar los productos con un precio mayor a 50.
select * from productos where precio > 50;
/**
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |   60.5 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |   80.5 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 |  100.5 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 |  120.5 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 |  140.5 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 |  160.5 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 |  180.5 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 |  200.5 |
+-------------+-------------+--------+
**/

-- 6. Mostrar todas las órdenes realizadas por el cliente con ID 1.
select o.* from ordenes as o join clientes as c on c.id_cliente=o.id_orden where c.id_cliente=1;
/**
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
+----------+------------+-------------+----------+
**/

-- 7. Mostrar los clientes cuyos nombres comienzan con la letra "M".
select * from clientes where nombre regexp '^M';
/** Empty set **/

-- 8. Mostrar las órdenes que contienen más de 2 productos.
select * from ordenes where cantidad > 1;
/**
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+
**/

-- 9. Mostrar los productos ordenados por precio de forma descendente.
select * from productos order by precio desc;
/**
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|          20 | Producto 20 |  200.5 |
|          19 | Producto 19 | 190.99 |
|          18 | Producto 18 |  180.5 |
|          17 | Producto 17 | 170.99 |
|          16 | Producto 16 |  160.5 |
|          15 | Producto 15 | 150.99 |
|          14 | Producto 14 |  140.5 |
|          13 | Producto 13 | 130.99 |
|          12 | Producto 12 |  120.5 |
|          11 | Producto 11 | 110.99 |
|          10 | Producto 10 |  100.5 |
|           9 | Producto 9  |  90.99 |
|           8 | Producto 8  |   80.5 |
|           7 | Producto 7  |  70.99 |
|           6 | Producto 6  |   60.5 |
|           5 | Producto 5  |  50.99 |
|           4 | Producto 4  |   40.5 |
|           3 | Producto 3  |  30.99 |
|           2 | Producto 2  |   20.5 |
|           1 | Producto 1  |  10.99 |
+-------------+-------------+--------+
**/

-- Consultas de ejemplo para practicar joins
-- 1. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes
select c.*, o.* from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente;
/**
+------------+------------+---------------+----------+------------+-------------+----------+
| id_cliente | nombre     | direccion     | id_orden | id_cliente | id_producto | cantidad |
+------------+------------+---------------+----------+------------+-------------+----------+
|          1 | Cliente 1  | Dirección 1   |        1 |          1 |           1 |        2 |
|          2 | Cliente 2  | Dirección 2   |        2 |          2 |           2 |        1 |
|          3 | Cliente 3  | Dirección 3   |        3 |          3 |           3 |        3 |
|          4 | Cliente 4  | Dirección 4   |        4 |          4 |           4 |        2 |
|          5 | Cliente 5  | Dirección 5   |        5 |          5 |           5 |        1 |
|          6 | Cliente 6  | Dirección 6   |        6 |          6 |           6 |        2 |
|          7 | Cliente 7  | Dirección 7   |        7 |          7 |           7 |        3 |
|          8 | Cliente 8  | Dirección 8   |        8 |          8 |           8 |        2 |
|          9 | Cliente 9  | Dirección 9   |        9 |          9 |           9 |        1 |
|         10 | Cliente 10 | Dirección 10  |       10 |         10 |          10 |        2 |
|         11 | Cliente 11 | Dirección 11  |       11 |         11 |          11 |        3 |
|         12 | Cliente 12 | Dirección 12  |       12 |         12 |          12 |        2 |
|         13 | Cliente 13 | Dirección 13  |       13 |         13 |          13 |        1 |
|         14 | Cliente 14 | Dirección 14  |       14 |         14 |          14 |        2 |
|         15 | Cliente 15 | Dirección 15  |       15 |         15 |          15 |        3 |
|         16 | Cliente 16 | Dirección 16  |       16 |         16 |          16 |        2 |
|         17 | Cliente 17 | Dirección 17  |       17 |         17 |          17 |        1 |
|         18 | Cliente 18 | Dirección 18  |       18 |         18 |          18 |        2 |
|         19 | Cliente 19 | Dirección 19  |       19 |         19 |          19 |        3 |
|         20 | Cliente 20 | Dirección 20  |       20 |         20 |          20 |        2 |
+------------+------------+---------------+----------+------------+-------------+----------+
**/

-- 2. Seleccionar todas las órdenes junto con los productos correspondientes
select * from ordenes as o join productos as p on o.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------+-------------+-------------+--------+
| id_orden | id_cliente | id_producto | cantidad | id_producto | nombre      | precio |
+----------+------------+-------------+----------+-------------+-------------+--------+
|        1 |          1 |           1 |        2 |           1 | Producto 1  |  10.99 |
|        2 |          2 |           2 |        1 |           2 | Producto 2  |   20.5 |
|        3 |          3 |           3 |        3 |           3 | Producto 3  |  30.99 |
|        4 |          4 |           4 |        2 |           4 | Producto 4  |   40.5 |
|        5 |          5 |           5 |        1 |           5 | Producto 5  |  50.99 |
|        6 |          6 |           6 |        2 |           6 | Producto 6  |   60.5 |
|        7 |          7 |           7 |        3 |           7 | Producto 7  |  70.99 |
|        8 |          8 |           8 |        2 |           8 | Producto 8  |   80.5 |
|        9 |          9 |           9 |        1 |           9 | Producto 9  |  90.99 |
|       10 |         10 |          10 |        2 |          10 | Producto 10 |  100.5 |
|       11 |         11 |          11 |        3 |          11 | Producto 11 | 110.99 |
|       12 |         12 |          12 |        2 |          12 | Producto 12 |  120.5 |
|       13 |         13 |          13 |        1 |          13 | Producto 13 | 130.99 |
|       14 |         14 |          14 |        2 |          14 | Producto 14 |  140.5 |
|       15 |         15 |          15 |        3 |          15 | Producto 15 | 150.99 |
|       16 |         16 |          16 |        2 |          16 | Producto 16 |  160.5 |
|       17 |         17 |          17 |        1 |          17 | Producto 17 | 170.99 |
|       18 |         18 |          18 |        2 |          18 | Producto 18 |  180.5 |
|       19 |         19 |          19 |        3 |          19 | Producto 19 | 190.99 |
|       20 |         20 |          20 |        2 |          20 | Producto 20 |  200.5 |
+----------+------------+-------------+----------+-------------+-------------+--------+
**/

-- 3. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50
select c.nombre, p* from clientes as c join ordenes as o on c.id_cliente=o.id_cliente join productos as p on o.id_producto=p.id_producto where p.precio > 50;
/**
+------------+
| nombre     |
+------------+
| Cliente 5  |
| Cliente 6  |
| Cliente 7  |
| Cliente 8  |
| Cliente 9  |
| Cliente 10 |
| Cliente 11 |
| Cliente 12 |
| Cliente 13 |
| Cliente 14 |
| Cliente 15 |
| Cliente 16 |
| Cliente 17 |
| Cliente 18 |
| Cliente 19 |
| Cliente 20 |
+------------+
**/

-- 4. Obtener el nombre de los productos que no se han ordenado aún
select p.nombre from productos as p left join ordenes as o on o.id_producto=p.id_producto where o.id_producto is null;
/** Empty set **/

-- 5. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes
select c.nombre, p.nombre, o.cantidad from clientes as c join ordenes as o on c.id_cliente=o.id_cliente join productos as p on o.id_producto=p.id_producto;
/**
+------------+-------------+----------+
| nombre     | nombre      | cantidad |
+------------+-------------+----------+
| Cliente 1  | Producto 1  |        2 |
| Cliente 2  | Producto 2  |        1 |
| Cliente 3  | Producto 3  |        3 |
| Cliente 4  | Producto 4  |        2 |
| Cliente 5  | Producto 5  |        1 |
| Cliente 6  | Producto 6  |        2 |
| Cliente 7  | Producto 7  |        3 |
| Cliente 8  | Producto 8  |        2 |
| Cliente 9  | Producto 9  |        1 |
| Cliente 10 | Producto 10 |        2 |
| Cliente 11 | Producto 11 |        3 |
| Cliente 12 | Producto 12 |        2 |
| Cliente 13 | Producto 13 |        1 |
| Cliente 14 | Producto 14 |        2 |
| Cliente 15 | Producto 15 |        3 |
| Cliente 16 | Producto 16 |        2 |
| Cliente 17 | Producto 17 |        1 |
| Cliente 18 | Producto 18 |        2 |
| Cliente 19 | Producto 19 |        3 |
| Cliente 20 | Producto 20 |        2 |
+------------+-------------+----------+
**/

-- 6. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos
select c.nombre, p.nombre from clientes as c join ordenes as o on c.id_cliente=o.id_cliente join productos as p on o.id_producto=p.id_producto;
/**
+------------+-------------+
| nombre     | nombre      |
+------------+-------------+
| Cliente 1  | Producto 1  |
| Cliente 2  | Producto 2  |
| Cliente 3  | Producto 3  |
| Cliente 4  | Producto 4  |
| Cliente 5  | Producto 5  |
| Cliente 6  | Producto 6  |
| Cliente 7  | Producto 7  |
| Cliente 8  | Producto 8  |
| Cliente 9  | Producto 9  |
| Cliente 10 | Producto 10 |
| Cliente 11 | Producto 11 |
| Cliente 12 | Producto 12 |
| Cliente 13 | Producto 13 |
| Cliente 14 | Producto 14 |
| Cliente 15 | Producto 15 |
| Cliente 16 | Producto 16 |
| Cliente 17 | Producto 17 |
| Cliente 18 | Producto 18 |
| Cliente 19 | Producto 19 |
| Cliente 20 | Producto 20 |
+------------+-------------+
**/

-- 7. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes
select o.*, c.nombre, p.nombre from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente join productos as p on o.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
**/

-- 8. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado
select c.nombre, count(id_orden) from clientes as c join ordenes as o on c.id_cliente=o.id_cliente group by c.id_cliente;
/**
+------------+-----------------+
| nombre     | count(id_orden) |
+------------+-----------------+
| Cliente 1  |               1 |
| Cliente 2  |               1 |
| Cliente 3  |               1 |
| Cliente 4  |               1 |
| Cliente 5  |               1 |
| Cliente 6  |               1 |
| Cliente 7  |               1 |
| Cliente 8  |               1 |
| Cliente 9  |               1 |
| Cliente 10 |               1 |
| Cliente 11 |               1 |
| Cliente 12 |               1 |
| Cliente 13 |               1 |
| Cliente 14 |               1 |
| Cliente 15 |               1 |
| Cliente 16 |               1 |
| Cliente 17 |               1 |
| Cliente 18 |               1 |
| Cliente 19 |               1 |
| Cliente 20 |               1 |
+------------+-----------------+
**/

-- 9. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto
select o.id_orden, c.nombre, p.nombre from clientes as c inner join ordenes as o on c.id_cliente=o.id_cliente inner join productos as p on o.id_producto=p.id_producto order by o.id_orden;
/**
+----------+------------+-------------+
| id_orden | nombre     | nombre      |
+----------+------------+-------------+
|        1 | Cliente 1  | Producto 1  |
|        2 | Cliente 2  | Producto 2  |
|        3 | Cliente 3  | Producto 3  |
|        4 | Cliente 4  | Producto 4  |
|        5 | Cliente 5  | Producto 5  |
|        6 | Cliente 6  | Producto 6  |
|        7 | Cliente 7  | Producto 7  |
|        8 | Cliente 8  | Producto 8  |
|        9 | Cliente 9  | Producto 9  |
|       10 | Cliente 10 | Producto 10 |
|       11 | Cliente 11 | Producto 11 |
|       12 | Cliente 12 | Producto 12 |
|       13 | Cliente 13 | Producto 13 |
|       14 | Cliente 14 | Producto 14 |
|       15 | Cliente 15 | Producto 15 |
|       16 | Cliente 16 | Producto 16 |
|       17 | Cliente 17 | Producto 17 |
|       18 | Cliente 18 | Producto 18 |
|       19 | Cliente 19 | Producto 19 |
|       20 | Cliente 20 | Producto 20 |
+----------+------------+-------------+
**/

-- 10. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
select o.*, c.nombre, p.nombre from clientes as c right join ordenes as o on c.id_cliente=o.id_cliente join productos as p on o.id_producto=p.id_producto order by o.id_orden, p.nombre; 
/**
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
**/

-- 11. Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados
select o.*, c.nombre, p.nombre from ordenes as o left join productos as p on o.id_producto=p.id_producto join clientes as c on c.id_cliente=o.id_cliente;
/**
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
**/

-- 12. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos
select o.*, c.nombre, p.nombre from clientes as c right join ordenes as o on c.id_cliente=o.id_cliente join productos as p on o.id_producto=p.id_producto order by o.id_orden;
/**
+----------+------------+-------------+----------+------------+-------------+
| id_orden | id_cliente | id_producto | cantidad | nombre     | nombre      |
+----------+------------+-------------+----------+------------+-------------+
|        1 |          1 |           1 |        2 | Cliente 1  | Producto 1  |
|        2 |          2 |           2 |        1 | Cliente 2  | Producto 2  |
|        3 |          3 |           3 |        3 | Cliente 3  | Producto 3  |
|        4 |          4 |           4 |        2 | Cliente 4  | Producto 4  |
|        5 |          5 |           5 |        1 | Cliente 5  | Producto 5  |
|        6 |          6 |           6 |        2 | Cliente 6  | Producto 6  |
|        7 |          7 |           7 |        3 | Cliente 7  | Producto 7  |
|        8 |          8 |           8 |        2 | Cliente 8  | Producto 8  |
|        9 |          9 |           9 |        1 | Cliente 9  | Producto 9  |
|       10 |         10 |          10 |        2 | Cliente 10 | Producto 10 |
|       11 |         11 |          11 |        3 | Cliente 11 | Producto 11 |
|       12 |         12 |          12 |        2 | Cliente 12 | Producto 12 |
|       13 |         13 |          13 |        1 | Cliente 13 | Producto 13 |
|       14 |         14 |          14 |        2 | Cliente 14 | Producto 14 |
|       15 |         15 |          15 |        3 | Cliente 15 | Producto 15 |
|       16 |         16 |          16 |        2 | Cliente 16 | Producto 16 |
|       17 |         17 |          17 |        1 | Cliente 17 | Producto 17 |
|       18 |         18 |          18 |        2 | Cliente 18 | Producto 18 |
|       19 |         19 |          19 |        3 | Cliente 19 | Producto 19 |
|       20 |         20 |          20 |        2 | Cliente 20 | Producto 20 |
+----------+------------+-------------+----------+------------+-------------+
**/

-- 13. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
select c.nombre, count(o.id_cliente) from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente group by c.id_cliente;
/**
+------------+---------------------+
| nombre     | count(o.id_cliente) |
+------------+---------------------+
| Cliente 1  |                   1 |
| Cliente 2  |                   1 |
| Cliente 3  |                   1 |
| Cliente 4  |                   1 |
| Cliente 5  |                   1 |
| Cliente 6  |                   1 |
| Cliente 7  |                   1 |
| Cliente 8  |                   1 |
| Cliente 9  |                   1 |
| Cliente 10 |                   1 |
| Cliente 11 |                   1 |
| Cliente 12 |                   1 |
| Cliente 13 |                   1 |
| Cliente 14 |                   1 |
| Cliente 15 |                   1 |
| Cliente 16 |                   1 |
| Cliente 17 |                   1 |
| Cliente 18 |                   1 |
| Cliente 19 |                   1 |
| Cliente 20 |                   1 |
+------------+---------------------+
**/

-- 14. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
select o.*, c.*, p.* from ordenes as o left join productos as p on p.id_producto=o.id_producto left join clientes as c on c.id_cliente=o.id_cliente;
/**
+----------+------------+-------------+----------+------------+------------+---------------+-------------+-------------+--------+
| id_orden | id_cliente | id_producto | cantidad | id_cliente | nombre     | direccion     | id_producto | nombre      | precio |
+----------+------------+-------------+----------+------------+------------+---------------+-------------+-------------+--------+
|        1 |          1 |           1 |        2 |          1 | Cliente 1  | Dirección 1   |           1 | Producto 1  |  10.99 |
|        2 |          2 |           2 |        1 |          2 | Cliente 2  | Dirección 2   |           2 | Producto 2  |   20.5 |
|        3 |          3 |           3 |        3 |          3 | Cliente 3  | Dirección 3   |           3 | Producto 3  |  30.99 |
|        4 |          4 |           4 |        2 |          4 | Cliente 4  | Dirección 4   |           4 | Producto 4  |   40.5 |
|        5 |          5 |           5 |        1 |          5 | Cliente 5  | Dirección 5   |           5 | Producto 5  |  50.99 |
|        6 |          6 |           6 |        2 |          6 | Cliente 6  | Dirección 6   |           6 | Producto 6  |   60.5 |
|        7 |          7 |           7 |        3 |          7 | Cliente 7  | Dirección 7   |           7 | Producto 7  |  70.99 |
|        8 |          8 |           8 |        2 |          8 | Cliente 8  | Dirección 8   |           8 | Producto 8  |   80.5 |
|        9 |          9 |           9 |        1 |          9 | Cliente 9  | Dirección 9   |           9 | Producto 9  |  90.99 |
|       10 |         10 |          10 |        2 |         10 | Cliente 10 | Dirección 10  |          10 | Producto 10 |  100.5 |
|       11 |         11 |          11 |        3 |         11 | Cliente 11 | Dirección 11  |          11 | Producto 11 | 110.99 |
|       12 |         12 |          12 |        2 |         12 | Cliente 12 | Dirección 12  |          12 | Producto 12 |  120.5 |
|       13 |         13 |          13 |        1 |         13 | Cliente 13 | Dirección 13  |          13 | Producto 13 | 130.99 |
|       14 |         14 |          14 |        2 |         14 | Cliente 14 | Dirección 14  |          14 | Producto 14 |  140.5 |
|       15 |         15 |          15 |        3 |         15 | Cliente 15 | Dirección 15  |          15 | Producto 15 | 150.99 |
|       16 |         16 |          16 |        2 |         16 | Cliente 16 | Dirección 16  |          16 | Producto 16 |  160.5 |
|       17 |         17 |          17 |        1 |         17 | Cliente 17 | Dirección 17  |          17 | Producto 17 | 170.99 |
|       18 |         18 |          18 |        2 |         18 | Cliente 18 | Dirección 18  |          18 | Producto 18 |  180.5 |
|       19 |         19 |          19 |        3 |         19 | Cliente 19 | Dirección 19  |          19 | Producto 19 | 190.99 |
|       20 |         20 |          20 |        2 |         20 | Cliente 20 | Dirección 20  |          20 | Producto 20 |  200.5 |
+----------+------------+-------------+----------+------------+------------+---------------+-------------+-------------+--------+
**/