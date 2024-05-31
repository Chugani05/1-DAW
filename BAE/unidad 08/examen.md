# Ejercicios de Base de Datos
## Ejercicio 1: Creación de Base de Datos y Tablas
1. Crea una base de datos llamada `donacion`.

```sql
DROP DATABASE IF EXISTS donacion;
CREATE DATABASE donacion;
USE donacion;
```


2. Crea una tabla llamada `persona` con los siguientes campos:
   - Identificador Auto Incremental (`id`) - Integer, PK.
   - Identificador (`identificador`) - Texto.
   - Peso (`peso`) - Entero.
   - Admitido (`admitido`) - Texto (`Si`/`No`).
   - Sexo (`sexo`) - Texto (`H`/`M`).
  
```sql
CREATE TABLE persona(
    id INT PRIMARY KEY AUTO_INCREMENT,
    identificador VARCHAR(30) NOT NULL,
    peso INT NOT NULL,
    admitido ENUM('Si', 'No') NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    fecha DATE NOT NULL
);
```


## Ejercicio 2: Procedimientos Almacenados
1. Crea un procedimiento llamado `insertar_datos` que inserte datos aleatorios en la tabla `persona`. El procedimiento debe recibir como parámetro de entrada el número de registros que se desea insertar.

```sql
DROP PROCEDURE IF EXISTS insertar_datos;
DELIMITER //
CREATE PROCEDURE insertar_datos(in iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_id VARCHAR(30);
    DECLARE p_peso int;
    DECLARE p_admitido ENUM('Si', 'No');
    DECLARE p_sexo ENUM('H', 'M');
    DECLARE aux INT;

    WHILE counter < iterations DO
        SET p_id = SUBSTRING_INDEX(UUID(), '-', 1);
        SET p_peso = FLOOR(RAND() * 130 - 40 + 1) + 40;
        SET aux = (RAND() * (100 - 1 + 1));
        SET p_admitido = IF(aux > 50, 'Si', 'No');
        SET aux = (RAND() * (100 - 1 + 1));
        SET p_sexo = IF(aux > 50, 'H', 'M');

        INSERT INTO persona(identificador, peso, admitido, sexo, fecha) VALUES (p_id, p_peso, p_admitido, p_sexo, CURDATE());
        SET counter = counter + 1;
    END while;
END //
DELIMITER ;
```

```sql
-- llmada:
CALL insertar_datos(20);

-- salida:
select * from persona;
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 39adc615      |   85 | Si       | H    | 2024-05-29 |
|  2 | 39b85fdf      |   36 | Si       | M    | 2024-05-29 |
|  3 | 39b904e9      |   44 | Si       | H    | 2024-05-29 |
|  4 | 39b97a62      |   51 | No       | H    | 2024-05-29 |
|  5 | 39b9cc47      |  123 | Si       | H    | 2024-05-29 |
|  6 | 39bc8c8e      |   95 | Si       | H    | 2024-05-29 |
|  7 | 39bdc5a6      |   11 | No       | M    | 2024-05-29 |
|  8 | 39be3da4      |  118 | Si       | M    | 2024-05-29 |
|  9 | 39beaa07      |  106 | No       | M    | 2024-05-29 |
| 10 | 39bef447      |   44 | Si       | M    | 2024-05-29 |
| 11 | 39c01767      |   97 | Si       | M    | 2024-05-29 |
| 12 | 39c2e76f      |   49 | Si       | H    | 2024-05-29 |
| 13 | 39cc6507      |   92 | No       | M    | 2024-05-29 |
| 14 | 39ccb2e7      |   40 | No       | M    | 2024-05-29 |
| 15 | 39cd08ae      |   64 | No       | M    | 2024-05-29 |
| 16 | 39cee628      |   92 | No       | M    | 2024-05-29 |
| 17 | 39d0dd9d      |    4 | Si       | M    | 2024-05-29 |
| 18 | 39d13e1a      |   27 | Si       | M    | 2024-05-29 |
| 19 | 39d18b8e      |   69 | No       | M    | 2024-05-29 |
| 20 | 39d1eba7      |   74 | Si       | H    | 2024-05-29 |
+----+---------------+------+----------+------+------------+
```

