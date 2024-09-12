CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Datos de ejemplo
INSERT INTO productos (nombre, precio, stock) VALUES
('Camiseta', 19.99, 50),
('Pantalón', 29.99, 30),
('Zapatos', 49.99, 20);

INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan@example.com'),
('María Gómez', 'maria@example.com'),
('Carlos López', 'carlos@example.com');

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
(1, 1, 2, '2024-05-01'),
(2, 2, 1, '2024-05-02'),
(3, 3, 1, '2024-05-03');


-- Crea un procedimiento que permita añadir datos aleatorios, en la tabla productos o clientes.
-- Función para crear parte del email
DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(50), dominio VARCHAR(50)) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  RETURN LCASE(CONCAT(nombre, '@', dominio));
END //
DELIMITER ;

-- Trigger para acabar la creación del email
DROP TRIGGER IF EXISTS crear_email_before_insert;
DELIMITER //
CREATE TRIGGER crear_email_before_insert
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
  IF NEW.email IS NULL THEN 
    SET NEW.email = crear_email(NEW.nombre, CONCAT(SUBSTRING_INDEX(UUID(), '-', 1), '.com'));
  END IF;
END;//
DELIMITER ;

-- Procedimiento de inserción de datos
DROP PROCEDURE IF EXISTS insertar_datos;
DELIMITER //
CREATE PROCEDURE insertar_datos(in iterations INT, name VARCHAR(20))
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE c_nombre VARCHAR(30);

    WHILE counter < iterations DO
        SET c_nombre = CONCAT(name, FLOOR(RAND() * (100 - 1 + 1)));

        INSERT INTO clientes(nombre) VALUES (c_nombre);
        SET counter = counter + 1;
    END while;
END //
DELIMITER ;

-- Llamada
call insertar_datos(10, 'lola');

-- Salida
+----------+---------------+---------------------+
| id       | nombre        | email               |
+----------+---------------+---------------------+
|        1 | Juan Pérez    | juan@example.com    |
|        2 | María Gómez   | maria@example.com   |
|        3 | Carlos López  | carlos@example.com  |
| 23022720 | lola21        | lola21@23028f4b.com |
| 23022721 | lola7         | lola7@6fb03b0f.com  |
| 23022722 | lola62        | lola62@6fb24be8.com |
| 23022723 | lola89        | lola89@6fb3b5e8.com |
| 23022724 | lola61        | lola61@6fb4dbf3.com |
| 23022725 | lola38        | lola38@6fb5d42e.com |
| 23022726 | lola5         | lola5@6fb6d226.com  |
| 23022727 | lola14        | lola14@6fb7866a.com |
| 23022728 | lola56        | lola56@6fb8356d.com |
| 23022729 | lola37        | lola37@6fb8ddf4.com |
| 23022730 | lola16        | lola16@6fb98ba5.com |
+----------+---------------+---------------------+


-- Crea un procedimiento que permita actualizar el número de elementos de un producto, teniendo como parámetros de entrada el id del producto,  y la cantidad de elementos a restar del producto.
DROP PROCEDURE IF EXISTS actualizar_elementos;
DELIMITER //
CREATE PROCEDURE actualizar_elementos(IN input_id INT, input_cantidad INT)
BEGIN
    UPDATE ventas SET cantidad = input_cantidad - cantidad WHERE id = input_id;
END //
DELIMITER ;

call actualizar_elementos(2, 1);

select * from productos;
+----+------------+-------------+----------+------------+
| id | cliente_id | producto_id | cantidad | fecha      |
+----+------------+-------------+----------+------------+
|  1 |          1 |           1 |        2 | 2024-05-01 |
|  2 |          2 |           2 |        0 | 2024-05-02 |
|  3 |          3 |           3 |        1 | 2024-05-03 |
+----+------------+-------------+----------+------------+


-- Crea un trigger que actualice la tabla de productos cuando se realice una venta, restando de un producto (id_producto) el número de elementos que se debe de restar (cantidad).
DROP TRIGGER IF EXISTS actualizar_productos;
DELIMITER //
CREATE TRIGGER actualizar_productos
AFTER UPDATE ON ventas
FOR EACH ROW
BEGIN
    UPDATE productos SET stock = NEW.cantidad WHERE id = NEW.id;
END //
DELIMITER ;

select * from productos;

+----+-----------+--------+-------+
| id | nombre    | precio | stock |
+----+-----------+--------+-------+
|  1 | Camiseta  |  19.99 |    50 |
|  2 | Pantalón  |  29.99 |     0 |
|  3 | Zapatos   |  49.99 |    20 |
+----+-----------+--------+-------+


-- Crea una función que calcule el total de las ventas de un cliente.
DROP FUNCTION IF EXISTS calcular_ventas_por_cliente;
DELIMITER //
CREATE FUNCTION calcular_ventas_por_cliente(id int)
RETURNS INT deterministic
BEGIN
    DECLARE suma_total INT;
    SELECT COUNT(cliente_id) FROM ventas As v WHERE v.cliente_id = id INTO suma_total;
    RETURN suma_total;
END//
DELIMITER ;

select calcular_ventas_por_cliente(3);

+--------------------------------+
| calcular_ventas_por_cliente(3) |
+--------------------------------+
|                              1 |
+--------------------------------+


-- Crea una función que calcule la cantidad de productos en stock de un producto (producto_id).

DROP FUNCTION IF EXISTS calcular_total_productos;
DELIMITER //
CREATE FUNCTION calcular_total_productos(id int)
RETURNS INT deterministic
BEGIN
    DECLARE suma_total INT;
    SELECT COUNT(producto_id) FROM ventas AS v WHERE v.producto_id = id INTO suma_total;
    RETURN suma_total;
END//
DELIMITER ;

select calcular_total_productos(1);

+-----------------------------+
| calcular_total_productos(1) |
+-----------------------------+
|                           1 |
+-----------------------------+
