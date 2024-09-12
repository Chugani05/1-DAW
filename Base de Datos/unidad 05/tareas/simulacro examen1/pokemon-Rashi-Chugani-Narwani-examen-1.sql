-- Tablas iniciales:
-- Tabla Pokemon
/**
+----+------------+---------+-------+
| id |   nombre   | id_tipo | nivel |
+----+------------+---------+-------+
| 1  | Bulbasaur  | 3       | 10    |
| 2  | Charmander | 2       | 12    |
| 3  | Squirtle   | 1       | 8     |
| 4  | Pikachu    | 4       | 15    |
| 5  | Geodude    | 5       | 11    |
| 6  | Vaporeon   | 1       | 25    |
| 7  | Flareon    | 2       | 27    |
| 8  | Ivysaur    | 3       | 18    |
| 9  | Jolteon    | 4       | 22    |
| 10 | Cubone     | 5       | 14    |
| 11 | Gyarados   | 1       | 30    |
| 12 | Arcanine   | 2       | 35    |
| 13 | Exeggutor  | 3       | 40    |
| 14 | Raichu     | 4       | 38    |
| 15 | Sandslash  | 5       | 33    |
| 16 | Venusaur   | 3       | 45    |
| 17 | Charizard  | 2       | 50    |
| 18 | Blastoise  | 1       | 55    |
| 19 | Electabuzz | 4       | 48    |
| 20 | Rhydon     | 5       | 52    |
| 21 | Dragonite  | 2       | 60    |
| 22 | Flareon    | 2       | 65    |
| 23 | Venusaur   | 3       | 70    |
| 24 | Zapdos     | 4       | 75    |
| 25 | Rhydon     | 5       | 80    |
+----+------------+---------+-------+
**/
-- Tabla Tipo
/**
+----+-----------+
| id |  nombre   |
+----+-----------+
| 1  | Agua      |
| 2  | Fuego     |
| 3  | Planta    |
| 4  | Eléctrico |
| 5  | Tierra    |
+----+-----------+
**/

-- Actualizar el nivel de Bulbasaur.
update Pokemon set nivel=12 where nombre='Bulbasaur';
select * from Pokemon where nombre='Bulbasaur';
/**
+----+-----------+---------+-------+
| id | nombre    | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Balbasaur | 3       | 12    |
+----+-----------+---------+-------+
**/

-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo".
update Tipo as t set nombre='Electrico/Rojo' from Pokemon as p where p.id_tipo=t.id and p.nombre='Pikachu';
select p.nombre, t.nombre from Pokemon as p, Tipo as t where p.id_tipo=t.id and p.nombre="Pikachu";
/**
+---------+----------------+
| nombre  |     nombre     |
+---------+----------------+
| Pikachu | Eléctrico/Rojo |
+---------+----------------+
**/

-- Incrementar el nivel de todos los Pokémon de tipo Agua.
update Pokemon as p set nivel = nivel + 1 from tipo as t where p.id_tipo=t.id and t.nombre='Agua';
select p.nombre, p.nivel, t.nombre from  Pokemon as p, Tipo as t where p.id_tipo=t.id and t.nombre="Agua";
/**
+-----------+-------+--------+
|  nombre   | nivel | nombre |
+-----------+-------+--------+
| Squirtle  | 9     | Agua   |
| Vaporeon  | 26    | Agua   |
| Gyarados  | 31    | Agua   |
| Blastoise | 56    | Agua   |
+-----------+-------+--------+
**/

-- Eliminar a Jynx de la lista de Pokémon.
delete from Pokemon where nombre='Jynx';
-- No se elimina nada porque no existe pokemon 'Jynx'.

-- Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
delete from Tipo where nombre='Hielo';
-- No se elimina nada porque no existe tipo 'Hielo'.

