# Tarea 4
## Creación de fichero supermercado-dump.sql.
Creamos el fichero nano supermercado-dump.sql.  en el que insertamos la información proporcionada debajo con el siguente comando:
```sql
nano supermercado-dump.sql.
```
```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```
## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea4.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read supermercado-dump.sql
```
## Respondiendo preguntas
### Realiza el diagrama ER de la BBDD supermercado.
[*Entidad-Relacion*](https://github.com/Chugani05/base-datos/blob/main/unidad%205/sqlite3/EntidadRelaci%C3%B3n.png)

### Realiza el diagrama MR de la BBDD supermercado.
[*Modelo Relacional*](https://github.com/Chugani05/base-datos/blob/main/unidad%205/sqlite3/ModeloRelacional.png)

### Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.
Las tablas proporcionadas cumplen con los requisitos de la Primera Forma Normal (1FN), ya que los valores en cada celda son atómicos e indivisibles, y existe una clave primaria única para identificar cada fila.

Asimismo, cumplen con la Segunda Forma Normal (2FN), ya que no presentan dependencias parciales en sus claves primarias. Cada atributo no clave depende completamente de la clave primaria correspondiente.

Además, cumplen con la Tercera Forma Normal (3FN), ya que no muestran dependencias transitivas. Cada atributo no clave depende directamente de la clave primaria sin la intervención de otros atributos.

En resumen, las tablas están estructuradas de manera normalizada hasta la Tercera Forma Normal, lo que garantiza un diseño eficiente y sin redundancias.

## Realización de consultas
### Mostrar todos los productos de la categoría "Bebidas".
```sql
select * from productos where categoria='Bebidas';
```
| id |      nombre      | categoria | precio |
|----|------------------|-----------|--------|
| 16 | Café             | Bebidas   | 5.0    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |

### Listar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio desc;
```
| id |       nombre       | categoria | precio |
|----|--------------------|-----------|--------|
| 5  | Pollo              | Carnes    | 5.5    |
| 16 | Café               | Bebidas   | 5.0    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 9  | Queso              | Lácteos   | 4.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
| 10 | Cereal             | Desayuno  | 3.5    |
| 4  | Manzanas           | Frutas    | 3.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 1  | Arroz              | Alimentos | 2.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 8  | Tomates            | Verduras  | 2.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 2  | Leche              | Lácteos   | 1.8    |
| 14 | Galletas           | Snacks    | 1.7    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 3  | Pan                | Panadería | 1.2    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |

### Calcular el precio total de todos los productos en la tabla "productos".
```sql
select sum(precio) as precio_total from productos;
```
| precio_total |
|--------------|
| 52.5         |

### Encontrar los productos con un nombre que contenga la letra 'a'.
```sql
select nombre from productos where (nombre like '%a');
```
|      nombre      |
|------------------|
| Aceite de Oliva  |
| Sopa enlatada    |
| Botellas de Agua |
| Cerveza          |

### Obtener la cantidad total de productos vendidos en todas las fechas.
```sql
select sum(cantidad) as cantidad_total from ventas;
```
| cantidad_total |
|----------------|
| 43             |

### Encontrar el producto más caro en cada categoría.
```sql
select nombre, categoria, max(precio) as precio_máximo from productos group by categoria;
```
|       nombre       | categoria | precio_máximo  |
|--------------------|-----------|----------------|
| Arroz              | Alimentos | 2.5            |
| Café               | Bebidas   | 5.0            |
| Pollo              | Carnes    | 5.5            |
| Aceite de Oliva    | Cocina    | 4.5            |
| Sopa enlatada      | Conservas | 2.3            |
| Cereal             | Desayuno  | 3.5            |
| Manzanas           | Frutas    | 3.0            |
| Cepillo de Dientes | Higiene   | 2.0            |
| Papel Higiénico    | Hogar     | 1.5            |
| Detergente         | Limpieza  | 2.8            |
| Queso              | Lácteos   | 4.0            |
| Pan                | Panadería | 1.2            |
| Galletas           | Snacks    | 1.7            |
| Tomates            | Verduras  | 2.2            |

### Listar los productos que no han sido vendidos.
```sql
select * from productos where id not in (select p.id from productos as p, ventas as v where p.id=v.id_producto);
```
| id |       nombre       | categoria | precio |
|----|--------------------|-----------|--------|
| 3  | Pan                | Panadería | 1.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 9  | Queso              | Lácteos   | 4.0    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |

### Calcular el precio promedio de los productos en la categoría "Snacks".
```sql
select avg(precio) as precio_promedio from productos where categoria='Snacks';
```
| precio_promedio |
|-----------------|
| 1.7             |

### Encontrar los productos que han sido vendidos más de 5 veces.
```sql
select nombre, cantidad from productos as p, ventas as v where p.id=v.id_producto and v.cantidad>5;
```
|    nombre     | cantidad |
|---------------|----------|
| Huevos        | 10       |
| Galletas      | 7        |
| Jabón de Baño | 6        |