+---------------+
| identificador |
+---------------+
| 39adc615      |
| 39b85fdf      |
| 39b904e9      |
| 39b97a62      |
| 39b9cc47      |
| 39bc8c8e      |
| 39bdc5a6      |
| 39be3da4      |
| 39beaa07      |
| 39bef447      |
| 39c01767      |
| 39c2e76f      |
| 39cc6507      |
| 39ccb2e7      |
| 39cd08ae      |
| 39cee628      |
| 39d0dd9d      |
| 39d13e1a      |
| 39d18b8e      |
| 39d1eba7      |
+---------------+

2. Crea un procedimiento llamado `actualizar_fecha` que permita actualizar la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona y una fecha.

```sql
DROP PROCEDURE IF EXISTS actualizar_fecha;
DELIMITER //
CREATE PROCEDURE actualizar_fecha(IN input_id INT, input_fecha DATE)
BEGIN
    UPDATE persona SET fecha = input_fecha WHERE id = input_id;
END //
DELIMITER ;
```

```sql
-- llmada:
call actualizar_fecha(2, '2024-03-17');

-- salida:
select * from persona where id = 2;
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  2 | 39b85fdf      |   36 | Si       | M    | 2024-03-17 |
+----+---------------+------+----------+------+------------+
```


3. Crea un procedimiento llamado `CalcularTotalDonaciones` que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada `total_donaciones`. La tabla `total_donaciones` debe tener dos columnas: `id_persona` (texto) y `cantidad_total` (integer).

```sql
DROP PROCEDURE IF EXISTS CalcularTotalDonaciones;
DELIMITER //
CREATE PROCEDURE CalcularTotalDonaciones()
BEGIN
    DROP TABLE IF EXISTS total_donaciones;
    CREATE TABLE total_donaciones(
        id_persona INT REFERENCES persona(identificador),
        cantidad_total INT
    );
    INSERT INTO total_donaciones (id_persona, cantidad_total)
    SELECT identificador, count(*) FROM persona GROUP BY identificador;
END //
DELIMITER ;
```

```sql
-- llmada:
call CalcularTotalDonaciones();

-- salida:
select * from total_donaciones;
+---------------+----------------+
| identificador | cantidad_total |
+---------------+----------------+
| 39adc615      |              1 |
| 39b85fdf      |              1 |
| 39b904e9      |              1 |
| 39b97a62      |              1 |
| 39b9cc47      |              1 |
| 39bc8c8e      |              1 |
| 39bdc5a6      |              1 |
| 39be3da4      |              1 |
| 39beaa07      |              1 |
| 39bef447      |              1 |
| 39c01767      |              1 |
| 39c2e76f      |              1 |
| 39cc6507      |              1 |
| 39ccb2e7      |              1 |
| 39cd08ae      |              1 |
| 39cee628      |              1 |
| 39d0dd9d      |              1 |
| 39d13e1a      |              1 |
| 39d18b8e      |              1 |
| 39d1eba7      |              1 |
+---------------+----------------+
```


4. Crea un procedimiento llamado `eliminar_persona` que permita eliminar una persona de la tabla `total_donaciones`.

```sql
DROP PROCEDURE IF EXISTS eliminar_persona;
DELIMITER //
CREATE PROCEDURE eliminar_persona(IN input_id INT)
BEGIN
    DELETE FROM total_donaciones WHERE id_persona = input_id;
END //
DELIMITER ;
```

