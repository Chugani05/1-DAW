# Tarea 10
## Trabajo con la BBDD Alumnos

### Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características:
Trigger: __trigger_guardar_email_after_update__:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de actualización.
  - Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
  - La tabla log_cambios_email contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - old_email: valor anterior del email (cadena de caracteres)
    - new_email: nuevo valor con el que se ha actualizado

    ```sql
    -- Creamos la tabla log_cambios_email:
    DROP TABLE IF EXISTS log_cambios_email;
    CREATE TABLE log_cambios_email (
        id INT PRIMARY KEY AUTO_INCREMENT,
        id_alumno INT REFERENCES alumnos(id),
        fecha_hora DATETIME,
        old_email VARCHAR(50),
        new_email VARCHAR(50)
    );
    ```

```sql
DROP TRIGGER IF EXISTS guardar_email_after_update;
DELIMITER //
CREATE TRIGGER guardar_email_after_update
AFTER UPDATE ON alumno
FOR EACH ROW
BEGIN
  IF OLD.email <> NEW.email THEN 
    INSERT INTO log_cambios_email (id_alumno, fecha_hora, old_email, new_email) VALUES (NEW.id, NOW(), OLD.email, NEW.email);
  END IF;
END;//
DELIMITER ;
```

```sql
-- Actualizamos uno de los emails:
UPDATE alumno SET email = 'nombre@gmail.com' WHERE id = 5;

-- Comprobamos que el email se haya actualizado correctamente:
SELECT * FROM alumno WHERE id = 5;
+----+----------------+----------------+----------------+------------------+
| id | nombre         | apellido1      | apellido2      | email            |
+----+----------------+----------------+----------------+------------------+
|  5 | alumno104b10f5 | alumno104b1121 | alumno104b112b | nombre@gmail.com |
+----+----------------+----------------+----------------+------------------+

-- Comprobamos que se haya hecho la inserción en la tabla log_cambios_email:
SELECT * FROM log_cambios_email;
+----+-----------+---------------------+----------------------+------------------+
| id | id_alumno | fecha_hora          | old_email            | new_email        |
+----+-----------+---------------------+----------------------+------------------+
|  1 |         5 | 2024-05-22 19:36:11 | aalualu@104b124b.com | nombre@gmail.com |
+----+-----------+---------------------+----------------------+------------------+
```

### Añade un nuevo trigger que tenga las siguientes características:
- Trigger: __trigger_guardar_alumnos_eliminados__:
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta después de una operación de borrado.
  - Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
  - La tabla log_alumnos_eliminados contiene los siguientes campos:
    - id: clave primaria (entero autonumérico)
    - id_alumno: id del alumno (entero)
    - fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
    - nombre: nombre del alumno eliminado (cadena de caracteres)
    - apellido1: primer apellido del alumno eliminado (cadena de caracteres)
    - apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
    - email: email del alumno eliminado (cadena de caracteres).
    
    ```sql
    -- Creamos la tabla log_alumnos_eliminados:
    DROP TABLE IF EXISTS log_alumnos_eliminados;
    CREATE TABLE log_alumnos_eliminados (
        id INT PRIMARY KEY AUTO_INCREMENT,
        id_alumno INT REFERENCES alumnos(id),
        fecha_hora VARCHAR(50),
        nombre VARCHAR(50),
        apellido1 VARCHAR(50),
        apellido2 VARCHAR(50),
        email VARCHAR(50)
    );
    ```

```sql
DROP TRIGGER IF EXISTS guardar_alumnos_eliminados;
DELIMITER //
CREATE TRIGGER guardar_alumnos_eliminados
AFTER DELETE ON alumno
FOR EACH ROW
BEGIN
  INSERT INTO log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email) 
  VALUES (OLD.id, NOW(), OLD.nombre, OLD.apellido1, OLD.apellido2, OLD.email);
END;//
DELIMITER ;
```

```sql
-- Eliminamos a uno de los alumnos:
DELETE FROM alumno WHERE id = 7;

-- Comprobamos que el alumno haya sido eliminado correctamente:
SELECT * FROM alumno WHERE id BETWEEN 5 AND 9;
+----+----------------+----------------+----------------+----------------------+
| id | nombre         | apellido1      | apellido2      | email                |
+----+----------------+----------------+----------------+----------------------+
|  5 | alumno104b10f5 | alumno104b1121 | alumno104b112b | nombre@gmail.com     |
|  6 | alumno104c8164 | alumno104c8191 | alumno104c819a | aalualu@104c82c7.com |
|  8 | alumno104ff28c | alumno104ff2bd | alumno104ff2c4 | aalualu@104ff3f1.com |
|  9 | alumno1051571c | alumno10515742 | alumno10515747 | aalualu@105159f6.com |
+----+----------------+----------------+----------------+----------------------+

-- Comprobamos que se haya hecho la inserción en la tabla log_alumnos_eliminados:
SELECT * FROM log_alumnos_eliminados;
+----+-----------+---------------------+----------------+----------------+----------------+----------------------+
| id | id_alumno | fecha_hora          | nombre         | apellido1      | apellido2      | email                |
+----+-----------+---------------------+----------------+----------------+----------------+----------------------+
|  1 |         7 | 2024-05-23 02:18:57 | alumno104e483d | alumno104e486d | alumno104e4874 | aalualu@104e49b7.com |
+----+-----------+---------------------+----------------+----------------+----------------+----------------------+
```