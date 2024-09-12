-- 0. Realiza la definición de la BBDD:

```sql
CREATE TABLE clase (
    id INTEGER PRIMARY KEY,
    max_alumnos INTEGER
);

CREATE TABLE alumno (
    dni TEXT PRIMARY KEY,
    nombre TEXT,
    apellido TEXT,
    nota INTEGER,
    id_clase INTEGER,
    FOREIGN KEY (id_clase) REFERENCES clase(id)
);
```
/**
Estas sentencias crean dos tablas: clase y alumno. 
La tabla clase tiene dos columnas: id (clave primaria) y max_alumnos.
 La tabla alumno tiene cinco columnas: dni (clave primaria), nombre, apellido, nota e id_clase (clave foránea que hace referencia a la tabla clase).
**/

-- 1. Realiza la inserción de, al menos, 2 alumnos.

```sql
INSERT INTO alumno (dni, nombre, apellido, nota, id_clase) VALUES
('123456789A', 'Juan', 'Martínez', 85, 10),
('987654321B', 'Ana', 'Pérez', 75, 8);
```

-- 2. Obtener los apellidos de los alumnos.

```sql
SELECT apellido FROM alumno;
```

-- 3. Obtener los apellidos de los alumnos sin repeticiones.

```sql
SELECT DISTINCT apellido FROM alumno;
```

-- 4. Obtener todos los datos de los alumnos que se apellidan Martínez.

```sql
SELECT * FROM alumno WHERE apellido = 'Martínez';
```

-- 5. Obtener todos los datos de los alumnos que se apellidan Martínez y los que se apellidan Pérez.

```sql
SELECT * FROM alumno WHERE apellido IN ('Martínez', 'Pérez');

-- Otra solución

SELECT * FROM alumno WHERE apellido='Martínez' or  apellido='Pérez';
```

-- 6. Obtener todos los datos de los alumnos que asisten a la clase 10.

```sql
SELECT * FROM alumno WHERE id_clase = 10;
```

-- 7. Obtener todos los datos de los alumnos que asisten a la clase 8 y para el clase 5.

```sql
SELECT * FROM alumno WHERE id_clase IN (8, 5);

-- Otra solución (ver consulta 5)
```

-- 8. Obtener todos los datos de los alumnos cuyo apellido comience por P.

```sql
SELECT * FROM alumno WHERE apellido LIKE 'P%';
```

-- 9. Obtener el número máximo de alumnos en todas las clases.

```sql
SELECT MAX(max_alumnos) FROM clase;
```

-- 10. Obtener el número de alumnos en cada clase.

```sql
SELECT id_clase, COUNT(*) AS cantidad_alumnos FROM alumno GROUP BY id_clase;
```

-- 11. Obtener un listado completo de alumnos, incluyendo los datos de su clase a la que asisten.

```sql
SELECT alumno.*, clase.max_alumnos FROM alumno as a, clase as c where a.id_clase = c.id;

-- Nota: el id_clase lo saco de los alumnos.
-- Nota2: Si esta correcta la consulta no es necesario el id de clase
```

-- 12. Muestra todos los alumnos ordenando por nombre de forma descendiente y por nota de forma ascendente .

```sql
SELECT * FROM alumno ORDER BY nombre DESC, nota ASC;
```

-- 13. Obtener los nombres y apellido de los alumnos que asisten a la clase 4 y cuyo máximo de alumnos es mayor 10.

```sql
SELECT a.nombre, a.apellido FROM alumno as a, clase as c where a.id_clase = c.id
AND a.id_clase = 4 AND c.max_alumnos > 10;

-- Retorna vacio porque no hay id_clase 4

```

-- 14. Obtener los datos de los clases cuyo número de alumnos es superior a la media de todos los clases.

```sql

-- Primera parte de la consulta: (Tengo que conocer la media de los alumnos por clase).
SELECT AVG(max_alumnos) FROM clase;

-- Segunda parte de la consulta: (Obtener los datos de los clases cuyo número de alumnos es superior a la media)

-- select c.* FROM clase as c where c.max_alumnos > ?

-- Unimos ambas consultas:
select c.* FROM clase as c where c.max_alumnos >
(select AVG(max_alumnos) FROM clase);
```

-- 15. Obtener los id (únicamente los id) de los clases que tiene más de dos alumnos.

```sql
SELECT id_clase FROM alumno
    GROUP BY id_clase
    HAVING COUNT(*) > 2;

-- Otra forma
-- Primera parte (Obtengo el id_clase y el numero)   
SELECT id_clase, count(id_clase) as numero FROM alumno
    GROUP BY id_clase;

-- Segunda parte
SELECT id_clase from (SELECT id_clase, count(id_clase) as numero FROM alumno
    GROUP BY id_clase) where numero > 2;
```

-- 16. Añadir un nuevo clase, con un número máximo de alumnos es 20.

```sql
INSERT INTO clase (max_alumnos) VALUES (20);
```

-- 17. Añadir dos nuevos alumnos vinculando a la clase creada.

```sql
INSERT INTO alumno (dni, nombre, apellido, nota, id_clase) VALUES
('111111111C', 'Carlos', 'Gómez', 70, (SELECT id FROM clase WHERE max_alumnos = 20)),
('222222222D', 'Laura', 'Sánchez', 85, (SELECT id FROM clase WHERE max_alumnos = 20));

-- ó
SELECT * from clase;

INSERT INTO alumno (dni, nombre, apellido, nota, id_clase) VALUES
('111111111C', 'Carlos', 'Gómez', 70, 4),
('222222222D', 'Laura', 'Sánchez', 85, 4);
```

-- 18. Calcula el 10% de los alumnos por clase.

```sql
SELECT id_clase, COUNT(*) * 0.1 AS porcentaje FROM alumno GROUP BY id_clase;
```

-- 19. Elimina a todos los alumnos que asisten a la clase con id 2.

```sql
DELETE FROM alumno WHERE id_clase = 2;
```

-- 20. Elimina a todos los alumnos cuyo nota sea inferior al 30%.

```sql
-- Realizamos la consulta por partes:
-- select * from alumno;
-- select sum(nota) from alumno;
-- 30% de la nota (select avg(nota)*0.3 as Treinta_Por_Ciento from alumno;)
-- que es lo mismo que:
-- select (sum(nota)*0.3)/count(*) as Treinta_Por_Ciento from alumno;
-- Alumnos que cumplen la condicion 
--select * from alumno as a where a.nota < (select avg(nota)*0.3 as nota from alumno);
```