```sql
-- llmada:
call eliminar_persona(17);

-- salida:
select * from total_donaciones;
+---------------+----------------+
| identificador | cantidad_total |
+---------------+----------------+
| 39adc615      |              1 |
| 39b85fdf      |              1 |
| 39b904e9      |              1 |
| 39b97a62      |              1 |
| 39b9cc47      |              1 |
| 39bc8c8e      |              1 |
| 39bdc5a6      |              1 |
| 39be3da4      |              1 |
| 39beaa07      |              1 |
| 39bef447      |              1 |
| 39c01767      |              1 |
| 39c2e76f      |              1 |
| 39cc6507      |              1 |
| 39ccb2e7      |              1 |
| 39cd08ae      |              1 |
| 39cee628      |              1 |
| 39d0dd9d      |              1 |
| 39d13e1a      |              1 |
| 39d18b8e      |              1 |
| 39d1eba7      |              1 |
+---------------+----------------+
```

## Ejercicio 3: Funciones Almacenadas
1. Crea una función llamada `posible_donador` que determine si una persona almacenada en la tabla `persona` puede realizar una donación. La función debe recibir como parámetro de entrada el identificador de esta persona y una fecha de donación. Si la persona cumple con los requisitos, actualiza la fecha de última donación y retorna `TRUE`; de lo contrario, retorna `FALSE`.

```sql
DROP FUNCTION IF EXISTS posible_donador;
DELIMITER //
CREATE FUNCTION posible_donador(input_id INT, input_fecha DATE)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE p_sexo ENUM('H','M');
    DECLARE p_admitido ENUM('Si','No');
    DECLARE dias INT;
    DECLARE p_fecha DATE;

    SELECT admitido, sexo, fecha INTO p_admitido, p_sexo, p_fecha FROM persona WHERE id = input_id;

    IF p_admitido = 'No' THEN
        RETURN FALSE;
    END IF;

    SET dias = DATEDIFF(input_fecha, p_fecha);
    IF (p_sexo = 'H' AND dias < 90) OR (p_sexo = 'M' AND dias < 120) THEN
        RETURN FALSE;
    END IF;

    UPDATE persona SET fecha = input_fecha WHERE id = input_id;
    RETURN TRUE;
END//
DELIMITER ;
```

```sql
--0 representa False, no puede donar
select posible_donador(5, '2024-06-04');
+----------------------------------+
| posible_donador(5, '2024-06-04') |
+----------------------------------+
|                                0 |
+----------------------------------+

--1 representa True, que puede donar
select posible_donador(6, '2024-12-24');
+----------------------------------+
| posible_donador(6, '2024-12-24') |
+----------------------------------+
|                                1 |
+----------------------------------+
```


2. Crea una función llamada `maximo_donador` que determine qué persona es la que más donaciones ha realizado.

```sql
DROP FUNCTION IF EXISTS maximo_donador;
DELIMITER //
CREATE FUNCTION maximo_donador()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE p_id INT;
    SELECT id_persona INTO p_id FROM total_donaciones ORDER BY cantidad_total DESC LIMIT 1;
    RETURN p_id;
END //
DELIMITER ;
```

```sql
-- llmada:
SELECT maximo_donador();


-- salida:
+------------------+
| maximo_donador() |
+------------------+
|                1 |
+------------------+
```


## Ejercicio 4: Triggers
1. Crea un trigger que actualice la tabla `total_donaciones` cada vez que se inserte un nuevo registro en la tabla `persona`.

```sql
DROP TRIGGER IF EXISTS actualizar_total_donaciones;
DELIMITER //
CREATE TRIGGER actualizar_total_donaciones
AFTER INSERT ON persona
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM total_donaciones WHERE id_persona = NEW.id) THEN
        UPDATE total_donaciones
        SET cantidad_total = cantidad_total + 1
        WHERE id_persona = NEW.id;
    ELSE
        INSERT INTO total_donaciones (id_persona, cantidad_total)
        VALUES (NEW.id, 1);
    END IF;
END //
DELIMITER ;
```

