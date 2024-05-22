# Tarea 9
## Trabajo con la BBDD Alumnos

### Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:
- Tabla alumnos:
  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - email (cadena de caracteres)

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
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    email VARCHAR(50)
);
```

### Escribe una función llamado __crear_email__ que dados los parámetros de entrada: __nombre, apellido1, apellido2 y dominio__, cree una dirección de email y la devuelva como salida.
- Función: crear_email
  - Entrada:
      - nombre (cadena de caracteres)
      - apellido1 (cadena de caracteres)
      - apellido2 (cadena de caracteres)
      - dominio (cadena de caracteres)
  - Salida:
      - email (cadena de caracteres)

- El email devuelve una dirección de correo electrónico con el siguiente formato:
    - El primer carácter del parámetro nombre.
    - Los tres primeros caracteres del parámetro apellido1.
    - Los tres primeros caracteres del parámetro apellido2.
    - El carácter @.
    - El dominio pasado como parámetro.
    - La dirección de email debe estar en minúsculas.

```sql
DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email(nombre VARCHAR(50), apellido1 VARCHAR(50), apellido2 VARCHAR(50), dominio VARCHAR(50)) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  DECLARE caracter_nombre VARCHAR(50);
  DECLARE caracteres_apellido1 VARCHAR(50);
  DECLARE caracteres_apellido2 VARCHAR(50);

  SET caracter_nombre = SUBSTRING(nombre, 1, 1);
  SET caracteres_apellido1 = SUBSTRING(apellido1, 1, 3);
  SET caracteres_apellido2 = SUBSTRING(apellido2, 1, 3);
  RETURN eliminar_acentos(LCASE(CONCAT(caracter_nombre, caracteres_apellido1, caracteres_apellido2, '@', dominio)));
END //
DELIMITER ;
```

### También crea una función llamada __eliminar_acentos__ que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

- Función: eliminar_acentos
  - Entrada:
    - cadena (cadena de caracteres)
  - Salida:
    - (cadena de caracteres)

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

> ___La función crear_email deberá hacer uso de la función eliminar_acentos___.

### Una vez creada la tabla escriba un trigger con las siguientes características:
- Trigger:
  - __trigger_crear_email_before_insert__. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.

>__Nota__: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.

```sql
DROP TRIGGER IF EXISTS crear_email_before_insert;
DELIMITER //
CREATE TRIGGER crear_email_before_insert
BEFORE INSERT ON alumno
FOR EACH ROW
BEGIN
  IF NEW.email IS NULL THEN 
    SET NEW.email = crear_email(NEW.nombre, NEW.apellido1, NEW.apellido2, CONCAT(SUBSTRING_INDEX(UUID(), '-', 1), '.com'));
  END IF;
END;//
DELIMITER ;
```

### Verificación:
- Realiza inserciones en la tabla y verifica el correcto funcionamiento de las __funciones y triggers__.
- Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoridad posible.

```sql
-- Creamos un procedimiento para generar alumnos aleatorios:
DELIMITER //
DROP PROCEDURE IF EXISTS creando_alumnos;
CREATE PROCEDURE creando_alumnos(IN iterations INT, prefijo VARCHAR(50))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter <  iterations DO
        INSERT INTO alumno (nombre, apellido1, apellido2)
        VALUES (CONCAT(prefijo, SUBSTRING_INDEX(UUID(), '-', 1)), CONCAT(prefijo, SUBSTRING_INDEX(UUID(), '-', 1)), CONCAT(prefijo, SUBSTRING_INDEX(UUID(), '-', 1)));
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

```sql
-- Hacemos la llamada al procedimiento:
call creando_alumnos(10, 'alumno');

-- Salida:
+----+----------------+----------------+----------------+----------------------+
| id | nombre         | apellido1      | apellido2      | email                |
+----+----------------+----------------+----------------+----------------------+
|  1 | alumno103f63de | alumno103f63ff | alumno103f6405 | aalualu@103f64ff.com |
|  2 | alumno10440586 | alumno104405ac | alumno104405b0 | aalualu@1044074a.com |
|  3 | alumno1046e111 | alumno1046e13d | alumno1046e143 | aalualu@1046e27f.com |
|  4 | alumno104943b5 | alumno104943e6 | alumno104943ed | aalualu@10494574.com |
|  5 | alumno104b10f5 | alumno104b1121 | alumno104b112b | aalualu@104b124b.com |
|  6 | alumno104c8164 | alumno104c8191 | alumno104c819a | aalualu@104c82c7.com |
|  7 | alumno104e483d | alumno104e486d | alumno104e4874 | aalualu@104e49b7.com |
|  8 | alumno104ff28c | alumno104ff2bd | alumno104ff2c4 | aalualu@104ff3f1.com |
|  9 | alumno1051571c | alumno10515742 | alumno10515747 | aalualu@105159f6.com |
| 10 | alumno10530269 | alumno1053029e | alumno105302a5 | aalualu@1053040b.com |
+----+----------------+----------------+----------------+----------------------+
```
