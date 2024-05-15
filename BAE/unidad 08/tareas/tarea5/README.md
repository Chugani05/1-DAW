# Tarea 5
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
CREATE PROCEDURE insertar_nombre_aleatorio_rand(IN iterations INT, salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_rand(5, 2000, 7000);
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
|  4 | Empleado0.5615586448102804 | 5419.00 |
|  5 | Empleado0.7345302977920792 | 5106.00 |
|  6 | Empleado0.9020481313597859 | 5234.00 |
|  7 | Empleado0.5281420923100245 | 5501.00 |
|  8 | Empleado0.9162668482551973 | 4405.00 |
+----+----------------------------+---------+
```


### Ejercicio 2
Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función __UUID()__.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_uuid;
CREATE PROCEDURE insertar_nombre_aleatorio_uuid(IN iterations INT, salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (UUID(), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_uuid(3, 2500, 7050);
```

Salida:
```sql
select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.5615586448102804           | 5419.00 |
|  5 | Empleado0.7345302977920792           | 5106.00 |
|  6 | Empleado0.9020481313597859           | 5234.00 |
|  7 | Empleado0.5281420923100245           | 5501.00 |
|  8 | Empleado0.9162668482551973           | 4405.00 |
|  9 | 9b39f0a4-1209-11ef-9c10-080027f94d4c | 4285.00 |
| 10 | 9b3d9624-1209-11ef-9c10-080027f94d4c | 6170.00 |
| 11 | 9b401b96-1209-11ef-9c10-080027f94d4c | 6392.00 |
+----+--------------------------------------+---------+
```


### Ejercicio 3
Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_nombre_aleatorio_orderbyrand;
CREATE PROCEDURE insertar_nombre_aleatorio_orderbyrand(IN iterations INT, salario_base INT, salario_max INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (salario_max - salario_base + 1)) + salario_base
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
call insertar_nombre_aleatorio_orderbyrand(2, 1500, 7500);
```

Salida:
```sql
select * from empleados;

```

### Ejercicio 4
Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
```
 
 Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_orderbyrand(2, 1500, 7500);
```

Salida:
```sql
select * from empleados;

```

### Ejercicio 5
Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(2)), FLOOR(RAND(2) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(3)), FLOOR(RAND(3) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(4)), FLOOR(RAND(4) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(5)), FLOOR(RAND(5) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(6)), FLOOR(RAND(6) * (10000 - 2000 + 1)) + 2000);
```

Realicemos la llamada al procedimiento:
```sql
call insertar_nombre_aleatorio_orderbyrand(2, 1500, 7500);
```

Salida:
```sql
select * from empleados;

```