-- Obtener todos los Pokémon.
select * from Pokemon;
/**
+----+------------+---------+-------+
| id |   nombre   | id_tipo | nivel |
+----+------------+---------+-------+
| 1  | Bulbasaur  | 3       | 12    |
| 2  | Charmander | 2       | 12    |
| 3  | Squirtle   | 1       | 9     |
| 4  | Pikachu    | 4       | 15    |
| 5  | Geodude    | 5       | 11    |
| 6  | Vaporeon   | 1       | 26    |
| 7  | Flareon    | 2       | 27    |
| 8  | Ivysaur    | 3       | 18    |
| 9  | Jolteon    | 4       | 22    |
| 10 | Cubone     | 5       | 14    |
| 11 | Gyarados   | 1       | 31    |
| 12 | Arcanine   | 2       | 35    |
| 13 | Exeggutor  | 3       | 40    |
| 14 | Raichu     | 4       | 38    |
| 15 | Sandslash  | 5       | 33    |
| 16 | Venusaur   | 3       | 45    |
| 17 | Charizard  | 2       | 50    |
| 18 | Blastoise  | 1       | 56    |
| 19 | Electabuzz | 4       | 48    |
| 20 | Rhydon     | 5       | 52    |
| 21 | Dragonite  | 2       | 60    |
| 22 | Flareon    | 2       | 65    |
| 23 | Venusaur   | 3       | 70    |
| 24 | Zapdos     | 4       | 75    |
| 25 | Rhydon     | 5       | 80    |
+----+------------+---------+-------+
**/

-- Obtener el nombre y nivel de los Pokémon de tipo Fuego.
select p.nombre, p.nivel from Pokemon as p, Tipo as t where t.id=p.id_tipo and t.nombre='Fuego';
/**
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Charmander | 12    |
| Flareon    | 27    |
| Arcanine   | 35    |
| Charizard  | 50    |
| Dragonite  | 60    |
| Flareon    | 65    |
+------------+-------+
**/

-- Obtener el nombre de los Pokémon que tienen un nivel superior a 30.
select p.nombre, p.nivel from Pokemon as p, Tipo as t where t.id=p.id_tipo and nivel>30;
/**
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Gyarados   | 31    |
| Arcanine   | 35    |
| Exeggutor  | 40    |
| Raichu     | 38    |
| Sandslash  | 33    |
| Venusaur   | 45    |
| Charizard  | 50    |
| Blastoise  | 56    |
| Electabuzz | 48    |
| Rhydon     | 52    |
| Dragonite  | 60    |
| Flareon    | 65    |
| Venusaur   | 70    |
| Zapdos     | 75    |
| Rhydon     | 80    |
+------------+-------+
**/

-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.
select nombre, nivel from Pokemon order by nivel desc;
/**
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Rhydon     | 80    |
| Zapdos     | 75    |
| Venusaur   | 70    |
| Flareon    | 65    |
| Dragonite  | 60    |
| Blastoise  | 56    |
| Rhydon     | 52    |
| Charizard  | 50    |
| Electabuzz | 48    |
| Venusaur   | 45    |
| Exeggutor  | 40    |
| Raichu     | 38    |
| Arcanine   | 35    |
| Sandslash  | 33    |
| Gyarados   | 31    |
| Flareon    | 27    |
| Vaporeon   | 26    |
| Jolteon    | 22    |
| Ivysaur    | 18    |
| Pikachu    | 15    |
| Cubone     | 14    |
| Bulbasaur  | 12    |
| Charmander | 12    |
| Geodude    | 11    |
| Squirtle   | 9     |
+------------+-------+
**/

-- Obtener la cantidad de Pokémon por tipo.
select t.nombre, count(id_tipo) as 'tipos' from Pokemon as p, tipo as t where t.id=p.id_tipo group by p.id_tipo;
/**
+----------------+-------+
|     nombre     | tipos |
+----------------+-------+
| Agua           | 4     |
| Fuego          | 6     |
| Planta         | 5     |
| Eléctrico/Rojo | 5     |
| Tierra         | 5     |
+----------------+-------+
**/

-- Obtener la información completa de un Pokémon específico. Selecciona el que desees.
select * from Pokemon where id=21;
/**
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 21 | Dragonite | 2       | 60    |
+----+-----------+---------+-------+
**/

-- Obtener el promedio de niveles de todos los Pokémon.
select avg(nivel) as promedio_nivel from Pokemon;
/**
+----------------+
| promedio_nivel |
+----------------+
| 37.76          |
+----------------+
**/

