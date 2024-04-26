-- Creación de tabla
create table cliente (
id integer primary key autoincrement,
nombre text,
apellido1 text,
apellido2 text,
ciudad text,
categoria integer );

create table comercial (
id integer primary key autoincrement,
nombre text,
apellido1 text,
apellido2 text,
categoria real );

create table pedido (
id integer primary key autoincrement,
total real,
fecha text,
id_cliente integer,
id_comercial integer );


-- Inserción de valores
INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);


-- Consultas sobre una tabla
-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
-- Consulta:
select * from pedido order by fecha desc;
/**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘
**/

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
-- Consulta:
select * from pedido order by total desc limit 2;
/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
-- Consulta:
select distinct id_cliente from pedido;
/**
┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘
**/

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
-- Consulta:
select * from pedido where substr(fecha, 1, 4)='2017' and total>'500';
/**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
**/

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
-- Consulta:
select nombre, apellido1 ||' '|| apellido2 as apellidos from comercial where categoria between 0.05 and 0.11;
/**
┌─────────┬────────────────┐
│ nombre  │   apellidos    │
├─────────┼────────────────┤
│ Diego   │ Flores Salas   │
│ Antonio │ Vega Hernández │
│ Alfredo │ Ruiz Flores    │
└─────────┴────────────────┘
**/

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
-- Consulta:
select max(categoria) as max_comision from comercial;
/**
┌──────────────┐
│ max_comision │
├──────────────┤
│ 0.15         │
└──────────────┘
**/

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
-- Consulta:
select id, nombre, apellido1 from cliente where apellido2 not null order by apellido1, nombre;
/**
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 10 │ Daniel    │ Santana   │
│ 6  │ María     │ Santana   │
└────┴───────────┴───────────┘
**/

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
-- Consulta:
select nombre from cliente where nombre regexp '^A.*n$' or nombre regexp '^P' order by nombre;
/**
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘
**/
-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
-- Consulta:
select nombre from cliente where nombre not regexp '^A'order by nombre;
/**
┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
**/

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por la o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
-- Consulta:
select distinct nombre from comercial where nombre regexp 'o$';
/**
┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘
**/


-- Consultas multitabla
-- Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.
-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
-- Consulta:
select distinct c.id, c.nombre, c.apellido1 ||' '|| c.apellido2 as apellidos from cliente as c inner join pedido as p on c.id=p.id_cliente order by c.nombre, apellidos;
/**
┌────┬────────┬────────────────┐
│ id │ nombre │   apellidos    │
├────┼────────┼────────────────┤
│ 1  │ Aarón  │ Rivero Gómez   │
│ 2  │ Adela  │ Salas Díaz     │
│ 3  │ Adolfo │ Rubio Flores   │
│ 4  │ Adrián │                │
│ 5  │ Marcos │ Loyola Méndez  │
│ 6  │ María  │ Santana Moreno │
│ 8  │ Pepe   │ Ruiz Santana   │
│ 7  │ Pilar  │                │
└────┴────────┴────────────────┘
**/

-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
-- Consulta:
select * from cliente as c inner join pedido as p on c.id=p.id_cliente order by c.nombre, c.apellido1;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
-- Consulta:
select * from comercial as c inner join pedido as p on c.id=p.id_comercial order by c.nombre, c.apellido1;
/**
┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/

-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
-- Consulta:
select * from cliente as cl inner join pedido as p on cl.id=p.id_cliente join comercial as co on co.id=p.id_comercial;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘
**/

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
-- Consulta:
select distinct * from cliente as c inner join pedido as p on c.id=p.id_cliente where substr(fecha, 1, 4)='2017' and p.total between 300 and 1000;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬───────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ total │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼───────┼────────────┼────────────┼──────────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5 │ 2017-09-10 │ 5          │ 2            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴───────┴────────────┴────────────┴──────────────┘
**/

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
-- Consulta:
select distinct co.nombre, co.apellido1 ||' '|| co.apellido2 as apellidos from comercial as co inner join pedido as p on co.id=p.id_comercial join cliente as cl on cl.id=p.id_cliente where cl.nombre='María' and cl.apellido1='Santana' and cl.apellido2='Moreno';
/**
┌────────┬───────────┐
│ nombre │ apellidos │
├────────┼───────────┤
│ Daniel │ Sáez Vega │
└────────┴───────────┘
**/

-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
-- Consulta:
select distinct cl.nombre from cliente as cl inner join pedido as p on cl.id=p.id_cliente join comercial as co on co.id=p.id_comercial where co.nombre='Daniel' and co.apellido1='Sáez' and co.apellido2='Vega';
/**
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘
**/


-- Consultas resumen (Funciones)
-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
-- Consulta:
select sum(total) as cantidad_total from pedido;
/**
┌────────────────┐
│ cantidad_total │
├────────────────┤
│ 20992.83       │
└────────────────┘
**/

