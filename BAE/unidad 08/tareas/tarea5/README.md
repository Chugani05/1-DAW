# Tarea 6
## Trabajo con procedimientos de generación de información

Dado el procedimiento base:

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

Y las funciones descritas en [aleatoriedad](../../aleatoriedad.md), realiza los siguientes procedimientos, que realicen las siguietes operaciones:

### Ejercicio 1
Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_rand;
CREATE PROCEDURE insertar_nombre_aleatorio_rand(IN iterations INT, nombre VARCHAR(50), salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT(nombre, RAND()), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_rand(5, 'Empleado', 2000, 7000);
```

Salida:
```sql
select * from empleados;
+----+----------------------------+---------+
| id | nombre                     | salario |
+----+----------------------------+---------+
|  1 | Juan                       | 3000.00 |
|  2 | María                      | 3500.00 |
|  3 | Pedro                      | 3200.00 |
|  4 | Empleado0.7278653874321518 | 6170.00 |
|  5 | Empleado0.9861133079846514 | 4144.00 |
|  6 | Empleado0.1853646414218141 | 5203.00 |
|  7 | Empleado0.6469086917554109 | 3564.00 |
|  8 | Empleado0.6229836471592856 | 2883.00 |
+----+----------------------------+---------+
```


### Ejercicio 2
Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función __UUID()__.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_uuid;
CREATE PROCEDURE insertar_nombre_aleatorio_uuid(IN iterations INT, nombre VARCHAR(50), salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT(nombre, UUID()), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_uuid(3, 'Empleado', 2500, 7050);
```

Salida:
```sql
select * from empleados;
+----+----------------------------------------------+---------+
| id | nombre                                       | salario |
+----+----------------------------------------------+---------+
|  1 | Juan                                         | 3000.00 |
|  2 | María                                        | 3500.00 |
|  3 | Pedro                                        | 3200.00 |
|  4 | Empleado0.7278653874321518                   | 6170.00 |
|  5 | Empleado0.9861133079846514                   | 4144.00 |
|  6 | Empleado0.1853646414218141                   | 5203.00 |
|  7 | Empleado0.6469086917554109                   | 3564.00 |
|  8 | Empleado0.6229836471592856                   | 2883.00 |
|  9 | Empleado722c0149-12ee-11ef-84be-080027f94d4c | 2566.00 |
| 10 | Empleado7230edaa-12ee-11ef-84be-080027f94d4c | 4968.00 |
| 11 | Empleado72340db4-12ee-11ef-84be-080027f94d4c | 5543.00 |
+----+----------------------------------------------+---------+
```


### Ejercicio 3
Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_orderbyrand;
CREATE PROCEDURE insertar_nombre_aleatorio_orderbyrand(IN iterations INT, nombre VARCHAR(50), salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT(nombre, RAND()), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 2;
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_orderbyrand(1, 'Empleado', 1500, 7500);
```

Salida:
```sql
select * from empleados;
+----+----------------------------------------------+---------+
| id | nombre                                       | salario |
+----+----------------------------------------------+---------+
|  1 | Juan                                         | 3000.00 |
|  2 | María                                        | 3500.00 |
|  3 | Pedro                                        | 3200.00 |
|  4 | Empleado0.7278653874321518                   | 6170.00 |
|  5 | Empleado0.9861133079846514                   | 4144.00 |
|  6 | Empleado0.1853646414218141                   | 5203.00 |
|  7 | Empleado0.6469086917554109                   | 3564.00 |
|  8 | Empleado0.6229836471592856                   | 2883.00 |
|  9 | Empleado722c0149-12ee-11ef-84be-080027f94d4c | 2566.00 |
| 10 | Empleado7230edaa-12ee-11ef-84be-080027f94d4c | 4968.00 |
| 11 | Empleado72340db4-12ee-11ef-84be-080027f94d4c | 5543.00 |
| 12 | Empleado0.5777959521653093                   | 5930.00 |
| 13 | Empleado0.5767336921549716                   | 1551.00 |
+----+----------------------------------------------+---------+
```

### Ejercicio 4
Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_substring;
CREATE PROCEDURE insertar_nombre_aleatorio_substring(IN iterations INT, nombre VARCHAR(50), salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
    INSERT INTO empleados (nombre, salario)
    VALUES CONCAT(nombre,(SUBSTRING_INDEX(UUID(), '-', -1)), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```
 
 Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_substring(4, 'Empleado', 1200, 6000);
```

Salida:
```sql
select * from empleados;

```

### Ejercicio 5
Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_semilla;
CREATE PROCEDURE insertar_nombre_aleatorio_semilla(IN iterations INT, nombre VARCHAR(50), salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT(nombre, RAND(counter + 1)), FLOOR(RAND(counter + 1) * (salario_max - salario_base + 1)) + salario_base);
    SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_semilla(6, 'Empleado', 3500, 8500);
```

Salida:
```sql
select * from empleados;

```