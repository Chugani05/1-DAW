# Tarea 4
## Trabajo con cursores

La base de datos de __"empleados"__ es un sistema diseñado para gestionar información relacionada con los empleados de una empresa. Esta base de datos está estructurada en torno a la entidad principal "empleados", que contiene información detallada sobre cada empleado. La estructura de la base de datos se compone de una única tabla principal llamada "empleados".

La tabla "empleados" está diseñada con las siguientes columnas:

- __id__: Esta columna sirve como identificador único para cada empleado. Es de tipo entero y se genera automáticamente utilizando la propiedad AUTO_INCREMENT.
- __nombre__: Almacena el nombre completo de cada empleado. Es de tipo cadena de caracteres (VARCHAR) con una longitud máxima de 100 caracteres.
- __salario__: Esta columna registra el salario de cada empleado. Se define como un número decimal (DECIMAL) con una precisión de 10 dígitos en total y 2 dígitos después del punto decimal.

```sql
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

Veamos la tabla:
```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3520.00 |
+----+--------+---------+
```

Realiza:

1. Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla __empleados_destino__.
Creamos la tabla `empleados_destino`:
```sql
CREATE TABLE empleados_destino (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empleados_destino (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS empleados_salario_superior_a_3000;
CREATE PROCEDURE empleados_salario_superior_a_3000()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE salario > 3000;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF; 
        INSERT INTO empleados_destino(nombre, salario) values(emp_nombre, emp_salario);
        SELECT emp_nombre, emp_salario;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call empleados_salario_superior_a_3000();
```

Salida:
```sql
+------------+-------------+
| emp_nombre | emp_salario |
+------------+-------------+
| Juan       |     8279.88 |
+------------+-------------+
1 row in set (0,02 sec)

+------------+-------------+
| emp_nombre | emp_salario |
+------------+-------------+
| María      |     4658.50 |
+------------+-------------+
1 row in set (0,03 sec)

+------------+-------------+
| emp_nombre | emp_salario |
+------------+-------------+
| Pedro      |   512000.00 |
+------------+-------------+
1 row in set (0,04 sec)
```


2. Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS aumentar_salarios_letraA;
CREATE PROCEDURE aumentar_salarios_letraA()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE nombre regexp '[Aa]';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE empleados SET salario = salario + (salario * 0.10) WHERE id = emp_id;
        SELECT emp_nombre, emp_salario;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call aumentar_salarios_letraA();
```

Salida:
```sql
+------------+-------------+
| emp_nombre | emp_salario |
+------------+-------------+
| Juan       |     3630.00 |
+------------+-------------+
1 row in set (0,02 sec)

+------------+-------------+
| emp_nombre | emp_salario |
+------------+-------------+
| María      |     4235.00 |
+------------+-------------+
1 row in set (0,04 sec)
```


3. Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.
```sql
DROP PROCEDURE IF EXISTS seleccionar_empleados;
DELIMITER //
CREATE PROCEDURE seleccionar_empleados(IN min_id INT, max_id INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE id BETWEEN min_id AND max_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF; 
        SELECT emp_id
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call seleccionar_empleados(2, 3);
```

Salida:
```sql

```


4. Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS eliminar_empleados;
CREATE PROCEDURE eliminar_empleados(IN min_value INT, max_value INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE cur CURSOR FOR SELECT id FROM empleados WHERE salario BETWEEN min_value AND max_value;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id;
        IF done THEN
            LEAVE read_loop;
        END IF; 
        DELETE FROM empleados WHERE id = emp_id;
        SELECT * FROM empleados;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call eliminar_empleados(2000, 2500);
```

Salida:
```sql
Query OK, 0 rows affected (0,00 sec)
```


5. Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%. 
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS aumenta_salario_empleado_por_nombre;
CREATE PROCEDURE aumenta_salario_empleado_por_nombre(IN name VARCHAR(50))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE nombre = name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF; 
        UPDATE empleados SET salario = salario + (salario * 0.20) WHERE id = emp_id;
        SELECT emp_nombre, emp_salario;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call aumenta_salario_empleado_por_nombre('Juan');
```

Salida:
```sql
+------------+-------------+
| emp_nombre | emp_salario |
+------------+-------------+
| Juan       |     6899.90 |
+------------+-------------+
```