```sql
-- llamada:
call insertar_datos(2);
Query OK, 1 row affected (0.02 sec)

-- salida:
select * from total_donaciones;
+---------------+----------------+
| identificador | cantidad_total |
+---------------+----------------+
| 39adc615      |              1 |
| 39b85fdf      |              1 |
| 39b904e9      |              1 |
| 39b97a62      |              1 |
| 39b9cc47      |              1 |
| 39bc8c8e      |              1 |
| 39bdc5a6      |              1 |
| 39be3da4      |              1 |
| 39beaa07      |              1 |
| 39bef447      |              1 |
| 39c01767      |              1 |
| 39c2e76f      |              1 |
| 39cc6507      |              1 |
| 39ccb2e7      |              1 |
| 39cd08ae      |              1 |
| 39cee628      |              1 |
| 39d0dd9d      |              1 |
| 39d13e1a      |              1 |
| 39d18b8e      |              1 |
| 39d1eba7      |              1 |
| 41bc1691      |              1 |
| 41becad0      |              1 |
+---------------+----------------+
```


2. Crea un trigger que elimine todos los registros en la tabla `persona` cuando se elimine un registro de la tabla `total_donaciones`.

```sql
DROP TRIGGER IF EXISTS actualiza_donaciones;
DELIMITER //
CREATE TRIGGER actualiza_donaciones
AFTER DELETE ON total_donaciones
FOR EACH ROW
BEGIN
    DELETE FROM persona WHERE id = OLD.id_persona;
END //
DELIMITER ;
```

```sql
-- llamada:
delete from total_donaciones where id_persona = 8;
Query OK, 1 row affected (0.01 sec)

-- salida:
select * from persona;
--se ha borrado también de la tabla persona los registros con id 8
+----+---------------+------+----------+------+------------+
| id | identificador | peso | admitido | sexo | fecha      |
+----+---------------+------+----------+------+------------+
|  1 | 39adc615      |   85 | Si       | H    | 2024-05-29 |
|  2 | 39b85fdf      |   36 | Si       | M    | 2024-03-17 |
|  3 | 39b904e9      |   44 | Si       | H    | 2024-05-29 |
|  4 | 39b97a62      |   51 | No       | H    | 2024-05-29 |
|  5 | 39b9cc47      |  123 | Si       | H    | 2024-05-29 |
|  6 | 39bc8c8e      |   95 | Si       | H    | 2024-12-24 |
|  7 | 39bdc5a6      |   11 | No       | M    | 2024-05-29 |
|  9 | 39beaa07      |  106 | No       | M    | 2024-05-29 |
| 10 | 39bef447      |   44 | Si       | M    | 2024-05-29 |
| 11 | 39c01767      |   97 | Si       | M    | 2024-05-29 |
| 12 | 39c2e76f      |   49 | Si       | H    | 2024-05-29 |
| 13 | 39cc6507      |   92 | No       | M    | 2024-05-29 |
| 14 | 39ccb2e7      |   40 | No       | M    | 2024-05-29 |
| 15 | 39cd08ae      |   64 | No       | M    | 2024-05-29 |
| 16 | 39cee628      |   92 | No       | M    | 2024-05-29 |
| 17 | 39d0dd9d      |    4 | Si       | M    | 2024-05-29 |
| 18 | 39d13e1a      |   27 | Si       | M    | 2024-05-29 |
| 19 | 39d18b8e      |   69 | No       | M    | 2024-05-29 |
| 20 | 39d1eba7      |   74 | Si       | H    | 2024-05-29 |
| 21 | d1226a90      |   38 | Si       | H    | 2024-05-29 |
| 22 | d1232201      |  113 | No       | H    | 2024-05-29 |
| 23 | d1237a4b      |   46 | No       | M    | 2024-05-29 |
| 24 | 41bc1691      |   95 | No       | H    | 2024-05-29 |
| 25 | 41becad0      |  107 | Si       | H    | 2024-05-29 |
+----+---------------+------+----------+------+------------+
```