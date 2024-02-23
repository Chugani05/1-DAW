# Tarea 2
## Creación de tablas
```sql
create table Propietarios (
    id integer primary key autoincrement,
    nombre text not null,
    apellido text not null,
    dni text unicode
);
create table Vehiculos (
    id integer primary key autoincrement,
    marca text not null,
    modelo text not null,
    anio integer not null,
    id_propietario integer	references propietario(id)
);
```
## Inserción de valores
```sql
insert into Propietarios (nombre, apellido, dni)
values ('Juan', 'Perez', '12345678A'),
('Maria', 'Lopez', '87654321B'),
('Carlos', 'Ruiz', '11111111C'),
('Laura', 'Gomez', '22222222D'),
('Pedro', 'Martinez', '33333333E'),
('Ana', 'Fernandez', '44444444F'),
('Diego', 'Sanchez', '55555555G'),
('Sofia', 'Torres', '66666666H'),
('Javier', 'Leon', '77777777I'),
('Lucia', 'Castillo', '88888888J'),
('Luis', 'Gonzalez', '99999999K'),
('Marta', 'Diaz', '10101010L'),
('Victor', 'Vargas', '11111112M'),
('Elena', 'Castro', '12121212N'),
('Roberto', 'Blanco', '13131313O'),
('Natalia', 'Paredes', '14141414P'),
('Fernando', 'Herrera', '15151515Q'),
('Clara', 'Soto', '16161616R'),
('Sergio', 'Mendoza', '17171717S'),
('Patricia', 'Navarro', '18181818T');
```
```sql
insert into Vehiculos (marca, modelo, anio, id_propietario)
values ('Ford', 'Fiesta', 2019, 1),
('Toyota', 'Corolla', 2018, 2),
('Nissan', 'Sentra', 2020, 3),
('Chevrolet', 'Spark', 2017, 4),
('Honda', 'Civic', 2016, 5),
('Ford', 'Mustang', 2021, 6),
('Toyota', 'RAV4', 2019, 7),
('Volkswagen', 'Golf', 2020, 8),
('Honda', 'CR-V', 2018, 9),
('Nissan', 'Altima', 2017, 10),
('Chevrolet', 'Malibu', 2019, 11),
('Toyota', 'Camry', 2020, 12),
('Honda', 'Accord', 2018, 13),
('Ford', 'Explorer', 2021, 14),
('Nissan', 'Rogue', 2017, 15),
('Volkswagen', 'Jetta', 2019, 16),
('Chevrolet', 'Equinox', 2018, 17),
('Toyota', 'Highlander', 2020, 18),
('Honda', 'Odyssey', 2016, 19),
('Nissan', 'Murano', 2019, 20);
```

## Consultas
### Seleccionar todos los propietarios.
```sql
select * from Propietarios;
```
| id |  nombre  | apellido  |    dni    |
|----|----------|-----------|-----------|
| 1  | Juan     | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |

### Listar todos los vehículos.
```sql
select * from Vehiculos;
```
| id |   marca    |   modelo   | anio | id_propietario |
|----|------------|------------|------|----------------|
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |

### Seleccionar solo los nombres y apellidos de los propietarios.
```sql
select nombre, apellido from Propietarios;
```
|  nombre  | apellido  |
|----------|-----------|
| Juan     | Perez     |
| Maria    | Lopez     |
| Carlos   | Ruiz      |
| Laura    | Gomez     |
| Pedro    | Martinez  |
| Ana      | Fernandez |
| Diego    | Sanchez   |
| Sofia    | Torres    |
| Javier   | Leon      |
| Lucia    | Castillo  |
| Luis     | Gonzalez  |
| Marta    | Diaz      |
| Victor   | Vargas    |
| Elena    | Castro    |
| Roberto  | Blanco    |
| Natalia  | Paredes   |
| Fernando | Herrera   |
| Clara    | Soto      |
| Sergio   | Mendoza   |
| Patricia | Navarro   |

