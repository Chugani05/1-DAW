-- Nombre: Rashi Chugani Narwani


-- 1. Realiza la inserción de, al menos, 2 alumnos.
/** Estado anterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI789012B │ María  │ Martínez  │ 92   │ 2        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI567890E │ David  │ Fernández │ 95   │ 2        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI234567H │ Sara   │ García    │ 67   │ 2        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/
-- Consulta:
insert into alumno (dni, nombre, apellido, nota, id_clase) 
values ('DNI456789K', 'Alonso', 'Cruz', 53, 2),
('DNI567890L', 'Marta', 'Hernández', 87, 3);
/** Estado posterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI789012B │ María  │ Martínez  │ 92   │ 2        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI567890E │ David  │ Fernández │ 95   │ 2        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI234567H │ Sara   │ García    │ 67   │ 2        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI456789K │ Alonso │ Cruz      │ 53   │ 2        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/


-- 2. Obtener los apellidos de los alumnos.
-- Consulta:
select apellido from alumno;
/** Estado posterior
┌───────────┐
│ apellido  │
├───────────┤
│ Pérez     │
│ Martínez  │
│ Gómez     │
│ Martínez  │
│ Fernández │
│ Pérez     │
│ Pérez     │
│ García    │
│ López     │
│ Martínez  │
│ Cruz      │
│ Hernández │
└───────────┘
**/


-- 3. Obtener los apellidos de los alumnos sin repeticiones.
-- Consulta:
select distinct apellido from alumno;
/** Estado posterior
┌───────────┐
│ apellido  │
├───────────┤
│ Pérez     │
│ Martínez  │
│ Gómez     │
│ Fernández │
│ García    │
│ López     │
│ Cruz      │
│ Hernández │
└───────────┘
**/


-- 4. Obtener todos los datos de los alumnos que se apellidan Martínez.
-- Consulta:
select * from alumno where apellido='Martínez';
/** Estado posterior
┌────────────┬────────┬──────────┬──────┬──────────┐
│    dni     │ nombre │ apellido │ nota │ id_clase │
├────────────┼────────┼──────────┼──────┼──────────┤
│ DNI789012B │ María  │ Martínez │ 92   │ 2        │
│ DNI901234D │ Ana    │ Martínez │ 89   │ 3        │
│ DNI345678J │ Elena  │ Martínez │ 94   │ 3        │
└────────────┴────────┴──────────┴──────┴──────────┘
**/


-- 5. Obtener todos los datos de los alumnos que se apellidan Martínez y los que se apellidan Pérez.
-- Consulta:
select * from alumno where apellido='Martínez' or apellido='Pérez';
select * from alumno where apellido in (Martínez, Pérez); -- otra solución (más eficiente) 
/** Estado posterior
┌────────────┬────────┬──────────┬──────┬──────────┐
│    dni     │ nombre │ apellido │ nota │ id_clase │
├────────────┼────────┼──────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez    │ 85   │ 1        │
│ DNI789012B │ María  │ Martínez │ 92   │ 2        │
│ DNI901234D │ Ana    │ Martínez │ 89   │ 3        │
│ DNI123890F │ Laura  │ Pérez    │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez    │ 88   │ 3        │
│ DNI345678J │ Elena  │ Martínez │ 94   │ 3        │
└────────────┴────────┴──────────┴──────┴──────────┘
**/


-- 6. Obtener todos los datos de los alumnos que asisten a la clase 10.
-- Consulta:
select * from alumno where id_clase=10;
/** Estado posterior
La consulta se devuelve vacía
**/


-- 7. Obtener todos los datos de los alumnos que asisten a la clase 8 y para el clase 5.
-- Consulta:
select * from alumno where id_clase=8 or id_clase=5;
select * from alumno where id_clase in (8, 5); -- otra solución (más eficiente)
/** Estado posterior
La consulta se devuelve vacía
**/


-- 8. Obtener todos los datos de los alumnos cuyo apellido comience por P.
-- Consulta:
select * from alumno where (apellido like 'P%');
/** Estado posterior
┌────────────┬────────┬──────────┬──────┬──────────┐
│    dni     │ nombre │ apellido │ nota │ id_clase │
├────────────┼────────┼──────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez    │ 85   │ 1        │
│ DNI123890F │ Laura  │ Pérez    │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez    │ 88   │ 3        │
└────────────┴────────┴──────────┴──────┴──────────┘
**/