-- 2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
-- Consulta:
select avg(total) as cantidad_media from pedido;
/**
┌────────────────┐
│ cantidad_media │
├────────────────┤
│ 1312.051875    │
└────────────────┘
**/

-- 3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
-- Consulta:
select distinct count(id_comercial) as total_comerciales from pedido;
/**
┌───────────────────┐
│ total_comerciales │
├───────────────────┤
│ 16                │
└───────────────────┘
**/

-- 4. Calcula el número total de clientes que aparecen en la tabla cliente.
-- Consulta:
select count(*) as total_clientes from cliente;
/**
┌────────────────┐
│ total_clientes │
├────────────────┤
│ 10             │
└────────────────┘
**/

-- 5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
-- Consulta:
select max(total) as mayor_cantidad from pedido;
/**
┌────────────────┐
│ mayor_cantidad │
├────────────────┤
│ 5760.0         │
└────────────────┘
**/

-- 6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
-- Consulta:
select min(total) as menor_cantidad from pedido;
/**
┌────────────────┐
│ menor_cantidad │
├────────────────┤
│ 65.26          │
└────────────────┘
**/

-- 7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
-- Consulta:
select ciudad, max(categoria) as max_categoria from cliente group by ciudad;
/**
┌─────────┬───────────────┐
│ ciudad  │ max_categoria │
├─────────┼───────────────┤
│ Almería │ 200           │
│ Cádiz   │ 100           │
│ Granada │ 225           │
│ Huelva  │ 200           │
│ Jaén    │ 300           │
│ Sevilla │ 300           │
└─────────┴───────────────┘
**/

-- 8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
-- Consulta:
select c.id, c.nombre, c.apellido1 ||' '|| c.apellido2 as apellidos, p.fecha, p.total from cliente as c inner join pedido as p ON c.id=p.id_cliente where (p.id_cliente, p.fecha, p.total) in (select id_cliente, fecha, max(total) from pedido group by id_cliente, fecha);
/**
┌────┬────────┬────────────────┬────────────┬─────────┐
│ id │ nombre │   apellidos    │   fecha    │  total  │
├────┼────────┼────────────────┼────────────┼─────────┤
│ 5  │ Marcos │ Loyola Méndez  │ 2017-10-05 │ 150.5   │
│ 1  │ Aarón  │ Rivero Gómez   │ 2016-09-10 │ 270.65  │
│ 2  │ Adela  │ Salas Díaz     │ 2017-10-05 │ 65.26   │
│ 8  │ Pepe   │ Ruiz Santana   │ 2016-08-17 │ 110.5   │
│ 5  │ Marcos │ Loyola Méndez  │ 2017-09-10 │ 948.5   │
│ 7  │ Pilar  │                │ 2016-07-27 │ 2400.6  │
│ 2  │ Adela  │ Salas Díaz     │ 2015-09-10 │ 5760.0  │
│ 4  │ Adrián │                │ 2017-10-10 │ 1983.43 │
│ 8  │ Pepe   │ Ruiz Santana   │ 2016-10-10 │ 2480.4  │
│ 8  │ Pepe   │ Ruiz Santana   │ 2015-06-27 │ 250.45  │
│ 3  │ Adolfo │ Rubio Flores   │ 2016-08-17 │ 75.29   │
│ 2  │ Adela  │ Salas Díaz     │ 2017-04-25 │ 3045.6  │
│ 6  │ María  │ Santana Moreno │ 2019-01-25 │ 545.75  │
│ 6  │ María  │ Santana Moreno │ 2017-02-02 │ 145.82  │
│ 1  │ Aarón  │ Rivero Gómez   │ 2019-03-11 │ 2389.23 │
└────┴────────┴────────────────┴────────────┴─────────┘
**/

-- 9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
-- Consulta:
select p.id_cliente, c.nombre, c.apellido1 ||' '|| c.apellido2 as apellidos, p.fecha, max(p.total) as maxima_cantidad from pedido as p, cliente as c where p.id_cliente=c.id group by fecha having max(p.total)>2000;
/**
┌────────────┬────────┬──────────────┬────────────┬─────────────────┐
│ id_cliente │ nombre │  apellidos   │   fecha    │ maxima_cantidad │
├────────────┼────────┼──────────────┼────────────┼─────────────────┤
│ 2          │ Adela  │ Salas Díaz   │ 2015-09-10 │ 5760.0          │
│ 7          │ Pilar  │              │ 2016-07-27 │ 2400.6          │
│ 8          │ Pepe   │ Ruiz Santana │ 2016-10-10 │ 2480.4          │
│ 2          │ Adela  │ Salas Díaz   │ 2017-04-25 │ 3045.6          │
│ 1          │ Aarón  │ Rivero Gómez │ 2019-03-11 │ 2389.23         │
└────────────┴────────┴──────────────┴────────────┴─────────────────┘
**/