### Mostrar la fecha y la cantidad de ventas para cada producto.
```sql
select p.id, p.nombre, v.fecha, v.cantidad from productos as p, ventas as v where p.id=v.id_producto;
```
| id |    nombre     |   fecha    | cantidad |
|----|---------------|------------|----------|
| 1  | Arroz         | 2024-01-17 | 5        |
| 2  | Leche         | 2024-01-17 | 3        |
| 4  | Manzanas      | 2024-01-17 | 2        |
| 5  | Pollo         | 2024-01-17 | 1        |
| 6  | Huevos        | 2024-01-18 | 10       |
| 8  | Tomates       | 2024-01-18 | 4        |
| 10 | Cereal        | 2024-01-18 | 2        |
| 14 | Galletas      | 2024-01-19 | 7        |
| 16 | Café          | 2024-01-19 | 3        |
| 18 | Jabón de Baño | 2024-01-20 | 6        |

### Encontrar los productos que tienen un precio menor o igual a 2.
```sql
select nombre, precio from productos where precio<=2;
```
|       nombre       | precio |
|--------------------|--------|
| Leche              | 1.8    |
| Pan                | 1.2    |
| Huevos             | 1.0    |
| Yogurt             | 2.0    |
| Papel Higiénico    | 1.5    |
| Cepillo de Dientes | 2.0    |
| Galletas           | 1.7    |
| Jabón de Baño      | 1.2    |
| Botellas de Agua   | 1.0    |

### Calcular la cantidad total de ventas para cada fecha.
```sql
select sum(cantidad) as cantidad_total, fecha from ventas group by fecha; 
```
| cantidad_total |   fecha    |
|----------------|------------|
| 11             | 2024-01-17 |
| 16             | 2024-01-18 |
| 10             | 2024-01-19 |
| 6              | 2024-01-20 |

### Listar los productos cuyo nombre comienza con la letra 'P'.
```sql
select * from productos where (nombre like 'P%');
```
| id |     nombre      | categoria | precio |
|----|-----------------|-----------|--------|
| 3  | Pan             | Panadería | 1.2    |
| 5  | Pollo           | Carnes    | 5.5    |
| 11 | Papel Higiénico | Hogar     | 1.5    |

### Obtener el producto más vendido en términos de cantidad.
```sql
select p.nombre, max(cantidad) as cantidad_máxima from productos as p, ventas as v where p.id=v.id_producto;
```
| nombre | cantidad_máxima |
|--------|-----------------|
| Huevos | 10              |

### Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
```sql
select p.nombre from productos as p, ventas as v where p.id=v.id_producto and fecha='2024-01-18';
```
| nombre  |
|---------|
| Huevos  |
| Tomates |
| Cereal  |

### Calcular el total de ventas para cada producto.
```sql
select p.nombre, v.cantidad from productos as p, ventas as v where p.id=v.id_producto;
```
|    nombre     | cantidad |
|---------------|----------|
| Arroz         | 5        |
| Leche         | 3        |
| Manzanas      | 2        |
| Pollo         | 1        |
| Huevos        | 10       |
| Tomates       | 4        |
| Cereal        | 2        |
| Galletas      | 7        |
| Café          | 3        |
| Jabón de Baño | 6        |

### Encontrar los productos con un precio entre 3 y 4.
```sql
select nombre, precio from productos where precio between 3 and 4;
```
|  nombre  | precio |
|----------|--------|
| Manzanas | 3.0    |
| Queso    | 4.0    |
| Cereal   | 3.5    |
| Cerveza  | 3.8    |

### Listar los productos y sus categorías ordenados alfabéticamente por categoría.
```sql
select nombre, categoria from productos order by categoria;
```
|       nombre       | categoria |
|--------------------|-----------|
| Arroz              | Alimentos |
| Café               | Bebidas   |
| Botellas de Agua   | Bebidas   |
| Cerveza            | Bebidas   |
| Pollo              | Carnes    |
| Aceite de Oliva    | Cocina    |
| Sopa enlatada      | Conservas |
| Cereal             | Desayuno  |
| Manzanas           | Frutas    |
| Cepillo de Dientes | Higiene   |
| Jabón de Baño      | Higiene   |
| Papel Higiénico    | Hogar     |
| Detergente         | Limpieza  |
| Leche              | Lácteos   |
| Huevos             | Lácteos   |
| Yogurt             | Lácteos   |
| Queso              | Lácteos   |
| Pan                | Panadería |
| Galletas           | Snacks    |
| Tomates            | Verduras  |

### Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
```sql
select sum(p.precio * v.cantidad) as ingresos from productos as p, ventas as v where p.id=v.id_producto and v.fecha='2024-01-19';
```
| ingresos |
|----------|
| 26.9     |

