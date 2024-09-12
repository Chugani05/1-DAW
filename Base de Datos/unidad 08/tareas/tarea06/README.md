# Tarea 7
## ¿El salario?

### Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:
- Salario base.
- Base reguladora.
- Salario bruto.
- Salario neto.
- Etc.

### Teniendo en cuenta esta información se pide:
- Crea una base datos llamada __salario__.
```sql
-- Creamos la base de datos:
DROP DATABASE IF EXISTS salario;
CREATE DATABASE salario;

-- Accedemos a la base de datos:
USE salario;
```

- Crea una tabla llamada persona con los siguientes campos:
    - Identificador. (Texto)__(PK)__.
    - Nombre (Texto).
    - Salario_min. (__Escoge el tipo de dato__).
    - Subsidio(__Escoge el tipo de dato__).
    - Salud(__Escoge el tipo de dato__).
    - Pensión(__Escoge el tipo de dato__).
    - Bono(__Escoge el tipo de dato__).
    - Integral(__Escoge el tipo de dato__).

```sql
-- Creamos la tabla persona:
DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
    id VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    salario_base DECIMAL(10, 2),
    subsidio DECIMAL(10, 2),
    salud DECIMAL(10, 2),
    pension DECIMAL(10, 2),
    bono DECIMAL(10, 2),
    integral DECIMAL(10, 2)
);
```

- Creación de un __procedimiento__ de forma aleatoria con las siguientes características:
    - Parámetro de entrada el número de registros (_Mínimo 10, y realiza la prueba varias veces_).
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

    ```sql
    -- Realizamos la llamada al procedimiento:
    call creando_personas(10, 'user', 2000, 10000, 200, 500, 600, 1200, 1500, 3500, 50, 200, 10, 50);

    -- Salida:
    +----------+--------+--------------+----------+--------+---------+--------+----------+
    | id       | nombre | salario_base | subsidio | salud  | pension | bono   | integral |
    +----------+--------+--------------+----------+--------+---------+--------+----------+
    | 7a778dda | user32 |      6560.00 |    40.00 | 129.00 | 1343.00 | 107.00 |    22.00 |
    | 7a7cb65c | user57 |      2001.00 |   158.00 | 527.00 | 1627.00 |  65.00 |    29.00 |
    | 7a7f2464 | user31 |      3195.00 |    17.00 |  53.00 |  551.00 |  16.00 |    29.00 |
    | 7a822714 | user28 |      1993.00 |   119.00 | 138.00 | 1929.00 |  19.00 |    31.00 |
    | 7a8426b7 | user42 |      6611.00 |   259.00 | 498.00 | 1126.00 |  49.00 |    38.00 |
    | 7a85cd5b | user72 |      6273.00 |   228.00 | 266.00 | 1873.00 |  53.00 |    39.00 |
    | 7a87a00e | user73 |      6265.00 |   216.00 | 151.00 |  204.00 | 113.00 |    18.00 |
    | 7a89975b | user4  |      6586.00 |   299.00 | 299.00 | 1023.00 |   9.00 |    31.00 |
    | 7a8b7a70 | user71 |      1758.00 |   289.00 |  91.00 | 1750.00 | 138.00 |    39.00 |
    | 7a8d0925 | user6  |      3616.00 |    15.00 | 545.00 |  755.00 |  25.00 |    28.00 |
    +----------+--------+--------------+----------+--------+---------+--------+----------+
    ``` 