-- 10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
-- Consulta:
select c.id, c.nombre, c.apellido1 ||' '|| c.apellido2 as apellidos, max(p.total) as maxima_cantidad from comercial as c, pedido as p where c.id= p.id_comercial and p.fecha regexp '2016-08-17' group by c.id;
/**
┌────┬─────────┬────────────────┬─────────────────┐
│ id │ nombre  │   apellidos    │ maxima_cantidad │
├────┼─────────┼────────────────┼─────────────────┤
│ 3  │ Diego   │ Flores Salas   │ 110.5           │
│ 7  │ Antonio │ Vega Hernández │ 75.29           │
└────┴─────────┴────────────────┴─────────────────┘
**/

-- 11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
-- Consulta:
select c.id, c.nombre, c.apellido1 ||' '|| c.apellido2 as apellidos, count(p.id) as total_pedidos from cliente as c, pedido as p where c.id=p.id_cliente group by c.id having count(p.id)=0;
/** Devuelve una consulta vacía **/

-- 12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
-- Consulta:
select c.id, c.nombre, c.apellido1 ||' '|| c.apellido2 as apellidos, count(p.id) as total_pedidos from cliente as c, pedido as p where c.id=p.id_cliente and substr(fecha, 1, 4)='2017' or fecha is null group by c.id having count(p.id)=0;
/** Devuelve una consulta vacía **/

-- 13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
-- Consulta:
select c.id, c.nombre, c.apellido1, max(p.total) as max_cantidad from cliente as c, pedido as p where c.id=p.id_cliente group by c.id having max(p.total)=0;
/** Devuelve una consulta vacía **/

-- 14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
-- Consulta:
select substr(fecha, 1, 4) as año, max(total) as max_cantidad from pedido group by año;
/**
┌──────┬──────────────┐
│ año  │ max_cantidad │
├──────┼──────────────┤
│ 2015 │ 5760.0       │
│ 2016 │ 2480.4       │
│ 2017 │ 3045.6       │
│ 2019 │ 2389.23      │
└──────┴──────────────┘
**/

-- 15. Devuelve el número total de pedidos que se han realizado cada año.
-- Consulta:
select substr(fecha, 1, 4) as año, count(*) as total_pedidos from pedido group by año;
/**
┌──────┬───────────────┐
│ año  │ total_pedidos │
├──────┼───────────────┤
│ 2015 │ 2             │
│ 2016 │ 5             │
│ 2017 │ 6             │
│ 2019 │ 3             │
└──────┴───────────────┘
**/


-- Subconsultas
-- Con operadores básicos de comparación
-- 1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
-- Consulta:
select p.* from cliente as c, pedido as p where c.id=p.id_cliente and c.nombre='Adela' and apellido1='Salas' and apellido2='Díaz';
/**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
**/

-- 2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
-- Consulta:
select count(p.id) as pedidos_participados from comercial as c, pedido as p where c.id=p.id_comercial and c.id='1';
/**
┌──────────────────────┐
│ pedidos_participados │
├──────────────────────┤
│ 6                    │
└──────────────────────┘
**/

-- 3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
-- Consulta:
select * from cliente where id = (select id_cliente from pedido where substr(fecha, 1, 4)='2019' order by total desc limit 1);
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
**/

-- 4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
-- Consulta:
select fecha, min(total) as min_total from pedido as p, cliente as c where id_cliente = (select id from cliente where c.nombre='Pepe' and apellido1='Ruiz' and apellido2='Santana');
/**
┌────────────┬───────────┐
│   fecha    │ min_total │
├────────────┼───────────┤
│ 2016-08-17 │ 110.5     │
└────────────┴───────────┘
**/

-- 5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
-- Consulta:
select * from cliente as c, pedido as p where c.id=p.id_cliente and p.fecha between '2017-01-01' and '2017-12-31' and p.total >= (select avg(total) from pedido where fecha between '2017-01-01' and '2017-12-31');
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
**/


-- Subconsultas con IN y NOT IN
-- 1. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
-- Consulta:
select * from cliente where id not in (select id_cliente from pedido);
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

-- 2. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
-- Consulta:
select * from comercial where id not in (select id_comercial from pedido );
/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/


-- Subconsultas con EXISTS y NOT EXISTS
-- 1. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
-- Consulta:
select * from cliente where not exists (select 1 from pedido where cliente.id=pedido.id_cliente);
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
**/

-- 2. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
-- Consulta:
select * from comercial where not exists (select 1 from pedido where comercial.id=pedido.id_comercial);
/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/
