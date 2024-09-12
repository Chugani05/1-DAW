# Tarea 8
## Creación de fichero base-datos-clientes.sql.
Creamos un fichero nano en el que insertamos la información proporcionada en el archivo adjunto en la carpeta tarea8 con el siguente comando:

```sql
nano base-datos-clientes.sql
```

## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea8.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read base-datos-clientes.sql
```

## Realización de consultas
### Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
```sql
select cl.nombre, cl.edad, co.marca from clientes as cl, coches as co, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.marca='Toyota';
```
|   nombre   | edad | marca  |
|------------|------|--------|
| Juan Pérez | 30   | Toyota |

### Consulta para calcular el precio promedio de los coches vendidos.
```sql
select round(avg(co.precio), 2) as precio_promedio_ventas from coches as co, ventas as v where co.id_coche=v.id_coche;
```
| precio_promedio_ventas |
|------------------------|
| 28777.78               |

### Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
```sql
select co.modelo, co.marca, cl.edad from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.edad < 30;
```
|     modelo     |   marca   | edad |
|----------------|-----------|------|
| Hatchback 2021 | Honda     | 25   |
| Coupé 2022     | Chevrolet | 28   |
| Híbrido 2022   | Hyundai   | 27   |
| Eléctrico 2021 | Tesla     | 29   |

### Consulta para contar el número de coches vendidos de cada marca.
```sql
select marca, count(*) as cantidad from coches group by marca;
```
|   marca    | cantidad |
|------------|----------|
| Chevrolet  | 1        |
| Ford       | 1        |
| Honda      | 1        |
| Hyundai    | 1        |
| Mazda      | 1        |
| Nissan     | 1        |
| Ram        | 1        |
| Tesla      | 1        |
| Toyota     | 1        |
| Volkswagen | 1        |

### Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
```sql
select cl.nombre, cl.direccion, r.fecha_reparación from clientes as cl, reparacion as r where cl.id_cliente=r.id_cliente and r.fecha_reparación regexp '2024';
```
|     nombre      |   direccion    | fecha_reparación |
|-----------------|----------------|------------------|
| Francisco Ruiz  | Calle I #222   | 2024-01-05       |
| Elena Torres    | Avenida J #333 | 2024-02-10       |
| Juan Pérez      | Calle A #123   | 2024-03-15       |
| María Gómez     | Avenida B #456 | 2024-04-20       |
| Carlos López    | Calle C #789   | 2024-05-25       |
| Ana Martínez    | Avenida D #101 | 2024-06-10       |
| Pedro Rodríguez | Calle E #234   | 2024-07-05       |
| Laura Sánchez   | Avenida F #567 | 2024-08-15       |
| Miguel González | Calle G #890   | 2024-09-20       |
| Isabel Díaz     | Avenida H #111 | 2024-10-25       |
| Francisco Ruiz  | Calle I #222   | 2024-11-05       |
| Elena Torres    | Avenida J #333 | 2024-12-10       |

### Consulta para calcular el total gastado en reparaciones por cada cliente.
```sql
select cl.nombre, sum(r.precio) as gasto_total_reparaciones from clientes as cl, reparacion as r where cl.id_cliente=r.id_cliente group by cl.nombre;
```
-- no hay columna precio en reparaciones

### Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
```sql
select cl.nombre, cl.edad, co.precio from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.precio > 30000;
```
|     nombre      | edad | precio  |
|-----------------|------|---------|
| Pedro Rodríguez | 40   | 32000.0 |
| Isabel Díaz     | 38   | 35000.0 |
| Elena Torres    | 29   | 40000.0 |

### Consulta para calcular el precio medio de los coches vendidos en 2023.
```sql
select round(avg(co.precio), 2) as precio_promedio_ventas_2023 from coches as co, ventas as v where co.id_coche=v.id_coche and v.fecha_venta regexp '2023';
```
| precio_promedio_ventas_2023 |
|-----------------------------|
| 28777.78                    |

### Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
```sql
select cl.nombre, cl.direccion from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.marca='Ford';
```
|    nombre    |  direccion   |
|--------------|--------------|
| Carlos López | Calle C #789 |

### Consulta para contar el número de coches vendidos por año.
```sql
select substr(fecha_venta, 1, 4) as año, count(*) as cantidad_ventas from ventas group by año;
```
| año  | cantidad_ventas |
|------|-----------------|
| 2023 | 9               |

### Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
```sql
select cl.nombre, cl.edad, co.precio from coches as co, clientes as cl, ventas as v, reparacion as r where cl.id_cliente=v.id_cliente=r.id_cliente and co.id_coche=v.id_coche=r.id_coche and co.precio > 30000;
```
|     nombre      | edad | precio  |
|-----------------|------|---------|
| Pedro Rodríguez | 40   | 32000.0 |
| Isabel Díaz     | 38   | 35000.0 |
| Elena Torres    | 29   | 40000.0 |

### Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
```sql
select distinct sum(co.precio) as precio_total_ventas from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.edad < 30;
```
| precio_total_ventas |
|---------------------|
| 117000.0            |

### Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
```sql
select distinct(co.modelo) from coches as co, ventas as v, reparacion as r where co.id_coche=v.id_coche=r.id_coche and v.fecha_venta regexp '2023';
```
|     modelo     |
|----------------|
| Sedán 2022     |
| Hatchback 2021 |
| SUV 2023       |
| Coupé 2022     |
| Camioneta 2023 |
| Compacto 2021  |
| Híbrido 2022   |
| Deportivo 2023 |
| Eléctrico 2021 |

### Consulta para contar el número de coches vendidos por cliente.
```sql
select cl.id_cliente, cl.nombre, count(*) as coches_vendidos from clientes as cl, ventas as v where cl.id_cliente=v.id_cliente group by cl.id_cliente;
```
| id_cliente |     nombre      | coches_vendidos |
|------------|-----------------|-----------------|
| 1          | Juan Pérez      | 1               |
| 2          | María Gómez     | 1               |
| 3          | Carlos López    | 1               |
| 4          | Ana Martínez    | 1               |
| 5          | Pedro Rodríguez | 1               |
| 6          | Laura Sánchez   | 1               |
| 7          | Miguel González | 1               |
| 8          | Isabel Díaz     | 1               |
| 10         | Elena Torres    | 1               |

### Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
```sql
select cl.nombre, co.precio, cl.edad from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.edad > 35;
```
|     nombre      | precio  | edad |
|-----------------|---------|------|
| Pedro Rodríguez | 32000.0 | 40   |
| Isabel Díaz     | 35000.0 | 38   |

### Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
```sql
select sum(co.precio) as precio_total from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.direccion regexp 'Calle';
```
| precio_total |
|--------------|
| 114000.0     |

### Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
```sql
select cl.nombre, cl.direccion from coches as co, clientes as cl, ventas as v, reparacion as r where cl.id_cliente=v.id_cliente=r.id_cliente and co.id_coche=v.id_coche=r.id_coche and co.precio > 30000 and r.fecha_reparación regexp '2024';
```
-- La consulta se devuelve vacía

### Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
```sql
select avg(co.precio) as precio_medio_ventas_2023 from clientes as cl, coches as co, ventas as v, reparacion as r where co.id_coche=v.id_coche=r.id_coche and cl.id_cliente=v.id_cliente=r.id_cliente and v.fecha_venta regexp '2023' and cl.edad > 30;
```
| precio_medio_ventas_2023 |
|--------------------------|
| 29250.0                  |

### Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
```sql
select co.modelo, co.año from clientes as cl, coches as co, ventas as v where cl.id_cliente=v.id_cliente and v.id_coche=co.id_coche and cl.direccion regexp 'Avenida';
```
|     modelo     | año  |
|----------------|------|
| Hatchback 2021 | 2021 |
| Coupé 2022     | 2022 |
| Compacto 2021  | 2021 |
| Deportivo 2023 | 2023 |
| Eléctrico 2021 | 2021 |

### Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
```sql
select cl.id_cliente, cl.nombre, count(*) as cantidad_reparaciones from clientes as cl, reparacion as r where cl.id_cliente=r.id_cliente group by cl.id_cliente;
```
| id_cliente |     nombre      | cantidad_reparaciones |
|------------|-----------------|-----------------------|
| 1          | Juan Pérez      | 2                     |
| 2          | María Gómez     | 2                     |
| 3          | Carlos López    | 2                     |
| 4          | Ana Martínez    | 2                     |
| 5          | Pedro Rodríguez | 2                     |
| 6          | Laura Sánchez   | 2                     |
| 7          | Miguel González | 2                     |
| 8          | Isabel Díaz     | 2                     |
| 9          | Francisco Ruiz  | 2                     |
| 10         | Elena Torres    | 2                     |