- Cree una función para cada punto teniendo en cuenta que:
    - Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.
    ```sql
    DELIMITER //
    DROP FUNCTION IF EXISTS subsidio_transporte;
    CREATE FUNCTION subsidio_transporte(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
    BEGIN
        DECLARE subsidio_actual DECIMAL(10, 2);
        DECLARE subsidio_nuevo DECIMAL(10, 2);

        SELECT subsidio INTO subsidio_actual FROM persona WHERE id = id_persona;
        SET subsidio_nuevo = subsidio_actual + (subsidio_actual * (porcentaje / 100));
        RETURN subsidio_nuevo;
    END //
    DELIMITER ;
    ``` 

    ```sql
    -- Comprobamos que la función funcione mediante:
    select subsidio_transporte('7a7cb65c', 7);

    -- Salida:
    +------------------------------------+
    | subsidio_transporte('7a7cb65c', 7) |
    +------------------------------------+
    |                             169.06 |
    +------------------------------------+
    ```

    ```sql
    DELIMITER //
    DROP PROCEDURE IF EXISTS actualizar_subsidio;
    CREATE PROCEDURE actualizar_subsidio(id_persona VARCHAR(100), porcentaje INT)
    BEGIN
        DECLARE subsidio_actual DECIMAL(10, 2);
        DECLARE subsidio_nuevo DECIMAL(10, 2);

        SELECT subsidio INTO subsidio_actual FROM persona WHERE id = id_persona;
        SET subsidio_nuevo = subsidio_transporte(id_persona, porcentaje);
        UPDATE persona SET subsidio = subsidio_nuevo WHERE id = id_persona;
    END //
    DELIMITER ;
    ```
        
    ```sql
    -- Realicemos la llamada al procedimiento:
    call actualizar_subsidio('7a7cb65c', 7);

    -- Salida: 
    select * from persona;
    +----------+--------+--------------+----------+--------+---------+--------+----------+
    | id       | nombre | salario_base | subsidio | salud  | pension | bono   | integral |
    +----------+--------+--------------+----------+--------+---------+--------+----------+
    | 7a778dda | user32 |      6560.00 |    40.00 | 129.00 | 1343.00 | 107.00 |    22.00 |
    | 7a7cb65c | user57 |      2001.00 |   169.06 | 527.00 | 1627.00 |  65.00 |    29.00 |
    | 7a7f2464 | user31 |      3195.00 |    17.00 |  53.00 |  551.00 |  16.00 |    29.00 |
    | 7a822714 | user28 |      1993.00 |   119.00 | 138.00 | 1929.00 |  19.00 |    31.00 |
    | 7a8426b7 | user42 |      6611.00 |   259.00 | 498.00 | 1126.00 |  49.00 |    38.00 |
    | 7a85cd5b | user72 |      6273.00 |   228.00 | 266.00 | 1873.00 |  53.00 |    39.00 |
    | 7a87a00e | user73 |      6265.00 |   216.00 | 151.00 |  204.00 | 113.00 |    18.00 |
    | 7a89975b | user4  |      6586.00 |   299.00 | 299.00 | 1023.00 |   9.00 |    31.00 |
    | 7a8b7a70 | user71 |      1758.00 |   289.00 |  91.00 | 1750.00 | 138.00 |    39.00 |
    | 7a8d0925 | user6  |      3616.00 |    15.00 | 545.00 |  755.00 |  25.00 |    28.00 |
    +----------+--------+--------------+----------+--------+---------+--------+----------+
    ```
    

    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    ```sql
    DELIMITER //
    DROP FUNCTION IF EXISTS salud;
    CREATE FUNCTION salud(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
    BEGIN
        DECLARE salud_actual DECIMAL(10, 2);
        DECLARE salud_nuevo DECIMAL(10, 2);

        SELECT salud INTO salud_actual FROM persona WHERE id = id_persona;
        SET salud_nuevo = salud_actual + (salud_actual * (porcentaje / 100));
        UPDATE persona SET salud = salud_nuevo WHERE id = id_persona;
        RETURN salud_nuevo;
    END //
    DELIMITER ;
    ``` 

    ```sql
    -- Comprobamos que la función funcione mediante:
    select salud('47ad19b2', 4);
    
    -- Salida:
    +----------------------+
    | salud('47ad19b2', 4) |
    +----------------------+
    |                28.08 |
    +----------------------+
    ```

    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    ```sql
    DELIMITER //
    DROP FUNCTION IF EXISTS pension;
    CREATE FUNCTION pension(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
    BEGIN
        DECLARE pension_actual DECIMAL(10, 2);
        DECLARE pension_nuevo DECIMAL(10, 2);

        SELECT pension INTO pension_actual FROM persona WHERE id = id_persona;
        SET pension_nuevo = pension_actual + (pension_actual * (porcentaje / 100));
        UPDATE persona SET pension = pension_nuevo WHERE id = id_persona;
        RETURN pension_nuevo;
    END //
    DELIMITER ;
    ``` 

    ```sql
    -- Comprobamos que la función funcione mediante:
    select pension('47ad19b2', 4);

    -- Salida:
    +------------------------+
    | pension('47ad19b2', 4) |
    +------------------------+
    |                1647.36 |
    +------------------------+
    ```

    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 
    ```sql
    DELIMITER //
    DROP FUNCTION IF EXISTS bono;
    CREATE FUNCTION bono(id_persona VARCHAR(100), porcentaje INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
    BEGIN
        DECLARE bono_actual DECIMAL(10, 2);
        DECLARE bono_nuevo DECIMAL(10, 2);

        SELECT bono INTO bono_actual FROM persona WHERE id = id_persona;
        SET bono_nuevo = bono_actual + (bono_actual * (porcentaje / 100));
        UPDATE persona SET bono = bono_nuevo WHERE id = id_persona;
        RETURN bono_nuevo;
    END //
    DELIMITER ;
    ``` 

    ```sql
    -- Comprobamos que la función funcione mediante:
    select bono('47ad19b2', 8);

    -- Salida:
    +---------------------+
    | bono('47ad19b2', 8) |
    +---------------------+
    |              133.92 |
    +---------------------+
    ```

    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.
    ```sql
    DELIMITER //
    DROP FUNCTION IF EXISTS integral;
    CREATE FUNCTION integral(id_persona VARCHAR(100)) RETURNS DECIMAL(10, 2) DETERMINISTIC
    BEGIN
        DECLARE psalario DECIMAL(10, 2);
        DECLARE psubsidio DECIMAL(10, 2);
        DECLARE psalud DECIMAL(10, 2);
        DECLARE ppension DECIMAL(10, 2);
        DECLARE pbono DECIMAL(10, 2);
        DECLARE integral_nuevo DECIMAL(10, 2);
    
        SELECT salario_base, subsidio, salud, pension, bono INTO psalario, psubsidio, psalud, ppension, pbono FROM persona WHERE id = id_persona;
        SET integral_nuevo = psalario - psalud - ppension + psubsidio + pbono;
        UPDATE persona SET integral = integral_nuevo WHERE id = id_persona;
        RETURN integral_nuevo;
    END //
    DELIMITER ;
    ``` 

    ```sql
    -- Comprobamos que la función funcione mediante:
    select integral('47ad19b2');

    -- Salida:
    +----------------------+
    | integral('47ad19b2') |
    +----------------------+
    |              4095.56 |
    +----------------------+
    ``` 

___Crea cada uno de las funciones anteriores para una persona en específico___.

El parámetro de entrada debe de ser un identificar de la persona. 