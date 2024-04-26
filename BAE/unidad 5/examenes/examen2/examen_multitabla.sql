
CREATE TABLE consumidor (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    categoria INTEGER
);
CREATE TABLE suministrador  (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    categoria REAL
);
CREATE TABLE compra (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_consumidor INTEGER,
    id_suministrador INTEGER,
    FOREIGN KEY (id_consumidor) REFERENCES consumidor(id),
    FOREIGN KEY (id_suministrador) REFERENCES suministrador(id)
); 
--Inserts
INSERT INTO consumidor VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO consumidor VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO consumidor VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO consumidor VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO consumidor VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO consumidor VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO consumidor VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO consumidor VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO consumidor VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO consumidor VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
INSERT INTO suministrador  VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO suministrador  VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO suministrador  VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO suministrador  VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO suministrador  VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO suministrador  VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO suministrador  VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO suministrador  VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
INSERT INTO compra VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO compra VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO compra VALUES(3, 65.26, '2020-10-05', 2, 1);
INSERT INTO compra VALUES(4, 110.5, '2019-08-17', 8, 3);
INSERT INTO compra VALUES(5, 948.5, '2020-09-10', 5, 2);
INSERT INTO compra VALUES(6, 2400.6, '2019-07-27', 7, 1);
INSERT INTO compra VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO compra VALUES(8, 1983.43, '2020-10-10', 4, 6);
INSERT INTO compra VALUES(9, 2480.4, '2019-10-10', 8, 3);
INSERT INTO compra VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO compra VALUES(11, 75.29, '2019-08-17', 3, 7);
INSERT INTO compra VALUES(12, 3045.6, '2020-04-25', 2, 1);
INSERT INTO compra VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO compra VALUES(14, 145.82, '2020-02-02', 6, 1);
INSERT INTO compra VALUES(15, 370.85, '2022-03-11', 1, 5);
INSERT INTO compra VALUES(16, 2389.23, '2022-03-11', 1, 5);
