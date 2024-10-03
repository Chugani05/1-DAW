# Tarea 4
## Trabajo con cursores

La base de datos de __"empleados"__ es un sistema diseñado para gestionar información relacionada con los empleados de una empresa. Esta base de datos está estructurada en torno a la entidad principal "empleados", que contiene información detallada sobre cada empleado. La estructura de la base de datos se compone de una única tabla principal llamada "empleados".

La tabla "empleados" está diseñada con las siguientes columnas:

- __id__: Esta columna sirve como identificador único para cada empleado. Es de tipo entero y se genera automáticamente utilizando la propiedad AUTO_INCREMENT.
- __nombre__: Almacena el nombre completo de cada empleado. Es de tipo cadena de caracteres (VARCHAR) con una longitud máxima de 100 caracteres.
- __salario__: Esta columna registra el salario de cada empleado. Se define como un número decimal (DECIMAL) con una precisión de 10 dígitos en total y 2 dígitos después del punto decimal.

```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo
INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

Veamos la tabla:
```sql
select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3520.00 |
+----+--------+---------+
```

Vamos a crear distintos procedimientos que harán uso de cursores. Vamos a ver un ejemplo y ver como se define y comporta.

  1. Crea un procedimiento que aumente el salario de los empleados en un porcentaje dado:
```code
salario * (1 + porcentaje / 100) 
```

El procedimiento que resulta el problema planteado será el siguiente:
```sql
DELIMITER //
CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
CALL aumentar_salarios(10);
```

Salida:
```sql
  +----+--------+---------+
  | id | nombre | salario |
  +----+--------+---------+
  |  1 | Juan   | 3300.00 |
  |  2 | María  | 3850.00 |
  |  3 | Pedro  | 3520.00 |
  +----+--------+---------+
  3 rows in set (0,00 sec)
```

Teniendo este ejemplo como referencia, realiza:

1. Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS aumentar_salarios_excluyendo;
CREATE PROCEDURE aumentar_salarios_excluyendo()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, salario FROM empleados WHERE salario <= 3200;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE empleados SET salario = salario * (salario * 0.05) WHERE id = emp_id;
        SELECT emp_id, emp_salario;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call aumentar_salarios_excluyendo();
```

Salida:
```sql
+--------+-------------+
| emp_id | emp_salario |
+--------+-------------+
|      3 |     3200.00 |
+--------+-------------+
```


2. Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS calcular_salario_anual;
CREATE PROCEDURE calcular_salario_anual()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_salario * 12 AS salario_anual;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

Realicemos la llamada al procedimiento:
```sql
call calcular_salario_anual();
```

Salida:
```sql
+---------------+
| salario_anual |
+---------------+
|     143076.36 |
+---------------+
1 row in set (0,00 sec)

+---------------+
| salario_anual |
+---------------+
|      55902.00 |
+---------------+
1 row in set (0,00 sec)

+---------------+
| salario_anual |
+---------------+
|    6144000.00 |
+---------------+
1 row in set (0,00 sec)
```


3. Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.
```sql

```

Realicemos la llamada al procedimiento:
```sql
call ();
```

Salida:
```sql

```