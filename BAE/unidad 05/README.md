# Unidad 5 - Bases de datos relacionales (SQLITE)
## Para crear una base de datos
```sql
sqlite3 tarea.db
```

## Importar archivo .sql
```sql
sqlite3 tarea.db
.read fihero.sql
```

## Exportar la bbdd a un fichero .sql
```sql
.output fichero.sql
.dump
.exit 
```

## Lectura del fichero .db
```sql
sqlite3 tarea10.db 
.open chinook.db
```

## Tipos de datos
| Tipo de dato  | Descripción  |
|---|---|
| Text  | Se usa para almacenar cadenas de caracteres.  |
| Integer  | se usa para guardar valores numéricos enteros.  |
| Real  | Se usa para almacenar valores numéricos con decimales. Se utiliza como separador el punto (.). Definimos campos de este tipo para precios, por ejemplo.  |
| Blob  | Se usa para almacenar valores en formato binario (imágenes, archivos de sonido etc.)  |

## Comandos meta
| Comando  | Descripción  | Manera de uso  |
|---|---|---|
| .show | Muestra los valores actuales de varios parámetros | |
| .databases | Proporciona nombres de bases de datos y archivos | |
| .quit | Salir del programa sqlite3 | |
| .tables | Mostrar tablas actuales | |
| .schema | Pantalla de esquema de la tabla | |
| .header | Mostrar u ocultar el encabezado de la tabla de salida | |
| .dump | Base de datos de volcado en formato de texto SQL | |
| .mode | Elecciona el modo de la tabla de salida | .mode table  |
|  |  | .mode box  |
|  |  | .mode markdown  |

## Comandos estándar
| Comando  | Descripción  | Manera de uso  |
|---|---|---|
| `ALTER`  | Añade o elimina objetos de la tabla  | ALTER TABLE comments ADD COLUMN username TEXT; |
|  |  | ALTER TABLE comments RENAME to Coms;  |
| `DROP`  | Elimina la tabla  | DROP TABLE if exists Coments;  |
| `TRUNCATE`  | Elimina TODOS los datos de la tabla  |  |
| `CREATE`  |  | CREATE TABLE usuario ( nombre text, clave text); |
| `INSERT`  |  | INSERT INTO usuario (nombre, clave) VALUES ('Pedro Perez','pedrito'); |
| `UPDATE`  | actualizar o modificar valores | UPDATE usuario SET nombre='Marceloduarte', clave='Marce' WHERE nombre='Marcelo'; |
| `DELETE`  | Elimina información que cumpla con la condición que pongamos |  DELETE FROM usuario WHERE nombre='Marcelo'; |
| `SELECT`  | muestra la info que le pidamos (\* para mostrar todo) | SELECT nombre, clave FROM usuario; |
|  |  | SELECT * FROM usuario; |

## Comandos
| Comando  | Descripción  | Manera de uso  |
|---|---|---|
| `WHERE`  | añadir una condición al select para especificar consulta | SELECT nombre, clave FROM usuario WHERE clave='predrito';  |
| `AS`  | Se usa para dar seudónimo a las tablas  | SELECT * FROM ejemplo AS e, ejemplo2 AS e2;  |
| `ORDER BY`  | Ordena el resultado de select, puede indicarse valor ascendente, descendente por valor calculado o expresiones | SELECT codigo, titulo, autor, editorial, precio FROM libro ORDER BY titulo ASC; |
| | | SELECT codigo,titulo,autor,editorial,precio FROM libro ORDER BY editorial DESC;  |
| | | SELECT titulo, autor, editorial, precio+(precio*0.1) AS preciocondescuento FROM libro ORDER BY preciocondescuento;  |

## Operadores relacionales
| Operador | Descripción |
|---|---|
| =	| igual |
| <> | distinto | 
| >	| mayor | 
| <	| menor |
| >= | mayor o igual |
| <= | menor o igual |

### Comentarios
```sql
/*comentario de más
de una línea */

--comentario de una línea
```


#### Se usa **NULL / NOT NULL** para indicar si valor es necesario que esté relleno o null si no hay info, por ej:

No hay información sobre precio el libro

```sql
insert into libro (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);
```

Se puede realizar búsqueda con ese parámetro:

```sql
 select * from libro
  where editorial is null;
```

- La PRIMARY KEY puede ser simple o compuesta, por ej:

