## Tabla con referencia a id de otra
```sql
DROP TABLE IF EXISTS log_cambios_email;
CREATE TABLE log_cambios_email(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT REFERENCES alumnos(id),
    fecha_hora DATETIME,
    old_email VARCHAR(100),
    new_email VARCHAR(100)
);
```


## Trigger
```sql
DROP TRIGGER IF EXISTS trigger_guardar_email_after_update;
DELIMITER //
CREATE TRIGGER trigger_guardar_email_after_update
AFTER UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        INSERT INTO log_cambios_email(id_alumno, fecha_hora, old_email, new_email) 
        VALUES (OLD.id, NOW(), OLD.email, NEW.email);
    END IF;
END; //
DELIMITER ;
```

### Ejemplo trigger
```sql
DROP TRIGGER IF EXISTS check_nota_before_update;
DELIMITER //
CREATE TRIGGER check_nota_before_update
BEFORE UPDATE ON alumno
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END; //
DELIMITER ;
```


## Procedimiento
```sql
DROP FUNCTION IF EXISTS insertar_alumnos;
DELIMITER //
CREATE PROCEDURE insertar_alumnos(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id INT;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(4, 1);

    WHILE counter < iterations DO
        SET random_id = FLOOR(RAND() * 10000) + counter;
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND(RAND() * (10 - 3) + 3, 1);
        
        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (random_id, random_nombre, random_apellido1, random_apellido2, random_nota);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```


## Funcion
```sql
DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(30), apellido1 VARCHAR(30), apellido2 VARCHAR(30), dominio VARCHAR(30))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE name_char VARCHAR(1);
    DECLARE apellido1_chars VARCHAR(3);
    DECLARE apellido2_chars VARCHAR(3);
    DECLARE arroba VARCHAR(1) DEFAULT '@';
    DECLARE email VARCHAR(100);

    SET name_char = SUBSTR(nombre, 1, 1);
    SET apellido1_chars = SUBSTR(apellido1, 1, 3);
    SET apellido2_chars = SUBSTR(apellido2, 1, 3);
    SET email = LCASE(CONCAT(name_char, apellido1_chars, apellido2_chars, arroba, dominio));

    RETURN eliminar_acentos(email);
END //
DELIMITER ;
```

### Ejemplo función
```sql
DROP FUNCTION IF EXISTS eliminar_acentos;
DELIMITER //
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(100)) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  DECLARE nueva_cadena VARCHAR(100);

  SET nueva_cadena = REPLACE(cadena, 'á', 'a');
  SET nueva_cadena = REPLACE(nueva_cadena, 'é', 'e');
  SET nueva_cadena = REPLACE(nueva_cadena, 'í', 'i');
  SET nueva_cadena = REPLACE(nueva_cadena, 'ó', 'o');
  SET nueva_cadena = REPLACE(nueva_cadena, 'ú', 'u');
  RETURN nueva_cadena;
END //
DELIMITER ;
```

## Cursor
```sql
DROP PROCEDURE IF EXISTS aumentar_20;
DELIMITER //
CREATE PROCEDURE aumentar_20(IN p_nombre VARCHAR(100))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados where nombre = p_nombre;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE empleados set salario = salario * (1 + 20 / 100) where id = emp_id;
        
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
```

## Aleatoriedad
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS creando_personas;
CREATE PROCEDURE creando_personas(IN iterations INT, nombre VARCHAR(50), salario_min DECIMAL(10, 2), IN salario_max DECIMAL(10, 2), subsidio_base DECIMAL(10, 2), subsidio_max DECIMAL(10, 2), salud_base DECIMAL(10, 2), salud_max DECIMAL(10, 2), pension_base DECIMAL(10, 2), pension_max DECIMAL(10, 2), bono_base DECIMAL(10, 2), bono_max DECIMAL(10, 2), integral_base DECIMAL(10, 2), integral_max DECIMAL(10, 2))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter <  iterations DO
        INSERT INTO persona (id, nombre, salario_base, subsidio, salud, pension, bono, integral)
        VALUES (SUBSTRING_INDEX(UUID(), '-', 1), CONCAT(nombre, FLOOR(RAND() * (100 - 1 + 1))), FLOOR(RAND() * (salario_max - salario_min + 1)), FLOOR(RAND() * (subsidio_max - subsidio_base + 1)), FLOOR(RAND() * (salud_max - salud_base + 1)), FLOOR(RAND() * (pension_max - pension_base + 1)), FLOOR(RAND() * (bono_max - bono_base + 1)), FLOOR(RAND() * (integral_max - integral_base + 1)));
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```