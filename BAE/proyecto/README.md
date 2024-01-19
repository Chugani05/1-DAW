<div align="justify";>




# Proyecto BBDD 1ºDAW


![basedatos](https://www.shortcuts.es/wp-content/uploads/2018/02/imagen-shortctus-4.png)

## Índice
- [Modelo Entidad Relación](https://github.com/toninavhd/ProyectoBBDD/blob/main/modelo-er/images/diagramaER.drawio.png)
- [Modelo Relacional](https://github.com/toninavhd/ProyectoBBDD/blob/main/modelo-mr/imagenes/ModeloRelacional.png)
- [Normalización](https://github.com/toninavhd/ProyectoBBDD/blob/main/normalizaci%C3%B3n/images/Normalizaci%C3%B3n.png)


## Descripción.
En este proyecto se nos pide realizar una base de datos de una universidad.


Para la creación de una base de datos eficiente es necesario pasar por una serie de procesos que eliminen las anomalías de la misma.
Este proceso se le llama *normalización* y lo veremos en detalle más adelante.


Primero realizaremos un diagrama *Entidad-Relación*.

## Diagrama Entidad-Relacion.

Como su propio nombre indica en este diagrama se deberá representar las entidades de nuestra Base de Datos y la relación establecida entre ellas así como sus atributos relacionados.
Una vez tengamos ordenados los datos procedemos a crear el *Modelo Relacional*.

[*Entidad-Relacion*](https://github.com/toninavhd/ProyectoBBDD/blob/main/modelo-er/images/diagramaER.drawio.png)

## Modelo Relacional.


<img src="https://www.cysae.com/wp-content/uploads/2019/02/database-schema-1895779_1280.png" alt="drawing" width="300"/>


Este modelo a diferencia del anterior organiza las relaciones entre las entidades en forma de tablas divididas en campos y en columnas(tuplas)
.Cada fila representa un conjunto de datos relacionados entre sí. 

Dichos valores pueden referirse a un conjunto de hechos que describen a una entidad o bien a un vínculo entre entidades. Las columnas representan las variables de cada una de las filas de la tabla como el DNI y el Nombre que describirán las características de las entidades.

>El *modelo relacional* es una forma intuitiva y directa de representar la información sin Jerarquizarla.

[*Modelo Relacional*](https://github.com/toninavhd/ProyectoBBDD/blob/main/modelo-mr/imagenes/ModeloRelacional.png)

## Normalización.

Una vez llegados a este punto procederemos a organizar los datos de forma que eliminemos la *redundancia* y las anomalías de inserción, eliminación y actualización. A este proceso se le llama *Normalización*

Para ello debemos crear nuevas tablas y establecer relaciones entre ellas siguiendo una serie de reglas creadas no solo para proteger los datos, si no también para hacer que nuestra Base de Datos sea más flexible al eliminar las redundancias y las incoherencias.

 A estas reglas se las conoce como formas normales. Puede haber distintos niveles de Formas Normales según la calidad de los datos obtenidos anteriormente:

*Primera forma normal (1FN):*

- Cada celda no debe contener más de un valor (Valores atómicos).
- Debe haber una clave primaria para la identificación.
- Sin filas o columnas duplicadas.
- Cada columna debe tener solamente un valor por cada fila.

*Segunda forma Normal (2FN):*

- La 1NF solamente elimina los grupos repetitivos, no la redundancia. Por eso hay 2NF.
- Una tabla se dice que está en 2NF si cumple el siguiente criterio:
ya está en 1NF.
- No tiene dependencia parcial. Es decir, todos los atributos no claves son totalmente dependientes de la clave primaria.

Cuando una tabla está en 2NF, elimina los grupos repetitivos y la redundancia, pero no elimina la dependencia parcial transitiva.

Esto significa que un atributo no principal (un atributo que no forma parte de la clave del candidato) es dependiente de otro atributo no principal. Esto es lo que la *tercera forma normal (3NF)* elimina.

Así que, para que una tabla esté en *tercera forma normal* , debe:

- Estar en 2NF.
- No tiene dependencia parcial transitiva.

[*Normalización*](https://github.com/toninavhd/ProyectoBBDD/blob/main/normalizaci%C3%B3n/images/Normalizaci%C3%B3n.png)

Una vez llegados a este punto nuestra Base de Datos estará normalizada. Asi mismo en otro caso, si estos procesos no han sido suficientes, podría necestar de algun proceso mas de normalización ya que también existen la *cuarta forma normal* y la *quinta forma normal* pero en este caso no han sido necesarias.

## SQL
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/SQLite370.svg/2560px-SQLite370.svg.png" alt="sqlite" width="200"/>

 Como motor de nuestra base de datos utilizaremos SQLite3.
 SQLite es un sistema de gestión de bases de datos relacional que nos permite crear entradas y añadir la información necesaria para crear una Base de datos.

### Creación de tablas
 Primero empezaremos creando una tabla con los siguientes comandos:
 ```sql
 create table nombre_de_la_tabla(

 );
 ```

En esta tabla añadimos información colocando el tipo ( entero, texto...) dentro de los paréntesis. Debemos indicar el tipo de dato(entero, texto, ...) tras el nombre de la columna como se muestra a continuación en la creación de las tablas.

```sql
create table generos (
    ID integer not null primary key autoincrement,
    nombre text not null
);
create table libros (
    ID integer not null primary key autoincrement,
    titulos text not null
);
create table generos_libros (
    ID_genero integer	references generos(ID),
    ID_libro integer	references libros(ID)
);
create table empleados_administrativos (
    ID integer not null primary key autoincrement,
    nombre text not null
);
create table departamentos (
    ID integer not null primary key autoincrement,
    nombre text not null
);
create table empleados_administrativos_departamentos (
    ID_empleado_administrativo integer	references empleados_administrativos(ID),
    ID_departamento integer	references departamentos(ID)
);
create table programa_academico (
    ID integer not null primary key autoincrement,
    nombre text not null,
    ID_departamento integer	references departamentos(ID)
);
create table estudiantes (
    DNI text not null primary key,
    nombre text not null,
    apellido text not null,
    ID_libro integer	references libros(ID),
    ID_programa_academico integer	references programa_academico(ID)
);
create table estudiantes_email (
    email text not null primary key,
    DNI_estudiante text 	references estudiantes(DNI)
);
create table direccion (
    ID integer not null primary key autoincrement,
    calle text not null,
    numero integer not null,
    piso text not null,
    codigo_postal integer not null,
    municipio text not null,
    provincia text not null
);
create table estudiantes_direccion (
    DNI_estudiante text 	references estudiantes(DNI),
    ID_direccion integer 	references direccion(ID)
);
create table notas (
    ID integer not null primary key
);
create table estudiantes_notas (
    DNI_estudiante text 	references estudiantes(DNI),
    ID_nota integer 	references notas(ID)
);
create table becas (
    ID integer not null primary key
);
create table estudiante_becas (
    DNI_estudiante text 	references estudiantes(DNI),
    ID_beca integer 	references becas(ID)
);
create table empresa (
    ID integer not null primary key autoincrement,
    nombre text not null
);
create table beca_empresa (
    ID_beca integer 	references becas(ID),
    ID_empresa integer 	references empresa(ID)
);
create table eventos (
    ID integer not null primary key autoincrement,
    nombre text not null
);
create table empresa_eventos (
    ID_empresa integer	references empresas(ID),
    ID_evento integer	references eventos(ID)
);
create table instalaciones_deportivas (
    ID_instalacion_deportiva integer not null primary key autoincrement,
    nombre text not null,
    ID_evento integer	references eventos(ID)
);
create table profesores (
    ID integer not null primary key autoincrement,
    nombre text not null,
    apellido text not null
);
create table estudiantes_profesores (
    DNI_estudiante text 	references estudiantess(DNI),
    ID_profesor integer 	references profesores(ID)
);
create table cursos (
    ID integer not null primary key autoincrement,
    nombre text not null,
    ID_programa_academico integer	references programa_academico(ID),
    ID_profesor integer	references profesores(ID)
);
create table estudiantes_cursos (
    DNI_estudiante text 	references estudiantes(DNI),
    ID_curso integer	references cursos(ID)
);
create table asignaturas (
    ID integer not null primary key autoincrement,
    nombre text not null,
    ID_curso integer	references cursos(ID)
);
create table prerequisitos (
    ID_prerequisitos integer not null primary key autoincrement,
    ID_asignaturas integer	references asignaturas(ID)
);
create table aulas (
    ID integer not null primary key autoincrement,
    ubicacion text not null,
    ID_curso integer	references cursos(ID)
);
```
### Inserción de valores

Una vez creadas las tablas para la inserción de valores se deben insertar los siguientes comandos:
```sql 
insert into nombre_tabla ()
values (),
();
```
Dentro de values colocamos la información que queremos poner en nuestra tabla. 
En este caso, empezaremos insertando  el nombre de los generos literarios como se muestra a continuación:

```sql
insert into generos (nombre)
values ('Romance'),
('Ficcion'),
('Thriller'),
('Fantasia'),
('Policiaca');
insert into libros (titulos)
values ('Dune'),
('Icebreaker'),
('Asesinato en el oriente express'),
('Cuentos de hadas'),
('Alas de sangre');
insert into generos_libros (ID_genero, ID_libro)
values (2, 1),
(1, 2),
(5, 3),
(4, 4),
(4, 5);
insert into empleados_administrativos (nombre)
values ('Alonso'),
('Marta'),
('Toni'),
('Ana'),
('Ines');
insert into departamentos (nombre)
values ('Informatica'),
('Computacion'),
('Filosofia'),
('Quimica'),
('Fisica');
insert into empleados_administrativos_departamentos (ID_empleado_administrativo, ID_departamento)
values (1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);
insert into programa_academico (nombre, ID_departamento)
values ('Ingieneria informatica', 1),
('Medicina', 4),
('Derecho', 3),
('Arquitectura', 5),
('Ingieneria civil', 2);
insert into estudiantes (DNI, nombre, apellido, ID_libro, ID_programa_academico)
values ('11111111A', 'Mateo', 'Perez', 1, 1),
('22222222B', 'Rosa', 'Martinez', 2, 2),
('33333333C', 'Hugo', 'Hernandez', 3, 3),
('44444444D', 'Lucia', 'Rodriguez', 4, 4),
('55555555E', 'Julia', 'Lopez', 5, 5);
insert into estudiantes_email (email, DNI_estudiante)
values ('mateo@gmail.com', '11111111A'),
('mateo11@hotmail.com', '11111111A'),
('rosa@hotmail.com', '22222222B'),
('hugo@yahoo.com', '33333333C'),
('lucia@gmail.com', '44444444D'),
('lucia22@yahoo.com', '44444444D'),
('julia@yahoo.com', '55555555E');
insert into direccion (calle, numero, piso, codigo_postal, municipio, provincia)
values ('AV. de la Justicia', 32, 'A', 39002, 'San Cristobal de La Laguna', 'SC  de Tenerife'),
('Castillo', 30, 'B', 39846, 'El Rosario', 'SC  de Tenerife'),
('Hidalgo', 33, 'D', 35643, 'Agaete', 'Las Palmas de Gran Canaria'),
('Obispo Rey Redondo', 89, 'A', 34207, 'Santa Cruz de La Palma', 'SC de Tenerife'),
('AV La Cuesta', 66, 'D', 23449, 'San Cristobal de La Laguna', 'SC de Tenerife');
insert into estudiantes_direccion (DNI_estudiante, ID_direccion)
values ('11111111A', 1),
('22222222B', 2),
('33333333C', 3),
('44444444D', 4),
('55555555E', 5);
insert into notas (ID)
values (1),
(2),
(3),
(4),
(5);
insert into estudiantes_notas (DNI_estudiante, ID_nota)
values ('11111111A', 1),
('22222222B', 2),
('33333333C', 3),
('44444444D', 4),
('55555555E', 5);
insert into becas (ID)
values (1),
(2),
(3),
(4),
(5);
insert into estudiante_becas (DNI_estudiante, ID_beca)
values ('11111111A', 1),
('22222222B', 2),
('33333333C', 3),
('44444444D', 4),
('55555555E', 5);
insert into empresa (nombre)
values ('DxT'),
('Decathlon'),
('Lemus'),
('Minecraft'),
('Auchan');
insert into beca_empresa (ID_beca, ID_empresa)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
insert into eventos (nombre)
values ('Carrera Solidaria'),
('Dia del deporte'),
('Dia del libro'),
('Charlas sobre almentacion'),
('Charla sobre consumo responsable');
insert into empresa_eventos (ID_empresa, ID_evento)
values( 1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
insert into instalaciones_deportivas (nombre, ID_evento)
values ('Polideportivo A', 4),
('Pabellon Alfredo', 2),
('Polideportivo B', 5),
('Cancha A', 1),
('Cancha B', 3);
insert into profesores (nombre, apellido)
values ('Pedro', 'Heredia'),
('Almudena', 'Dolores'),
('Jorge', 'Batista'),
('Alicia', 'Perez'),
('Candelaria', 'Diaz');
insert into estudiantes_profesores (DNI_estudiante, ID_profesor)
values('11111111A', 2),
('22222222B', 1),
('33333333C', 5),
('44444444D', 3),
('55555555E', 4);
insert into cursos (nombre, ID_programa_academico, ID_profesor)
values ('DAW', 1, 1), 
('DAM', 1, 2),
('ASIR', 1, 3),
('TCAE', 2, 4),
('LED', 3, 5);
insert into estudiantes_cursos (DNI_estudiante, ID_curso)
values ('11111111A', 1),
('22222222B', 2),
('33333333C', 3),
('44444444D', 4),
('55555555E', 5);
insert into asignaturas (nombre, ID_curso)
values ('Base de datos', 1),
('Sistemas informaticos', 1),
('Entornos de desarrollo', 2),
('Programacion', 2),
('Lenguaje de marcas', 2);
insert into prerequisitos (ID_prerequisitos, ID_asignaturas)
values(1, 3),
(2, 2),
(3, 5),
(4, 1),
(5, 4);
insert into aulas (ubicacion, ID_curso)
values ('Piso 1', 1),
('Piso1', 2),
('Piso1', 3),
('Piso2', 4),
('Piso2', 5);
```
### Tablas creadas

 En este apartado veremos de manera visual las tablas creadas anteriormente con *SQLite3* en orden de creación, en este caso para representarlas quisimos usar *Markdown* pero queremos aclarar que tambien en *SQLite3* podemos mostrar de manera gráfica las tablas utilizando la siguiente consulta:

 ``` sql 
 SELECT * FROM nombre_tabla;
  ```
 Esto nos devolvera la tabla de forma mas visual para que resulte mas fácil leer los datos en caso de que sea necesario.

#### Generos
| id |  nombre   |
|----|-----------|
| 1  | Romance   |
| 2  | Ficcion   |
| 3  | Thriller  |
| 4  | Fantasia  |
| 5  | Policiaca |
#### Libros
| id |             titulos             |
|----|---------------------------------|
| 1  | Dune                            |
| 2  | Icebreaker                      |
| 3  | Asesinato en el oriente express |
| 4  | Cuentos de hadas                |
| 5  | Alas de sangre                  |
#### Generos_Libro
| id_genero | id_libro |
|-----------|----------|
| 2         | 1        |
| 1         | 2        |
| 5         | 3        |
| 4         | 4        |
| 4         | 5        |
#### Empleados_administrativos
| id | nombre |
|----|--------|
| 1  | Alonso |
| 2  | Marta  |
| 3  | Toni   |
| 4  | Ana    |
| 5  | Ines   |
#### Departamentos
| id |   nombre    |
|----|-------------|
| 1  | Informatica |
| 2  | Computacion |
| 3  | Filosofia   |
| 4  | Quimica     |
| 5  | Fisica      |
#### Empleados administrarivos_Departamentos
| id_empleado_administrativo | id_departamento |
|----------------------------|-----------------|
| 1                          | 2               |
| 2                          | 3               |
| 3                          | 4               |
| 4                          | 5               |
| 5                          | 1               |
#### Programa_academico
| id |         nombre         | id_departamento |
|----|------------------------|-----------------|
| 1  | Ingieneria informatica | 1               |
| 2  | Medicina               | 4               |
| 3  | Derecho                | 3               |
| 4  | Arquitectura           | 5               |
| 5  | Ingieneria civil       | 2               |
#### Estudiantes
|    DNI    | nombre | apellido  | ID_libro | ID_programa_academico |
|-----------|--------|-----------|----------|-----------------------|
| 11111111A | Mateo  | Perez     | 1        | 1                     |
| 22222222B | Rosa   | Martinez  | 2        | 2                     |
| 33333333C | Hugo   | Hernandez | 3        | 3                     |
| 44444444D | Lucia  | Rodriguez | 4        | 4                     |
| 55555555E | Julia  | Lopez     | 5        | 5                     |
#### Estudiante_Email
|        email        | DNI_estudiante |
|---------------------|----------------|
| mateo@gmail.com     | 11111111A      |
| mateo11@hotmail.com | 11111111A      |
| rosa@hotmail.com    | 22222222B      |
| hugo@yahoo.com      | 33333333C      |
| lucia@gmail.com     | 44444444D      |
| lucia22@yahoo.com   | 44444444D      |
| julia@yahoo.com     | 55555555E      |
#### Direccion
| id |       calle        | numero | piso | codigo_postal |         municipio          |         provincia          |
|----|--------------------|--------|------|---------------|----------------------------|----------------------------|
| 1  | AV. de la Justicia | 32     | A    | 39002         | San Cristobal de La Laguna | SC  de Tenerife            |
| 2  | Castillo           | 30     | B    | 39846         | El Rosario                 | SC  de Tenerife            |
| 3  | Hidalgo            | 33     | D    | 35643         | Agaete                     | Las Palmas de Gran Canaria |
| 4  | Obispo Rey Redondo | 89     | A    | 34207         | Santa Cruz de La Palma     | SC de Tenerife             |
| 5  | AV La Cuesta       | 66     | D    | 23449         | San Cristobal de La Laguna | SC de Tenerife             |
#### Estudiantes_Direccion
| dni_estudiante | id_direccion |
|----------------|--------------|
| 11111111A      | 1            |
| 22222222B      | 2            |
| 33333333C      | 3            |
| 44444444D      | 4            |
| 55555555E      | 5            |
#### Notas
| id |
|----|
| 1  |
| 2  |
| 3  |
| 4  |
| 5  |
#### Estudiantes_Notas
| dni_estudiante | id_nota |
|----------------|---------|
| 11111111A      | 1       |
| 22222222B      | 2       |
| 33333333C      | 3       |
| 44444444D      | 4       |
| 55555555E      | 5       |
#### Becas
| id |
|----|
| 1  |
| 2  |
| 3  |
| 4  |
| 5  |
#### Estudiantes_Becas
| dni_estudiante | id_beca |
|----------------|---------|
| 11111111A      | 1       |
| 22222222B      | 2       |
| 33333333C      | 3       |
| 44444444D      | 4       |
| 55555555E      | 5       |
#### Empresa
| id |  nombre   |
|----|-----------|
| 1  | DxT       |
| 2  | Decathlon |
| 3  | Lemus     |
| 4  | Minecraft |
| 5  | Auchan    |
#### Becas_Empresa
| id_beca | id_empresa |
|---------|------------|
| 1       | 1          |
| 2       | 2          |
| 3       | 3          |
| 4       | 4          |
| 5       | 5          |
#### Eventos
| id |              nombre              |
|----|----------------------------------|
| 1  | Carrera Solidaria                |
| 2  | Dia del deporte                  |
| 3  | Dia del libro                    |
| 4  | Charlas sobre almentacion        |
| 5  | Charla sobre consumo responsable |
#### Empresa_Eventos
| id_empresa | id_evento |
|------------|-----------|
| 1          | 1         |
| 2          | 2         |
| 3          | 3         |
| 4          | 4         |
| 5          | 5         |
#### Instalaciones deportivas
| id_instalacion_deportiva |      nombre      | id_evento |
|--------------------------|------------------|-----------|
| 1                        | Polideportivo A  | 4         |
| 2                        | Pabellon Alfredo | 2         |
| 3                        | Polideportivo B  | 5         |
| 4                        | Cancha A         | 1         |
| 5                        | Cancha B         | 3         |
#### Profesores
| ID |   nombre   | apellido |
|----|------------|----------|
| 1  | Pedro      | Heredia  |
| 2  | Almudena   | Dolores  |
| 3  | Jorge      | Batista  |
| 4  | Alicia     | Perez    |
| 5  | Candelaria | Diaz     |
#### Estudiantes_Profesores
| dni_estudiante | id_profesor |
|----------------|-------------|
| 11111111A      | 2           |
| 22222222B      | 1           |
| 33333333C      | 5           |
| 44444444D      | 3           |
| 55555555E      | 4           |
#### Cursos
| id | nombre | id_programa_academico | id_profesor |
|----|--------|-----------------------|-------------|
| 1  | DAW    | 1                     | 1           |
| 2  | DAM    | 1                     | 2           |
| 3  | ASIR   | 1                     | 3           |
| 4  | TCAE   | 2                     | 4           |
| 5  | LED    | 3                     | 5           |
#### Estudiantes_Cursos
| dni_estudiante | id_curs |
|----------------|---------|
| 11111111A      | 1       |
| 22222222B      | 2       |
| 33333333C      | 3       |
| 44444444D      | 4       |
| 55555555E      | 5       |
#### Asignaturas
| id |         nombre         | id_curso |
|----|------------------------|----------|
| 1  | Base de datos          | 1        |
| 2  | Sistemas informaticos  | 1        |
| 3  | Entornos de desarrollo | 2        |
| 4  | Programacion           | 2        |
| 5  | Lenguaje de marcas     | 2        |
### Prerequisitos
| id_prerequisitos | id_asignaturas |
|------------------|----------------|
| 1                | 3              |
| 2                | 2              |
| 3                | 5              |
| 4                | 1              |
| 5                | 4              |
#### Aulas
| id | ubicacion | id_curso |
|----|-----------|----------|
| 1  | Piso 1    | 1        |
| 2  | Piso1     | 2        |
| 3  | Piso1     | 3        |
| 4  | Piso2     | 4        |
| 5  | Piso2     | 5        |

## Autores
- [Antonio Navarro Hernández](https://github.com/toninavhd)
- [Rashi Bhagwan Chugani Narwani](https://github.com/Chugani05)
</div>
