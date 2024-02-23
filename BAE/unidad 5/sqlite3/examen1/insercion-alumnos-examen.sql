-- Creación de tablas
create table clase ( id entero not null,
max_alumnos entero not null
);
create table alumno (dni integer not null,
nombre integer not null,
apellido integer not null,
nota entero not null,
id_clase entero not null
);

-- Insercion de elementos
INSERT INTO clase (id, max_alumnos) 
VALUES (1, 30), (2, 25), (3, 20);
INSERT INTO alumno (dni, nombre, apellido, nota, id_clase) 
VALUES
    ('DNI123456A', 'Juan', 'Pérez', 85, 1),
    ('DNI789012B', 'María', 'Martínez', 92, 2),
    ('DNI345678C', 'Pedro', 'Gómez', 78, 1),
    ('DNI901234D', 'Ana', 'Martínez', 89, 3),
    ('DNI567890E', 'David', 'Fernández', 95, 2),
    ('DNI123890F', 'Laura', 'Pérez', 75, 1),
    ('DNI456789G', 'Carlos', 'Pérez', 88, 3),
    ('DNI234567H', 'Sara', 'García', 67, 2),
    ('DNI890123I', 'Javier', 'López', 76, 1),
    ('DNI345678J', 'Elena', 'Martínez', 94, 3);
