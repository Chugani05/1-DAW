-- TAREA 3
-- TRABAJANDO CON JOIN'S
-- Dada la siguiente BBDD:
-- Completa aquello que falte
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100)
);

CREATE TABLE ordenes (
    id_orden INT PRIMARY KEY,
    id_cliente INT,
    fecha_orden DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

CREATE TABLE detalles_ordenes (
    id_detalle INT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre_cliente, ciudad_cliente) VALUES
(1, 'Juan', 'Ciudad A'),
(2, 'María', 'Ciudad B'),
(3, 'Pedro', 'Ciudad C');

INSERT INTO ordenes (id_orden, id_cliente, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03');

INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Producto A', 50.00),
(2, 'Producto B', 75.00),
(3, 'Producto C', 100.00);

INSERT INTO detalles_ordenes (id_detalle, id_orden, id_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3);

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea3

-- Accedemos a la base de datos con el coamndo:
USE tarea3


-- Realiza las siguientes consultas:
-- 1. Mostrar todos los clientes.
select * from clientes;
/**
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
**/

-- 2. Mostrar todas las órdenes.
select * from ordenes;
/**
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
**/

-- 3. Mostrar todos los productos.
select * from productos;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
**/

-- 4. Mostrar todos los detalles de las órdenes.
select * from detalles_ordenes;
/**
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
**/

-- 5. Mostrar los primeros 5 clientes ordenados por nombre.
select * from clientes order by nombre_cliente limit 5;
/**
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
**/

-- 6. Mostrar los productos con un precio mayor a 50.
select * from productos where precio_producto > 50;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
**/

-- 7. Mostrar todas las órdenes realizadas por el cliente con ID 1.
select * from ordenes where id_cliente = 1;
/**
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+
**/

-- 8. Mostrar los clientes cuyos nombres comienzan con la letra "A".
select * from clientes where nombre_cliente regexp '^A';
/** Empty set **/

-- 9. Mostrar las órdenes que contienen más de 2 productos.
select * from detalles_ordenes where cantidad > 2;
/**
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
**/

-- 10. Mostrar los productos ordenados por precio de forma descendente.
select * from productos order by precio_producto desc;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+
**/

-- 11. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
select * from cliente as c left join ordenes as o on c.id_cliente=o.id_cliente;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
**/

-- 12. Seleccionar todas las órdenes junto con los productos correspondientes.
select o.*, p.* from ordenes as o join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on d.id_producto=p.id_producto;
/**
+----------+------------+-------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |
+----------+------------+-------------+-------------+-----------------+-----------------+
**/

-- 13. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
select c.nombre_cliente, p.precio_producto from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on d.id_producto=p.id_producto where p.precio_producto > 50;
/**
+----------------+-----------------+
| nombre_cliente | precio_producto |
+----------------+-----------------+
| María          |           75.00 |
| Pedro          |          100.00 |
+----------------+-----------------+
**/

-- 14. Obtener el nombre de los productos que no se han ordenado aún.
select p.* from productos as p join detalles_ordenes as d on p.id_producto=d.id_producto where d.id_producto is null;
/** Empty set **/

-- 15. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.
select c.nombre_cliente, p.nombre_producto, o.* from ordenes as o join clientes as c on c.id_cliente=o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
/**
+----------------+-----------------+----------+------------+-------------+
| nombre_cliente | nombre_producto | id_orden | id_cliente | fecha_orden |
+----------------+-----------------+----------+------------+-------------+
| Juan           | Producto A      |        1 |          1 | 2024-03-01  |
| María          | Producto B      |        2 |          2 | 2024-03-02  |
| Pedro          | Producto C      |        3 |          3 | 2024-03-03  |
+----------------+-----------------+----------+------------+-------------+
**/

-- 16. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
select c.nombre_cliente, p.nombre_producto from ordenes as o join clientes as c on c.id_cliente=o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
/**
+----------------+-----------------+
| nombre_cliente | nombre_producto |
+----------------+-----------------+
| Juan           | Producto A      |
| María          | Producto B      |
| Pedro          | Producto C      |
+----------------+-----------------+
**/

-- 17. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
select c.*, o.*, p.* from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
/**
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
**/

-- 18. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.
select c.nombre_cliente, count(o.id_orden) from clientes as c join ordenes as o on c.id_cliente=o.id_cliente group by c.nombre_cliente;
/**
+----------------+-------------------+
| nombre_cliente | count(o.id_orden) |
+----------------+-------------------+
| Juan           |                 1 |
| María          |                 1 |
| Pedro          |                 1 |
+----------------+-------------------+
**/

-- 19. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
select o.*, c.nombre_cliente, p.nombre_producto from clientes as c join ordenes as o on c.id_cliente = o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on d.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
**/

-- 20. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
select o.*, p.*, c.* from ordenes as o left join clientes as c on c.id_cliente=o.id_cliente join detalles_ordenes as d on d.id_orden=o.id_orden join productos as p on p.id_producto=d.id_producto;
/**
+----------+------------+-------------+-------------+-----------------+-----------------+------------+----------------+----------------+
| id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto | id_cliente | nombre_cliente | ciudad_cliente |
+----------+------------+-------------+-------------+-----------------+-----------------+------------+----------------+----------------+
|        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |          1 | Juan           | Ciudad A       |
|        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |          2 | María          | Ciudad B       |
|        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |          3 | Pedro          | Ciudad C       |
+----------+------------+-------------+-------------+-----------------+-----------------+------------+----------------+----------------+
**/

-- 21. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.
select p.*, c.*, o.* from productos as p left join detalles_ordenes as d on p.id_producto=d.id_producto join ordenes as o on d.id_orden=o.id_orden join clientes as c on c.id_cliente=o.id_cliente;
/**
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
| id_producto | nombre_producto | precio_producto | id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
|           1 | Producto A      |           50.00 |          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|           2 | Producto B      |           75.00 |          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|           3 | Producto C      |          100.00 |          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
**/

-- 22. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.
select p.*, c.*, o.* from ordenes as o left join detalles_ordenes as d on d.id_orden=o.id_orden left join productos as p on p.id_producto=d.id_producto join clientes as c on c.id_cliente=o.id_cliente;
/**
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
| id_producto | nombre_producto | precio_producto | id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
|           1 | Producto A      |           50.00 |          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|           2 | Producto B      |           75.00 |          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|           3 | Producto C      |          100.00 |          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+-------------+-----------------+-----------------+------------+----------------+----------------+----------+------------+-------------+
**/

-- 23. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
select c.nombre_cliente, count(o.id_orden) from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente group by c.nombre_cliente;
/**
+----------------+-------------------+
| nombre_cliente | count(o.id_orden) |
+----------------+-------------------+
| Juan           |                 1 |
| María          |                 1 |
| Pedro          |                 1 |
+----------------+-------------------+
**/

-- 24. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
select c.nombre_cliente, p.nombre_producto from ordenes o left join clientes c on o.id_cliente=c.id_cliente left join detalles_ordenes do on o.id_orden=do.id_orden left join productos p on do.id_producto=p.id_producto;
/**
+----------------+-----------------+
| nombre_cliente | nombre_producto |
+----------------+-----------------+
| Juan           | Producto A      |
| María          | Producto B      |
| Pedro          | Producto C      |
+----------------+-----------------+
**/

-- 25. Realizar un inner join entre clientes y órdenes.
select * from clientes as c inner join ordenes as o on c.id_cliente=o.id_cliente;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
**/

-- 26. Realizar un left join entre órdenes y detalles de órdenes.
select * from ordenes as o left join detalles_ordenes as d on o.id_orden=d.id_orden;
/**
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
**/

-- 27. Realizar un right join entre productos y detalles de órdenes.
select * from productos as p right join detalles_ordenes as d on p.id_producto=d.id_producto;
/**
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
**/

-- 28. Realizar un full join entre clientes y órdenes.
select * from clientes as c right join ordenes as o on c.id_cliente=o.id_cliente union all select * from clientes as c left join ordenes as o on c.id_cliente=o.id_cliente where c.id_cliente is null;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
**/

-- 29. Realizar un full join entre órdenes y detalles de órdenes.
select * from ordenes as o left join detalles_ordenes as d on o.id_orden=d.id_orden union all select * from ordenes as o right join detalles_ordenes as d on o.id_orden=d.id_orden where o.id_orden is null;
/**
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
**/

-- 30. Realizar un full join entre productos y detalles de órdenes.
select * from productos as p left join detalles_ordenes as d on p.id_producto=d.id_producto union all select * from productos as p right join detalles_ordenes as d on p.id_producto=d.id_producto where p.id_producto is null;
/**
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
**/