```sql
 create table inscrito(
  documento text,
  deporte text,
  año integer,
  nombre text,
  matricula text,
  primary key(documento,deporte,año)
 );
```



- **FOREIGN KEY** si se trata de una tabla intermedia, se tiene que referencial el id de la tabla a la que hace referencia:

```sql
create table editorial(
	codigo integer primary key,
	nombre text
);

create table libro(
	codigo integer primary key,
	titulo text,
	autor text,
	precio real,
	codigo_editorial integer	references editorial(codigo)
);
```

## OPERACIONES ARITMÉTICAS en las consultas

Para que nos devuelva el precio con un 10% de descuento:

```sql
select titulo, precio,precio*0.1,precio-(precio*0.1)
  from libro;
```

o lo actualice:

```sql
update libro set precio=precio-(precio*0.1);
```

o concaternar:

```sql
 select titulo||'-'||autor||'-'||editorial
  from libro;
```

- Poner **valor por defecto** con default

```sql
create table libro(
	codigo integer primary key,
	titulo text,
	autor text not null default 'desconocido',
	editorial text,
	precio real,
	cantidad integer default 0
 );
```

## Creación de tablas
```sql
CREATE TABLE comments (
    post_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    website_url TEXT NULL,
    comment TEXT NOT NULL
 );
```

## Inserción de valores
```sql
INSERT INTO comments (name, email, website_url, comment) 
VALUES ('Kai', 'kai97rg@gmail.com', 'ghustky.com', 'estoy cansado'),
('Rashi', 'chugani205gmail.com', 'booklover.com', 'tengo sueño');
```





```

#### Operadores Lógicos (and, or, not, ())

Combinan condiciones

```sql
select * from libro
  where autor='Borges' and
        precio<=20;
```

```sql
select * from libro
  where (autor='Borges' or editorial='Paidos') and
        (precio<20);
```
- `between` trabajar con intervalos de valores

```sql
select * from libro
  where precio between 20 and 40;
```

```sql
select * from libro
  where precio not between 20 and 35;
```
- `in` averiguar si un valor está incluído o no en la lista de valores

```sql
 select * from libro
  where autor in('Borges','Paenza');
```

```sql
 select * from libro
  where autor not in ('Borges','Paenza');
```

- `like` en lugar de usar =, se puede usar like para ser más específicos y buscar por letras concretas

```sql
 select * from libro
  where autor like '%Borges%';
```
Que empiecen por m:
```sql
 select * from libro
  where titulo like 'M%';
```
Que acaben por m:
```sql
 select * from libro
  where titulo like '%m';
```
Que no contengan m:
```sql
 select * from libro
  where titulo not like '%m%';
```

- `count` calcula la cantidad de cualquier tipo de dato

```sql
 select count(*)
  from libro
  where editorial='Planeta';
```

```sql
 select count(precio)
  from libro;
```

- `sum` sumar elementos
```sql
 select sum(cantidad)
  from libro;
```
- `avg` calcular la media
```sql
 select avg(precio)
  from libro
  where titulo like '%PHP%';
```
- `min` calcular el valor mínimo
```sql
 select min(precio)
  from libro;
```

- `max`calcular el valor máximo
```sql
 select max(precio)
  from libro;
```
- `group by` agrupa registros para consultas detalladas.Por ej ver la cantidad de libros de cada editorial:

```sql
 select editorial, count(*)
  from libro
  group by editorial;
```
Total del dinero por editorial:
```sql
 select editorial, sum(precio)
  from libro
  group by editorial;
```
Saber el valor mín y máx de la editorial:
```sql
 select editorial,
  max(precio) as mayor,
  min(precio) as menor
  from libro
  group by editorial;
```
La media por editorial:
```sql
 select editorial, avg(precio)
  from libro
  group by editorial;
```
- `having ?` permite seleccionar (o rechazar) un grupo de registros.

```sql
  select editorial, count(*) from libro
  group by editorial
  having count(*)>2;
```

```sql
 select editorial, avg(precio) from libro
  group by editorial
  having avg(precio)>25;
```

```sql
 select editorial, count(*) from libro
  group by editorial
  having editorial<>'Planeta';
```
```sql
 select editorial, avg(precio) from libro
  group by editorial
  having count(*) > 2; 