-- Obtener el nombre del Pokémon de mayor nivel.
select nombre from Pokemon order by nivel desc limit 1;
/**
+--------+
| nombre |
+--------+
| Rhydon |
+--------+
**/

-- Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":
update Pokemon set nombre='Bulbasaur Nv. 15' where nombre='Bulbasaur';
select * from Pokemon where nombre='Bulbasaur Nv. 15';
/**
+----+------------------+---------+-------+
| id |      nombre      | id_tipo | nivel |
+----+------------------+---------+-------+
| 1  | Bulbasaur Nv. 15 | 3       | 12    |
+----+------------------+---------+-------+
**/

-- Obtener los Pokémon cuyo nivel es igual a 50.
 select p.nombre, p.nivel from Pokemon as p, Tipo as t where t.id=p.id_tipo and nivel=50;
/**
+-----------+-------+
|  nombre   | nivel |
+-----------+-------+
| Charizard | 50    |
+-----------+-------+
**/

-- Eliminar todos los Pokémon de nivel 40.
delete from Pokemon where nivel=40;
select * from Pokemon;
/**
+----+------------------+---------+-------+
| id |      nombre      | id_tipo | nivel |
+----+------------------+---------+-------+
| 1  | Bulbasaur Nv. 15 | 3       | 12    |
| 2  | Charmander       | 2       | 12    |
| 3  | Squirtle         | 1       | 9     |
| 4  | Pikachu          | 4       | 15    |
| 5  | Geodude          | 5       | 11    |
| 6  | Vaporeon         | 1       | 26    |
| 7  | Flareon          | 2       | 27    |
| 8  | Ivysaur          | 3       | 18    |
| 9  | Jolteon          | 4       | 22    |
| 10 | Cubone           | 5       | 14    |
| 11 | Gyarados         | 1       | 31    |
| 12 | Arcanine         | 2       | 35    |
| 14 | Raichu           | 4       | 38    |
| 15 | Sandslash        | 5       | 33    |
| 16 | Venusaur         | 3       | 45    |
| 17 | Charizard        | 2       | 50    |
| 18 | Blastoise        | 1       | 56    |
| 19 | Electabuzz       | 4       | 48    |
| 20 | Rhydon           | 5       | 52    |
| 21 | Dragonite        | 2       | 60    |
| 22 | Flareon          | 2       | 65    |
| 23 | Venusaur         | 3       | 70    |
| 24 | Zapdos           | 4       | 75    |
| 25 | Rhydon           | 5       | 80    |
+----+------------------+---------+-------+
**/

-- Obtener el tipo y nivel de Pikachu.
select t.nombre, p.nivel from Tipo as t, Pokemon as p where t.id=p.id_tipo and p.nombre='Pikachu';
/**
+----------------+-------+
|     nombre     | nivel |
+----------------+-------+
| Eléctrico/Rojo | 15    |
+----------------+-------+
**/

-- Obtener los Pokémon de tipo Planta con nivel superior a 20:
 select p.nombre, p.nivel from Pokemon as p, Tipo as t where t.id=p.id_tipo and t.nombre='Planta' and nivel>20;
 /**
+-----------+-------+
|  nombre   | nivel |
+-----------+-------+
| Venusaur  | 45    |
| Venusaur  | 70    |
+-----------+-------+
 **/

-- Actualizar el tipo de Pikachu a "Eléctrico/Azul":
update Tipo as t set nombre='Electrico/Azul' from Pokemon as p where p.id_tipo=t.id and p.nombre='Pikachu';
select p.nombre, t.nombre from Pokemon as p, Tipo as t where p.id_tipo=t.id and p.nombre="Pikachu";
/**
+---------+----------------+
| nombre  |     nombre     |
+---------+----------------+
| Pikachu | Electrico/Azul |
+---------+----------------+
**/