### Listar todas las marcas y modelos de los vehículos.
```sql
select marca, modelo from Vehiculos;
```
|   marca    |   modelo   |
|------------|------------|
| Ford       | Fiesta     |
| Toyota     | Corolla    |
| Nissan     | Sentra     |
| Chevrolet  | Spark      |
| Honda      | Civic      |
| Ford       | Mustang    |
| Toyota     | RAV4       |
| Volkswagen | Golf       |
| Honda      | CR-V       |
| Nissan     | Altima     |
| Chevrolet  | Malibu     |
| Toyota     | Camry      |
| Honda      | Accord     |
| Ford       | Explorer   |
| Nissan     | Rogue      |
| Volkswagen | Jetta      |
| Chevrolet  | Equinox    |
| Toyota     | Highlander |
| Honda      | Odyssey    |
| Nissan     | Murano     |

### Seleccionar solo los propietarios con apellido "Perez".
```sql
select nombre, apellido from Propietarios where apellido='Perez';
```
| nombre | apellido |
|--------|----------|
| Juan   | Perez    |

### Listar todos los vehículos con año 2019.
```sql
select * from Vehiculos where anio=2019;
```
| id |   marca    | modelo | anio | id_propietario |
|----|------------|--------|------|----------------|
| 1  | Ford       | Fiesta | 2019 | 1              |
| 7  | Toyota     | RAV4   | 2019 | 7              |
| 11 | Chevrolet  | Malibu | 2019 | 11             |
| 16 | Volkswagen | Jetta  | 2019 | 16             |
| 20 | Nissan     | Murano | 2019 | 20             |

### Seleccionar propietarios que tienen vehículos de la marca "Toyota".
```sql
select * from Propietarios as prop, Vehiculos as veh where veh.id_propietario = prop.id and veh.marca='Toyota';
```
| id | nombre | apellido |    dni    | id | marca  |   modelo   | anio | id_propietario |
|----|--------|----------|-----------|----|--------|------------|------|----------------|
| 2  | Maria  | Lopez    | 87654321B | 2  | Toyota | Corolla    | 2018 | 2              |
| 7  | Diego  | Sanchez  | 55555555G | 7  | Toyota | RAV4       | 2019 | 7              |
| 12 | Marta  | Diaz     | 10101010L | 12 | Toyota | Camry      | 2020 | 12             |
| 18 | Clara  | Soto     | 16161616R | 18 | Toyota | Highlander | 2020 | 18             |

### Listar vehículos con marca "Ford" y modelo "Fiesta".
```sql
select * from Vehiculos where marca='Ford' and modelo='Fiesta';
```
| id | marca | modelo | anio | id_propietario |
|----|-------|--------|------|----------------|
| 1  | Ford  | Fiesta | 2019 | 1              |

### Seleccionar propietarios con DNI "12345678A".
```sql
select * from Propietarios where dni='12345678A';
```
| id | nombre | apellido |    dni    |
|----|--------|----------|-----------|
| 1  | Juan   | Perez    | 12345678A |

### Listar vehículos que pertenecen al propietario con ID 5.
```sql
select * from Vehiculos where id=5;
```
| id | marca | modelo | anio | id_propietario |
|----|-------|--------|------|----------------|
| 5  | Honda | Civic  | 2016 | 5              |

## Updates 
### Actualizar el nombre de un propietario con DNI "12345678A".
```sql
update Propietarios set nombre='Juana' where dni='12345678A';
```
| id |  nombre  | apellido  |    dni    |
|----|----------|-----------|-----------|
| 1  | Juana    | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |

### Modificar el año de un vehículo con ID 3 a 2022.
```sql
update Vehiculos set anio=2022 where id=3;
```
| id |   marca    |   modelo   | anio | id_propietario |
|----|------------|------------|------|----------------|
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |

### Cambiar el modelo de todos los vehículos Nissan a "Micra".
```sql
update Vehiculos set modelo='Micra' where marca='Nissan';
```
| id |   marca    |   modelo   | anio | id_propietario |
|----|------------|------------|------|----------------|
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Micra      | 2019 | 20             |

### Actualizar el apellido de un propietario con ID 7 a "Gomez".
```sql
update Propietarios set apellido='Gomez' where id=7;
```
| id |  nombre  | apellido  |    dni    |
|----|----------|-----------|-----------|
| 1  | Juana    | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Gomez     | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |

### Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".
```sql
update Vehiculos  set marca='Renault' where modelo='Fiesta';
```
| id |   marca    |   modelo   | anio | id_propietario |
|----|------------|------------|------|----------------|
| 1  | Renault    | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Micra      | 2019 | 20             |