-- 9. Obtener el número máximo de alumnos por en todas las clases.
-- Consulta:
select * from clase; --mal (mi forma)
select max(max_alumnos) from clase;
/** Estado posterior
┌────┬─────────────┐
│ id │ max_alumnos │
├────┼─────────────┤
│ 1  │ 30          │
│ 2  │ 25          │
│ 3  │ 20          │
└────┴─────────────┘
**/


-- 10. Obtener el número de alumnos en cada clase.
-- Consulta:
select c.id as clase, count(a.id_clase) as número_alumnos from alumno as a, clase as c where c.id=a.id_clase group by c.id;
select id_clase, count(*) as cantidad_alumnos from alumno group by id_clase; -- esta es la forma que nos da éĺ
/** Estado posterior
┌───────┬────────────────┐
│ clase │ número_alumnos │
├───────┼────────────────┤
│ 1     │ 4              │
│ 2     │ 4              │
│ 3     │ 4              │
└───────┴────────────────┘
**/


-- 11. Obtener un listado completo de alumnos, incluyendo los datos de su clase a la que asisten.
-- Consulta:
select nombre, apellido, id_clase from alumno;
select alumno.*, clase.max_alumnos from alumno as a, clase as c where c.id=a.id_clase; -- esta es la forma que nos da éĺ
/** Estado posterior
┌────────┬───────────┬──────────┐
│ nombre │ apellido  │ id_clase │
├────────┼───────────┼──────────┤
│ Juan   │ Pérez     │ 1        │
│ María  │ Martínez  │ 2        │
│ Pedro  │ Gómez     │ 1        │
│ Ana    │ Martínez  │ 3        │
│ David  │ Fernández │ 2        │
│ Laura  │ Pérez     │ 1        │
│ Carlos │ Pérez     │ 3        │
│ Sara   │ García    │ 2        │
│ Javier │ López     │ 1        │
│ Elena  │ Martínez  │ 3        │
│ Alonso │ Cruz      │ 2        │
│ Marta  │ Hernández │ 3        │
└────────┴───────────┴──────────┘
**/


-- 12. Muestra todos los alumnos ordenando por nombre de forma descendiente y por nota de forma ascendente .

/** Estado anterior


**/
-- Consulta:
select * from alumno order by nombre desc and order by nota asc; -- mal (mia)
select * from alumno order by nombre desc, nota asc; -- forma correcta
/** Estado posterior


**/


-- 13. Obtener los nombres y apellido de los alumnos que asisten a la clase 4 y cuyo máximo de alumnos es mayor 10.
-- Consulta:
select a.nombre, a.apellido from alumno as a, clase as c where c.id=a.id_clase and id_clase=4 and max_alumnos=10; -- tiene errores (mia)
select a.nombre, a.apellido from alumno as a, clase as c where c.id=a.id_clase and a.id_clase=4 and c.max_alumnos>10; -- manera correcta
/** Estado posterior
La consulta se devuelve vacía
**/


-- 14. Obtener los datos de los clases cuyo número de alumnos es superior a la media de todos los clases.
/** Estado anterior
**/
-- Consulta:
select c.id, c.max_alumnos from alumno as a, clase as c where c.id=a.id_clase and max_alumnos > (select avg(id_clase) from alumno); -- mal, mal, MAL
(select avg(max_alumnos) from clase); -- esto es lo que habia que hacer
/** Estado posterior
┌────┬─────────────┐
│ id │ max_alumnos │
├────┼─────────────┤
│ 1  │ 30          │
│ 2  │ 25          │
│ 3  │ 20          │
└────┴─────────────┘
**/


-- 15. Obtener los nombres (únicamente los nombres) de los clases que tiene más de dos alumnos.

/** Estado anterior


**/
-- Consulta:
select c.id from alumno as a, clase as c where c.id=a.id_clase and _ > 2 group by a.id_clase;
/** Estado posterior


**/


