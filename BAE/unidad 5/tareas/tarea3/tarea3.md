# Tarea 3
## Creación de fichero empleados-dump.sql.
Creamos un fichero nano en el que insertamos la información proporcionada debajo con el siguente comando:
```sql
nano empleados-dump.sql
```
```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento)
VALUES ('Juan', 50000, 'Ventas'),
('María', 60000, 'TI'),
('Carlos', 55000, 'Ventas'),
('Ana', 48000, 'Recursos Humanos'),
('Pedro', 70000, 'TI'),
('Laura', 52000, 'Ventas'),
('Javier', 48000, 'Recursos Humanos'),
('Carmen', 65000, 'TI'),
('Miguel', 51000, 'Ventas'),
('Elena', 55000, 'Recursos Humanos'),
('Diego', 72000, 'TI'),
('Sofía', 49000, 'Ventas'),
('Andrés', 60000, 'Recursos Humanos'),
('Isabel', 53000, 'TI'),
('Raúl', 68000, 'Ventas'),
('Patricia', 47000, 'Recursos Humanos'),
('Alejandro', 71000, 'TI'),
('Natalia', 54000, 'Ventas'),
('Roberto', 49000, 'Recursos Humanos'),
('Beatriz', 63000, 'TI');
```
## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea3.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read empleados-dump.sql
```

## Realización de consultas
### Muestra el nombre de todos los empleados en mayúsculas.
```sql
select upper(nombre) as nombre_mayusculas from empleados;
```
| nombre_mayusculas |
|-------------------|
| JUAN              |
| MARíA             |
| CARLOS            |
| ANA               |
| PEDRO             |
| LAURA             |
| JAVIER            |
| CARMEN            |
| MIGUEL            |
| ELENA             |
| DIEGO             |
| SOFíA             |
| ANDRéS            |
| ISABEL            |
| RAúL              |
| PATRICIA          |
| ALEJANDRO         |
| NATALIA           |
| ROBERTO           |
| BEATRIZ           |

### Calcula el valor absoluto del salario de todos los empleados.
```sql
select nombre, abs(salario) as salario_absoluto from empleados;
```
|  nombre   | salario_absoluto |
|-----------|------------------|
| Juan      | 50000.0          |
| María     | 60000.0          |
| Carlos    | 55000.0          |
| Ana       | 48000.0          |
| Pedro     | 70000.0          |
| Laura     | 52000.0          |
| Javier    | 48000.0          |
| Carmen    | 65000.0          |
| Miguel    | 51000.0          |
| Elena     | 55000.0          |
| Diego     | 72000.0          |
| Sofía     | 49000.0          |
| Andrés    | 60000.0          |
| Isabel    | 53000.0          |
| Raúl      | 68000.0          |
| Patricia  | 47000.0          |
| Alejandro | 71000.0          |
| Natalia   | 54000.0          |
| Roberto   | 49000.0          |
| Beatriz   | 63000.0          |
+-----------+------------------+

### Muestra la fecha actual.
```sql
select current_date as fecha_actual from empleados limit 1;
```
| fecha_actual |
|--------------|
| 2024-01-17   |

### Calcula el promedio de salarios de todos los empleados.
```sql
select avg(salario) as promidio_salario from empleados;
```
| promidio_salario |
|------------------|
| 56666.6666666667 |

### Convierte la cadena '123' a un valor entero.
```sql
select cast('123' as integer) as valor_entero;
```
| valor_entero |
|--------------|
| 123          |

### Concatena el nombre y el departamento de cada empleado.
```sql
select nombre || ' ' || departamento as nombre_departamento from empleados;
```
|    nombre_departamento    |
|---------------------------|
| Juan Ventas               |
| María TI                  |
| Carlos Ventas             |
| Ana Recursos Humanos      |
| Pedro TI                  |
| Laura Ventas              |
| Javier Recursos Humanos   |
| Carmen TI                 |
| Miguel Ventas             |
| Elena Recursos Humanos    |
| Diego TI                  |
| Sofía Ventas              |
| Andrés Recursos Humanos   |
| Isabel TI                 |
| Raúl Ventas               |
| Patricia Recursos Humanos |
| Alejandro TI              |
| Natalia Ventas            |
| Roberto Recursos Humanos  |
| Beatriz TI                |

### Concatena el nombre y el departamento de cada empleado con un guion como separador.
```sql
select nombre || '-' || departamento as nombre_departamento from empleados;
```
|    nombre_departamento    |
|---------------------------|
| Juan-Ventas               |
| María-TI                  |
| Carlos-Ventas             |
| Ana-Recursos Humanos      |
| Pedro-TI                  |
| Laura-Ventas              |
| Javier-Recursos Humanos   |
| Carmen-TI                 |
| Miguel-Ventas             |
| Elena-Recursos Humanos    |
| Diego-TI                  |
| Sofía-Ventas              |
| Andrés-Recursos Humanos   |
| Isabel-TI                 |
| Raúl-Ventas               |
| Patricia-Recursos Humanos |
| Alejandro-TI              |
| Natalia-Ventas            |
| Roberto-Recursos Humanos  |
| Beatriz-TI                |

### Categoriza a los empleados según sus salarios.
```sql
select nombre, salario from empleados order by nombre, salario asc; 
```
|  nombre   | salario |
|-----------|---------|
| Alejandro | 71000.0 |
| Ana       | 48000.0 |
| Andrés    | 60000.0 |
| Beatriz   | 63000.0 |
| Carlos    | 55000.0 |
| Carmen    | 65000.0 |
| Diego     | 72000.0 |
| Elena     | 55000.0 |
| Isabel    | 53000.0 |
| Javier    | 48000.0 |
| Juan      | 50000.0 |
| Laura     | 52000.0 |
| María     | 60000.0 |
| Miguel    | 51000.0 |
| Natalia   | 54000.0 |
| Patricia  | 47000.0 |
| Pedro     | 70000.0 |
| Raúl      | 68000.0 |
| Roberto   | 49000.0 |
| Sofía     | 49000.0 |

### Calcula la suma total de salarios de todos los empleados.
```sql
select sum(salario) as suma_salario from empleados;
```
| suma_salario |
|--------------|
| 1140000.0    |

### Redondea el salario de todos los empleados a dos decimales.
```sql
select round(salario, 2) as redondeo_salario from empleados;
```
| redondeo_salario |
|------------------|
| 50000.0          |
| 60000.0          |
| 55000.0          |
| 48000.0          |
| 70000.0          |
| 52000.0          |
| 48000.0          |
| 65000.0          |
| 51000.0          |
| 55000.0          |
| 72000.0          |
| 49000.0          |
| 60000.0          |
| 53000.0          |
| 68000.0          |
| 47000.0          |
| 71000.0          |
| 54000.0          |
| 49000.0          |
| 63000.0          |

### Muestra la longitud de cada nombre de empleado.
```sql
select nombre, length(nombre) as longitud_nombre from empleados;
```
|  nombre   | longitud_nombre |
|-----------|-----------------|
| Juan      | 4               |
| María     | 5               |
| Carlos    | 6               |
| Ana       | 3               |
| Pedro     | 5               |
| Laura     | 5               |
| Javier    | 6               |
| Carmen    | 6               |
| Miguel    | 6               |
| Elena     | 5               |
| Diego     | 5               |
| Sofía     | 5               |
| Andrés    | 6               |
| Isabel    | 6               |
| Raúl      | 4               |
| Patricia  | 8               |
| Alejandro | 9               |
| Natalia   | 7               |
| Roberto   | 7               |
| Beatriz   | 7               |

### Cuenta el número total de empleados en cada departamento.
```sql
select departamento, count(*) from empleados group by departamento;
```
|   departamento   | count(*) |
|------------------|----------|
| Recursos Humanos | 6        |
| TI               | 7        |
| Ventas           | 7        |

### Muestra la hora actual.
```sql
select current_time;
```
| current_time |
|--------------|
| 19:21:18     |

### Convierte el salario a un valor de punto flotante.
```sql
select nombre, cast(salario as float) as salario_float from empleados;
```
|  nombre   | salario_float |
|-----------|---------------|
| Juan      | 50000.0       |
| María     | 60000.0       |
| Carlos    | 55000.0       |
| Ana       | 48000.0       |
| Pedro     | 70000.0       |
| Laura     | 52000.0       |
| Javier    | 48000.0       |
| Carmen    | 65000.0       |
| Miguel    | 51000.0       |
| Elena     | 55000.0       |
| Diego     | 72000.0       |
| Sofía     | 49000.0       |
| Andrés    | 60000.0       |
| Isabel    | 53000.0       |
| Raúl      | 68000.0       |
| Patricia  | 47000.0       |
| Alejandro | 71000.0       |
| Natalia   | 54000.0       |
| Roberto   | 49000.0       |
| Beatriz   | 63000.0       |

### Muestra los primeros tres caracteres de cada nombre de empleado.
```sql
select nombre, substr(nombre, 1, 3) as sub_nombre from empleados;
```
|  nombre   | sub_nombre |
|-----------|------------|
| Juan      | Jua        |
| María     | Mar        |
| Carlos    | Car        |
| Ana       | Ana        |
| Pedro     | Ped        |
| Laura     | Lau        |
| Javier    | Jav        |
| Carmen    | Car        |
| Miguel    | Mig        |
| Elena     | Ele        |
| Diego     | Die        |
| Sofía     | Sof        |
| Andrés    | And        |
| Isabel    | Isa        |
| Raúl      | Raú        |
| Patricia  | Pat        |
| Alejandro | Ale        |
| Natalia   | Nat        |
| Roberto   | Rob        |
| Beatriz   | Bea        |

## Order By and Like.
### Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
```sql
select nombre, salario from empleados where departamento='Ventas' and salario>52000;
```
| nombre  | salario |
|---------|---------|
| Carlos  | 55000.0 |
| Raúl    | 68000.0 |
| Natalia | 54000.0 |

### Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
```sql
select nombre, salario from empleados where nombre like'%a%' order by salario asc;
```
|  nombre   | salario |
|-----------|---------|
| Patricia  | 47000.0 |
| Ana       | 48000.0 |
| Javier    | 48000.0 |
| Sofía     | 49000.0 |
| Juan      | 50000.0 |
| Laura     | 52000.0 |
| Isabel    | 53000.0 |
| Natalia   | 54000.0 |
| Carlos    | 55000.0 |
| Elena     | 55000.0 |
| María     | 60000.0 |
| Andrés    | 60000.0 |
| Beatriz   | 63000.0 |
| Carmen    | 65000.0 |
| Raúl      | 68000.0 |
| Alejandro | 71000.0 |

### Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
```sql
select nombre, salario from empleados where departamento='Recursos Humanos' and salario between 45000 and 55000;
```
|  nombre  | salario |
|----------|---------|
| Ana      | 48000.0 |
| Javier   | 48000.0 |
| Elena    | 55000.0 |
| Patricia | 47000.0 |
| Roberto  | 49000.0 |

### Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
```sql
select nombre, salario from empleados order by salario desc limit 5;
```
|  nombre   | salario |
|-----------|---------|
| Diego     | 72000.0 |
| Alejandro | 71000.0 |
| Pedro     | 70000.0 |
| Raúl      | 68000.0 |
| Carmen    | 65000.0 |

### Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
```sql
select nombre, salario from empleados where (nombre like 'M%' or nombre like 'N%') and salario > 50000;
```
| nombre  | salario |
|---------|---------|
| María   | 60000.0 |
| Miguel  | 51000.0 |
| Natalia | 54000.0 |

### Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
```sql
select nombre, departamento from empleados where departamento in ('TI', 'Ventas') order by nombre;
```
|  nombre   | departamento |
|-----------|--------------|
| Alejandro | TI           |
| Beatriz   | TI           |
| Carlos    | Ventas       |
| Carmen    | TI           |
| Diego     | TI           |
| Isabel    | TI           |
| Juan      | Ventas       |
| Laura     | Ventas       |
| María     | TI           |
| Miguel    | Ventas       |
| Natalia   | Ventas       |
| Pedro     | TI           |
| Raúl      | Ventas       |
| Sofía     | Ventas       |

### Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
```sql
select distinct (salario) from empleados order by salario asc;
```
| salario |
|---------|
| 47000.0 |
| 48000.0 |
| 49000.0 |
| 50000.0 |
| 51000.0 |
| 52000.0 |
| 53000.0 |
| 54000.0 |
| 55000.0 |
| 60000.0 |
| 63000.0 |
| 65000.0 |
| 68000.0 |
| 70000.0 |
| 71000.0 |
| 72000.0 |

### Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
```sql
select nombre from empleados where (nombre like '%o' or nombre like '%a') and departamento='Ventas';
```
| nombre  |
|---------|
| Laura   |
| Sofía   |
| Natalia |

### Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```sql
select nombre, salario, departamento from empleados where salario not between 55000 and 70000 order by departamento;
```
|  nombre   | salario |   departamento   |
|-----------|---------|------------------|
| Ana       | 48000.0 | Recursos Humanos |
| Javier    | 48000.0 | Recursos Humanos |
| Patricia  | 47000.0 | Recursos Humanos |
| Roberto   | 49000.0 | Recursos Humanos |
| Diego     | 72000.0 | TI               |
| Isabel    | 53000.0 | TI               |
| Alejandro | 71000.0 | TI               |
| Juan      | 50000.0 | Ventas           |
| Laura     | 52000.0 | Ventas           |
| Miguel    | 51000.0 | Ventas           |
| Sofía     | 49000.0 | Ventas           |
| Natalia   | 54000.0 | Ventas           |

### Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
```sql
select nombre from empleados where departamento='Recursos Humanos' and nombre not like '%e';
```
|  nombre  |
|----------|
| Ana      |
| Javier   |
| Elena    |
| Andrés   |
| Patricia |
| Roberto  |
