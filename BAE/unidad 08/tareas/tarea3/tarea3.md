# Tarea 3
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

Donde:
    - __DELIMITER //__: Esto establece el delimitador de sentencias a //. Esto es necesario porque los procedimientos almacenados en MySQL pueden contener puntos y comas, lo que podría confundir al intérprete si no se establece un delimitador personalizado.
    - __CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))__: Esta línea crea un nuevo procedimiento almacenado llamado aumentar_salarios. Toma un parámetro de entrada porcentaje que es de tipo DECIMAL(5,2), lo que significa que puede aceptar números decimales con un máximo de 5 dígitos en total, 2 de los cuales pueden estar después del punto decimal.
    - __BEGIN__: Inicia el bloque de código del procedimiento almacenado.
    - __DECLARE done INT DEFAULT FALSE;__: Declara una variable local llamada done que se usará para controlar la terminación del bucle del cursor.
    - __DECLARE emp_id INT;, DECLARE emp_nombre VARCHAR(100);, DECLARE emp_salario DECIMAL(10, 2);__: Declara variables locales para almacenar el id, nombre y salario de los empleados que se recuperarán del cursor.
    - __DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;__: Declara un cursor llamado cur que recupera los id, nombre y salario de la tabla empleados.
    - __DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;__: Declara un manejador que se activará cuando ya no haya más filas para leer en el cursor. Establece la variable done en TRUE, lo que indica que se ha completado el bucle del cursor.
    - __OPEN cur;__: Abre el cursor para comenzar a recorrer los registros de la tabla empleados.
    - __read_loop__: LOOP: Etiqueta del bucle para que pueda ser interrumpido con la instrucción LEAVE.
    - __FETCH cur INTO emp_id, emp_nombre, emp_salario;__: Recupera el siguiente conjunto de valores del cursor y los almacena en las variables declaradas.
    __IF done THEN LEAVE read_loop; END IF;__: Verifica si se han recuperado todas las filas del cursor. Si es así, sale del bucle utilizando la etiqueta LEAVE.
    - __UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;__: Actualiza el salario del empleado multiplicándolo por el porcentaje dado.
    - __END LOOP;__: Fin del bucle.
    - __CLOSE cur;__: Cierra el cursor.
    - __END //__: Fin del procedimiento almacenado.

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
CREATE PROCEDURE aumentar_salarios_excluyendo(porcentaje DECIMAL(5,2))
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
        UPDATE empleados SET salario = salario * (salario * ) WHERE id = emp_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```
call aumentar_salarios_excluyendo(5);

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3150.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3360.00 |
+----+--------+---------+


2. Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS calcular_salario_anual;
CREATE PROCEDURE calcular_salario_anual()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_id AS id, emp_nombre AS nombre, emp_salario * 12 AS salario_anual;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

3. Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS contar_empleados_por_rango_salario;
CREATE PROCEDURE contar_empleados_por_rango_salario(IN inferior DECIMAL(10,2), IN medio DECIMAL(10,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE num_emp_menor_igual_inferior INT DEFAULT 0;
    DECLARE num_emp_entre_inferior_y_medio INT DEFAULT 0;
    DECLARE num_emp_mayor_medio INT DEFAULT 0;
    
    DECLARE cur CURSOR FOR SELECT salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF emp_salario <= inferior THEN
            SET num_emp_menor_igual_inferior = num_emp_menor_igual_inferior + 1;
        ELSEIF emp_salario > inferior AND emp_salario <= medio THEN
            SET num_emp_entre_inferior_y_medio = num_emp_entre_inferior_y_medio + 1;
        ELSE
            SET num_emp_mayor_medio = num_emp_mayor_medio + 1;
        END IF;
    END LOOP;
    CLOSE cur;

    SELECT 'Menor o igual a ' AS Rango, inferior AS Limite_Superior, num_emp_menor_igual_inferior AS Num_Empleados
    UNION
    SELECT 'Entre ' AS Rango, inferior AS Limite_Inferior, medio AS Limite_Superior, num_emp_entre_inferior_y_medio AS Num_Empleados
    UNION
    SELECT 'Mayor que ' AS Rango, medio AS Limite_Inferior, 'infinito' AS Limite_Superior, num_emp_mayor_medio AS Num_Empleados;
END //
DELIMITER ;
```