-- 16. Añadir un nuevo clase, con un número máximo de alumnos es 20.
/** Estado anterior
┌────┬─────────────┐
│ id │ max_alumnos │
├────┼─────────────┤
│ 1  │ 30          │
│ 2  │ 25          │
│ 3  │ 20          │
└────┴─────────────┘
**/
-- Consulta:
insert into clase (id, max_alumnos) 
values (4, 20);
/** Estado posterior
┌────┬─────────────┐
│ id │ max_alumnos │
├────┼─────────────┤
│ 1  │ 30          │
│ 2  │ 25          │
│ 3  │ 20          │
│ 4  │ 20          │
└────┴─────────────┘
**/


-- 17. Añadir dos nuevos alumnos vinculando a la clase creada.
/** Estado anterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI789012B │ María  │ Martínez  │ 92   │ 2        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI567890E │ David  │ Fernández │ 95   │ 2        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI234567H │ Sara   │ García    │ 67   │ 2        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI456789K │ Alonso │ Cruz      │ 53   │ 2        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/
-- Consulta:
insert into alumno (dni, nombre, apellido, nota, id_clase) 
values ('DNI456789K', 'Morty', 'Gómez', 78, 4),
('DNI567890L', 'Ricky', 'López', 96, 4);
/** Estado posterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI789012B │ María  │ Martínez  │ 92   │ 2        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI567890E │ David  │ Fernández │ 95   │ 2        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI234567H │ Sara   │ García    │ 67   │ 2        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI456789K │ Alonso │ Cruz      │ 53   │ 2        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
│ DNI456789K │ Morty  │ Gómez     │ 78   │ 4        │
│ DNI567890L │ Ricky  │ López     │ 96   │ 4        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/


-- 18. Calcula el 10% de los alumnos por clase.
-- Consulta:
select id, max_alumnos*0.1 as '10%_clase' from clase;
/** Estado posterior
┌────┬───────────┐
│ id │ 10%_clase │
├────┼───────────┤
│ 1  │ 3.0       │
│ 2  │ 2.5       │
│ 3  │ 2.0       │
│ 4  │ 2.0       │
└────┴───────────┘
**/


-- 19. Elimina a todos los alumnos que asisten a la clase con id 2.
/** Estado anterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI789012B │ María  │ Martínez  │ 92   │ 2        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI567890E │ David  │ Fernández │ 95   │ 2        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI234567H │ Sara   │ García    │ 67   │ 2        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI456789K │ Alonso │ Cruz      │ 53   │ 2        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
│ DNI456789K │ Morty  │ Gómez     │ 78   │ 4        │
│ DNI567890L │ Ricky  │ López     │ 96   │ 4        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/
-- Consulta:
delete from alumno where id_clase=2;
/** Estado posterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
│ DNI456789K │ Morty  │ Gómez     │ 78   │ 4        │
│ DNI567890L │ Ricky  │ López     │ 96   │ 4        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/


-- 20. Elimina a todos los alumnos cuyo nota sea inferior al 30%.

/** Estado anterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
│ DNI456789K │ Morty  │ Gómez     │ 78   │ 4        │
│ DNI567890L │ Ricky  │ López     │ 96   │ 4        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/
-- Consulta:
delete from alumno where nota<nota*0.3;
/** Estado posterior
┌────────────┬────────┬───────────┬──────┬──────────┐
│    dni     │ nombre │ apellido  │ nota │ id_clase │
├────────────┼────────┼───────────┼──────┼──────────┤
│ DNI123456A │ Juan   │ Pérez     │ 85   │ 1        │
│ DNI345678C │ Pedro  │ Gómez     │ 78   │ 1        │
│ DNI901234D │ Ana    │ Martínez  │ 89   │ 3        │
│ DNI123890F │ Laura  │ Pérez     │ 75   │ 1        │
│ DNI456789G │ Carlos │ Pérez     │ 88   │ 3        │
│ DNI890123I │ Javier │ López     │ 76   │ 1        │
│ DNI345678J │ Elena  │ Martínez  │ 94   │ 3        │
│ DNI567890L │ Marta  │ Hernández │ 87   │ 3        │
│ DNI456789K │ Morty  │ Gómez     │ 78   │ 4        │
│ DNI567890L │ Ricky  │ López     │ 96   │ 4        │
└────────────┴────────┴───────────┴──────┴──────────┘
**/