```
```sql
 select editorial, max(precio) as mayor
  from libro
  group by editorial
  having min(precio)<100 and
  min(precio)>30
  order by editorial; 
```

- `regexp o not regexp` busca patrones de modo similar a like y not like.
```sql
 select titulo,autor from libro
  where autor regexp '[Hkw]';  
```
```sql
 select autor from libro
  where autor regexp '[a-d]';  
```
```sql
 select titulo from libro
  where titulo regexp '^A';  
```
```sql
select titulo from libro
  where titulo regexp 'HP$';  
```
Que no tengan h, k o w:

```sql
 select autor from libro
  where autor not regexp '[Hkw]'; 
```


- `distinct` se especifica que los registros con ciertos datos duplicados sean obviadas en el resultado.

```sql
 select distinct autor from libro;
```
es como poner:
```sql
 select autor from libro
  group by autor;
```
Contar distintos autores por editorial: 

```sql
 select editorial, count(distinct autor)
  from libro
  group by editorial;
```

```sql
 select distinct titulo,editorial
  from libro
  order by titulo;
```  
```sql
select id_producto from ventas as v where count(distinct(v.fecha)>1
```

#### Consultas de select con otro select
Seleccionar producto con precio igual a la media:

```sql
select p.nombre from productos where p.precio = (select avg(precio) as media from producto)
```
```sql
select p.precio<>(select avg(precio) as media from producto)
```
### Unir tablas 
- where x.id = y.id
```sql
select p.nombre, v.precio from productos as p, ventas as v where p.id = v.id_producto;
```


## Funciones básicas en SQL
- `UPPER y LOWER` para mayúsculas o minúsculas
```sql
SELECT UPPER(nombre) AS nombre_mayusculas, LOWER(nombre) AS nombre_minusculas FROM empleados;
```
- `ROUND` redondear

A dos decimales:
```sql
SELECT nombre, apellido, ROUND(salario, 2) AS salario_redondeado FROM empleados;
```

- `CURRENT DATA` fecha actual
```sql
SELECT CURRENT_DATE AS fecha_actual FROM empleados LIMIT 1;
```
- `Cast` Convierte una expresión a un tipo de datos específico.
```sql
SELECT nombre, apellido, CAST(salario AS INTEGER) AS salario_entero FROM empleados;
```
- `length` Devuelve la longitud de la cadena.
```sql
SELECT title,
       length(title) 
  FROM albums
 ORDER BY length(title) DESC;
```

| Categoría                   | Función                           | Descripción                                               |
|-----------------------------|-----------------------------------|-----------------------------------------------------------|
| **Funciones de Texto**      | `LENGTH(str)`                     | Devuelve la longitud de la cadena.                         |
|                             | `SUBSTR(str, start, length)`       | Devuelve una subcadena de la cadena dada.                 |
|                             | `UPPER(str)`, `LOWER(str)`         | Convierte la cadena a mayúsculas o minúsculas.            |
| **Funciones Numéricas**     | `ABS(x)`                          | Devuelve el valor absoluto de x.                           |
|                             | `ROUND(x)`, `CEIL(x)`, `FLOOR(x)` | Redondeo de números.                                      |
|                             | `MAX(x, y, ...)`, `MIN(x, y, ...)` | Devuelve el valor máximo o mínimo entre los argumentos.   |
| **Funciones de Fecha y Hora**| `CURRENT_DATE`, `CURRENT_TIME`, `CURRENT_TIMESTAMP` | Devuelven la fecha, la hora o la marca de tiempo actuales. |
|                             | `DATE(str)`, `TIME(str)`, `DATETIME(str)` | Extraen partes de una fecha o marca de tiempo.             |
| **Funciones de Agregación**  | `SUM(column)`, `AVG(column)`      | Realizan operaciones de suma y promedio en una columna.    |
|                             | `COUNT(column)`, `MAX(column)`, `MIN(column)` | Realizan operaciones de conteo, máximo y mínimo en una columna. |
| **Funciones de Conversión**  | `CAST(expr AS type)`              | Convierte una expresión a un tipo de datos específico.    |
| **Funciones de Manipulación de Cadenas** | `CONCAT(str1, str2, ...)`  | Concatena cadenas.                                        |
| **Funciones de Control de Flujo** | `CASE WHEN condition THEN result END` | Realiza evaluaciones condicionales.                       |

- Case
```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
```