### Mostrar los productos que no pertenecen a la categoría "Higiene".
```sql
select nombre, categoria from productos where not categoria='Higiene';
```
|      nombre      | categoria |
|------------------|-----------|
| Arroz            | Alimentos |
| Leche            | Lácteos   |
| Pan              | Panadería |
| Manzanas         | Frutas    |
| Pollo            | Carnes    |
| Huevos           | Lácteos   |
| Yogurt           | Lácteos   |
| Tomates          | Verduras  |
| Queso            | Lácteos   |
| Cereal           | Desayuno  |
| Papel Higiénico  | Hogar     |
| Detergente       | Limpieza  |
| Galletas         | Snacks    |
| Aceite de Oliva  | Cocina    |
| Café             | Bebidas   |
| Sopa enlatada    | Conservas |
| Botellas de Agua | Bebidas   |
| Cerveza          | Bebidas   |

### Encontrar la cantidad total de productos en cada categoría.
```sql
select categoria, count(nombre) as cantidad_total from productos group by categoria;
```
| categoria | cantidad_total |
|-----------|----------------|
| Alimentos | 1              |
| Bebidas   | 3              |
| Carnes    | 1              |
| Cocina    | 1              |
| Conservas | 1              |
| Desayuno  | 1              |
| Frutas    | 1              |
| Higiene   | 2              |
| Hogar     | 1              |
| Limpieza  | 1              |
| Lácteos   | 4              |
| Panadería | 1              |
| Snacks    | 1              |
| Verduras  | 1              |

### Listar los productos que tienen un precio igual a la media de precios.
```sql
select * from productos where precio = (select avg(precio) from productos);
```
El precio medio de los productos era de 2.625, y teniendo en cuanta de que no hay ningun producto con ese precio no genera tabla.

### Calcular el precio total de los productos vendidos en cada fecha.
```sql
select fecha, sum(precio) as precio_total from productos, ventas where productos.id=ventas.id_producto group by fecha;
```
|   fecha    | precio_total |
|------------|--------------|
| 2024-01-17 | 12.8         |
| 2024-01-18 | 6.7          |
| 2024-01-19 | 6.7          |
| 2024-01-20 | 1.2          |

### Mostrar los productos con un nombre que termina con la letra 'o'.
```sql
select * from productos where (nombre like '%o');
```
| id |     nombre      | categoria | precio |
|----|-----------------|-----------|--------|
| 5  | Pollo           | Carnes    | 5.5    |
| 9  | Queso           | Lácteos   | 4.0    |
| 11 | Papel Higiénico | Hogar     | 1.5    |
| 18 | Jabón de Baño   | Higiene   | 1.2    |

### Encontrar los productos que han sido vendidos en más de una fecha.
```sql
select id_producto, count(distinct fecha) as fecha_venta from ventas group by id_producto having fecha_venta > 1;
# select id_producto from ventas as v where count(distinct (v.fecha) > 1) as fecha_venta;
# select p.id, p.nombre from productos as p, ventas as v where p.id=v.id_producto group by p.id, p.nombre having count(distinct (v.fecha)) > 1;
```
Al no haberse vendido ningún producto en más de una fecha no se genera tabla.

### Listar los productos cuya categoría comienza con la letra 'L'.
```sql
select * from productos where (categoria like 'L%');
```
| id |   nombre   | categoria | precio |
|----|------------|-----------|--------|
| 2  | Leche      | Lácteos   | 1.8    |
| 6  | Huevos     | Lácteos   | 1.0    |
| 7  | Yogurt     | Lácteos   | 2.0    |
| 9  | Queso      | Lácteos   | 4.0    |
| 13 | Detergente | Limpieza  | 2.8    |

### Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
```sql
select p.nombre, v.cantidad from productos as p, ventas as v where p.id=v.id_producto and fecha='2024-01-17';
```
|  nombre  | cantidad |
|----------|----------|
| Arroz    | 5        |
| Leche    | 3        |
| Manzanas | 2        |
| Pollo    | 1        |

### Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
```sql
select * from productos where length(nombre) >= 5;
```
| id |       nombre       | categoria | precio |
|----|--------------------|-----------|--------|
| 1  | Arroz              | Alimentos | 2.5    |
| 2  | Leche              | Lácteos   | 1.8    |
| 4  | Manzanas           | Frutas    | 3.0    |
| 5  | Pollo              | Carnes    | 5.5    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 8  | Tomates            | Verduras  | 2.2    |
| 9  | Queso              | Lácteos   | 4.0    |
| 10 | Cereal             | Desayuno  | 3.5    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 14 | Galletas           | Snacks    | 1.7    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |

### Encontrar los productos que tienen un precio superior al precio medio en la tabla "productos".
```sql
select * from productos where precio > (select avg(precio) from productos);
```
| id |     nombre      | categoria | precio |
|----|-----------------|-----------|--------|
| 4  | Manzanas        | Frutas    | 3.0    |
| 5  | Pollo           | Carnes    | 5.5    |
| 9  | Queso           | Lácteos   | 4.0    |
| 10 | Cereal          | Desayuno  | 3.5    |
| 13 | Detergente      | Limpieza  | 2.8    |
| 15 | Aceite de Oliva | Cocina    | 4.5    |
| 16 | Café            | Bebidas   | 5.0    |
| 20 | Cerveza         | Bebidas   | 3.8    |