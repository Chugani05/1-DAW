# Tarea 8
## Trabajo con la BBDD Alumnos

### Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:
- Tabla alumnos:
  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - nota (número real)

```sql
-- Creamos la base de datos:
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

-- Accedemos a la base de datos:
USE test;

-- Creamos la tabla alumnos:
DROP TABLE IF EXISTS alumno;
CREATE TABLE alumno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    nota FLOAT
);
```
  
### Crea los siguientes __triggers__:
- __Trigger1__ : _trigger_check_nota_before_insert_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de inserción.
  - Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.

```sql
DROP TRIGGER IF EXISTS check_nota_before_insert;
DELIMITER $$
CREATE TRIGGER check_nota_before_insert
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END; $$
DELIMITER ;
```

```sql
-- Añadimos algunos inserts:
INSERT INTO alumno (nombre, apellido1, apellido2, nota) 
VALUES ('Ana', 'Perez', 'Gonzalez', -8),
('Tim', 'Lopez', 'Rodriguez', 25),
('Alonso', 'Gonzalez', 'Martinez', 11),
('Esther', 'Hernandez', 'Lopez', -15);

-- Salida:
select * from alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | Ana    | Perez     | Gonzalez  |    0 |
|  2 | Tim    | Lopez     | Rodriguez |   10 |
|  3 | Alonso | Gonzalez  | Martinez  |   10 |
|  4 | Esther | Hernandez | Lopez     |    0 |
+----+--------+-----------+-----------+------+
```

- __Trigger2__ : _trigger_check_nota_before_update_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de actualización.
  - Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

```sql
DROP TRIGGER IF EXISTS check_nota_before_update;
DELIMITER $$
CREATE TRIGGER check_nota_before_update
BEFORE UPDATE ON alumno
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END;$$
DELIMITER ;
```

```sql
-- Actualizamos algunos inserciones:
UPDATE alumno SET nota = -11 WHERE id = 3;
UPDATE alumno SET nota = 15 WHERE id = 4;

-- Salida:
select * from alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | Ana    | Perez     | Gonzalez  |    0 |
|  2 | Tim    | Lopez     | Rodriguez |   10 |
|  3 | Alonso | Gonzalez  | Martinez  |    0 |
|  4 | Esther | Hernandez | Lopez     |   10 |
+----+--------+-----------+-----------+------+
```

Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

### Crea el siguiente procedimiento:
- __Procedimiento1__:
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

```sql
DROP PROCEDURE IF EXISTS crear_alumnos;
DELIMITER //
CREATE PROCEDURE crear_alumnos(IN cantidad INT, nombre VARCHAR(50), nota_minima INT, nota_maxima INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE anombre VARCHAR(50);
    DECLARE anota FLOAT;

    WHILE counter < cantidad DO
        SET anombre = CONCAT(nombre, FLOOR(RAND() * (100 - 1 + 1)));
        SET anota = ROUND(RAND() * (nota_maxima - nota_minima + 1) + nota_minima);
        INSERT INTO alumno (nombre, apellido1, apellido2, nota) 
        VALUES (anombre, anombre, anombre, anota);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

```sql
-- Llamada de la primera parte del procedimiento:
CALL crear_alumnos(5, "alumno", 3, 10);

-- Salida:
+----+----------+-----------+-----------+------+
| id | nombre   | apellido1 | apellido2 | nota |
+----+----------+-----------+-----------+------+
|  1 | Ana      | Perez     | Gonzalez  |    0 |
|  2 | Tim      | Lopez     | Rodriguez |   10 |
|  3 | Alonso   | Gonzalez  | Martinez  |    0 |
|  4 | Esther   | Hernandez | Lopez     |   10 |
|  5 | alumno0  | alumno0   | alumno0   |    4 |
|  6 | alumno92 | alumno92  | alumno92  |    6 |
|  7 | alumno58 | alumno58  | alumno58  |    8 |
|  8 | alumno18 | alumno18  | alumno18  |   10 |
|  9 | alumno14 | alumno14  | alumno14  |    4 |
+----+----------+-----------+-----------+------+


-- Llamada de la segunda parte del procedimiento:
CALL crear_alumnos(5, "alumno", -10, 12);

-- Salida:
+----+----------+-----------+-----------+------+
| id | nombre   | apellido1 | apellido2 | nota |
+----+----------+-----------+-----------+------+
|  1 | Ana      | Perez     | Gonzalez  |    0 |
|  2 | Tim      | Lopez     | Rodriguez |   10 |
|  3 | Alonso   | Gonzalez  | Martinez  |    0 |
|  4 | Esther   | Hernandez | Lopez     |   10 |
|  5 | alumno0  | alumno0   | alumno0   |    4 |
|  6 | alumno92 | alumno92  | alumno92  |    6 |
|  7 | alumno58 | alumno58  | alumno58  |    8 |
|  8 | alumno18 | alumno18  | alumno18  |   10 |
|  9 | alumno14 | alumno14  | alumno14  |    4 |
| 10 | alumno38 | alumno38  | alumno38  |   10 |
| 11 | alumno73 | alumno73  | alumno73  |    7 |
| 12 | alumno56 | alumno56  | alumno56  |    3 |
| 13 | alumno8  | alumno8   | alumno8   |    7 |
| 14 | alumno46 | alumno46  | alumno46  |    0 |
+----+----------+-----------+-----------+------+
```

Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.
