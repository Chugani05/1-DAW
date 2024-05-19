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
            VALUES (SUBSTRING_INDEX(UUID(), '-', 1), CONCAT(nombre, FLOOR(RAND() * (100 - 1 + 1)) ), FLOOR(RAND() * (salario_max - salario_min + 1)), FLOOR(RAND() * (subsidio_max - subsidio_base + 1)), FLOOR(RAND() * (salud_max - salud_base + 1)), FLOOR(RAND() * (pension_max - pension_base + 1)), FLOOR(RAND() * (bono_max - bono_base + 1)), FLOOR(RAND() * (integral_max - integral_base + 1)));
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
    | 47a5df21 | user99 |      3424.00 |    50.00 | 336.00 |  588.00 | 119.00 |     2.00 |
    | 47aaafd4 | user98 |      5671.00 |   177.00 | 495.00 |  708.00 |  44.00 |    16.00 |
    | 47ad19b2 | user18 |      5376.00 |   244.00 |  27.00 | 1584.00 | 124.00 |    30.00 |
    | 47afd7bf | user20 |      6742.00 |   175.00 | 237.00 |  442.00 | 138.00 |    38.00 |
    | 47b21eb0 | user92 |      6556.00 |    95.00 |  80.00 | 1435.00 |  27.00 |    31.00 |
    | 47b3c962 | user26 |       228.00 |   106.00 | 409.00 |  699.00 | 105.00 |    18.00 |
    | 47b5afcc | user19 |      4793.00 |   122.00 | 145.00 | 1969.00 |  29.00 |     1.00 |
    | 47b73961 | user58 |      6473.00 |    89.00 |  33.00 |  774.00 | 116.00 |    27.00 |
    | 47b8c59b | user10 |      3665.00 |   297.00 | 345.00 | 1809.00 | 120.00 |    11.00 |
    | 47ba33bc | user98 |       685.00 |   145.00 |  91.00 |  636.00 |  19.00 |    28.00 |
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
        UPDATE persona SET subsidio = subsidio_nuevo WHERE id = id_persona;
        RETURN subsidio_nuevo;
    END //
    DELIMITER ;
    ``` 

    ```sql
    -- Realizamos la llamada a la función:
    call subsidio_transporte(47ad19b2, 7);

    -- Salida:

    ```

    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    ```sql

    ``` 

    ```sql
    -- Realizamos la llamada a la función:
    call salud(47ad19b2, 4);

    -- Salida:

    ```

    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    ```sql
    
    ``` 

    ```sql
    -- Realizamos la llamada a la función:
    call pension(47ad19b2, 4);

    -- Salida:

    ```

    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 
    ```sql
    
    ``` 

    ```sql
    -- Realizamos la llamada a la función:
    call bono(47ad19b2, 8);

    -- Salida:

    ```

    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.
    ```sql
    
    ``` 

    ```sql
    -- Realizamos la llamada a la función:
    call integral(47ad19b2, );

    -- Salida:

    ``` 

___Crea cada uno de las funciones anteriores para una persona en específico___.

El parámetro de entrada debe de ser un identificar de la persona. 