-- Eliminar todos los Pokémon de tipo Planta.
delete from Pokemon where id_tipo in (select id from tipo where nombre='Planta');
select * from Pokemon as p, Tipo as t where p.id_tipo=t.id;
/**
+----+------------+---------+-------+----+----------------+
| id |   nombre   | id_tipo | nivel | id |     nombre     |
+----+------------+---------+-------+----+----------------+
| 2  | Charmander | 2       | 12    | 2  | Fuego          |
| 3  | Squirtle   | 1       | 9     | 1  | Agua           |
| 4  | Pikachu    | 4       | 15    | 4  | Electrico/Azul |
| 5  | Geodude    | 5       | 11    | 5  | Tierra         |
| 6  | Vaporeon   | 1       | 26    | 1  | Agua           |
| 7  | Flareon    | 2       | 27    | 2  | Fuego          |
| 9  | Jolteon    | 4       | 22    | 4  | Electrico/Azul |
| 10 | Cubone     | 5       | 14    | 5  | Tierra         |
| 11 | Gyarados   | 1       | 31    | 1  | Agua           |
| 12 | Arcanine   | 2       | 35    | 2  | Fuego          |
| 14 | Raichu     | 4       | 38    | 4  | Electrico/Azul |
| 15 | Sandslash  | 5       | 33    | 5  | Tierra         |
| 17 | Charizard  | 2       | 50    | 2  | Fuego          |
| 18 | Blastoise  | 1       | 56    | 1  | Agua           |
| 19 | Electabuzz | 4       | 48    | 4  | Electrico/Azul |
| 20 | Rhydon     | 5       | 52    | 5  | Tierra         |
| 21 | Dragonite  | 2       | 60    | 2  | Fuego          |
| 22 | Flareon    | 2       | 65    | 2  | Fuego          |
| 24 | Zapdos     | 4       | 75    | 4  | Electrico/Azul |
| 25 | Rhydon     | 5       | 80    | 5  | Tierra         |
+----+------------+---------+-------+----+----------------+
**/

-- Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.
select p.nombre, t.nombre from Pokemon as p, Tipo as t where p.id_tipo=t.id order by p.nombre asc;
/**
+------------+----------------+
|   nombre   |     nombre     |
+------------+----------------+
| Arcanine   | Fuego          |
| Blastoise  | Agua           |
| Charizard  | Fuego          |
| Charmander | Fuego          |
| Cubone     | Tierra         |
| Dragonite  | Fuego          |
| Electabuzz | Electrico/Azul |
| Flareon    | Fuego          |
| Flareon    | Fuego          |
| Geodude    | Tierra         |
| Gyarados   | Agua           |
| Jolteon    | Electrico/Azul |
| Pikachu    | Electrico/Azul |
| Raichu     | Electrico/Azul |
| Rhydon     | Tierra         |
| Rhydon     | Tierra         |
| Sandslash  | Tierra         |
| Squirtle   | Agua           |
| Vaporeon   | Agua           |
| Zapdos     | Electrico/Azul |
+------------+----------------+
**/

-- Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.
select * from Pokemon where (nombre like '%sa%');
/**
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 15 | Sandslash | 5       | 33    |
+----+-----------+---------+-------+
**/

-- Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.
select * from Pokemon where nivel in (40, 50, 60);
/**
+----+-----------+---------+-------+
| id |  nombre   | id_tipo | nivel |
+----+-----------+---------+-------+
| 17 | Charizard | 2       | 50    |
| 21 | Dragonite | 2       | 60    |
+----+-----------+---------+-------+
**/

-- Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.
select p.nombre, t.nombre from Pokemon as p, Tipo as t where p.id_tipo=t.id and t.nombre='Fuego' and (p.nombre like 'C%');
/**
+------------+--------+
|   nombre   | nombre |
+------------+--------+
| Charmander | Fuego  |
| Charizard  | Fuego  |
+------------+--------+
**/

-- Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.
select p.nombre, p.nivel from Pokemon as p, Tipo as t where p.id_tipo=t.id and p.nivel > (select avg(nivel) from Pokemon);
/**
+------------+-------+
|   nombre   | nivel |
+------------+-------+
| Raichu     | 38    |
| Charizard  | 50    |
| Blastoise  | 56    |
| Electabuzz | 48    |
| Rhydon     | 52    |
| Dragonite  | 60    |
| Flareon    | 65    |
| Zapdos     | 75    |
| Rhydon     | 80    |
+------------+-------+
**/
