# Unidad 8 - Programación en base de datos (Procedimientos)

## Cursores
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
- __IF done THEN LEAVE read_loop; END IF;__: Verifica si se han recuperado todas las filas del cursor. Si es así, sale del bucle utilizando la etiqueta LEAVE.
- __UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;__: Actualiza el salario del empleado multiplicándolo por el porcentaje dado.
- __END LOOP;__: Fin del bucle.
- __CLOSE cur;__: Cierra el cursor.
- __END //__: Fin del procedimiento almacenado.