# Tarea 13
## Lectura del fichero db.
Mediante el siguiente comando entramos en sqlite y a su vez abrimos la base de datos que se nos proporciona:
```sql
sqlite3 universidad.db 
```

## Realización de consultas
![modelo-er](universidad-er.png)

### Consultas de una única tabla
- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql
select apellido1, apellido2, nombre from persona where tipo='alumno' order by apellido1 asc, apellido2 asc, nombre asc;
```
| apellido1 | apellido2 |  nombre  |
|-----------|-----------|----------|
| Domínguez | Guerrero  | Antonio  |
| Gea       | Ruiz      | Sonia    |
| Gutiérrez | López     | Juan     |
| Heller    | Pagac     | Pedro    |
| Herman    | Pacocha   | Daniel   |
| Hernández | Martínez  | Irene    |
| Herzog    | Tremblay  | Ramón    |
| Koss      | Bayer     | José     |
| Lakin     | Yundt     | Inma     |
| Saez      | Vega      | Juan     |
| Strosin   | Turcotte  | Ismael   |
| Sánchez   | Pérez     | Salvador |

- Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql
select distinct nombre, apellido1 ||' '|| apellido2 as apellidos from persona where tipo = 'alumno' and telefono is null;
```
| nombre |    apellidos     |
|--------|------------------|
| Pedro  | Heller Pagac     |
| Ismael | Strosin Turcotte |

- Devuelve el listado de los alumnos que nacieron en 1999.
```sql
select * from persona where tipo='alumno' and fecha_nacimiento regexp '^1999/';
```
| id |    nif    | nombre  | apellido1 | apellido2 | ciudad  |    direccion    | telefono  | fecha_nacimiento | sexo |  tipo  |
|----|-----------|---------|-----------|-----------|---------|-----------------|-----------|------------------|------|--------|
| 7  | 97258166K | Ismael  | Strosin   | Turcotte  | Almería | C/ Neptuno      |           | 1999/05/24       | H    | alumno |
| 22 | 41491230N | Antonio | Domínguez | Guerrero  | Almería | C/ Cabo de Gata | 626652498 | 1999/02/11       | H    | alumno |

- Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql
```
- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql
```

### Consultas multitabla (Join)
- Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
```sql
```
- Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
```sql
```
- Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
```sql
```
- Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
```sql
```
- Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
```sql
```
- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
```sql
```

### Consultas multitabla (Where)
- Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql
```
- Devuelve un listado con los profesores que no están asociados a un departamento.
```sql
```
- Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql
```
- Devuelve un listado con los profesores que no imparten ninguna asignatura.
```sql
```
- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql
```
- Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
```sql
```

### Consultas resúmen (Funciones)
- Devuelve el número total de alumnas que hay.
```sql
```
- Calcula cuántos alumnos nacieron en 1999.
```sql
```
- Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
```sql
```
- Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
```sql
```
- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
```sql
```
- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
```sql
```
- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
```sql
```
- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
```sql
```
- Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
```sql
```

### Subconsultas
- Devuelve todos los datos del alumno más joven.
```sql
```
- Devuelve un listado con los profesores que no están asociados a un departamento.
```sql
```
- Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql
```
- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql
```
- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql
```
- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql
select distinct(id-departamento) from profesor where id-profesor in (select distinct(id-profesor from asignatura));
```
