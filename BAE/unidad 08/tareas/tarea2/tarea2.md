# Tarea 2
# Tarea Procedimientos

## Carga de datos
Relizamos la carga de datos creando un archivo sql con los datos de la base de datos. Ejecuta la linea `source jardineria.sql` en la terminal de MySql, que nos proporciona una base de datos llamada jardineria que contiene las siguientes tablas:
```sql
show databases;
```
| Database           |
|--------------------|
| Base_Indices       |
| SimpleDB           |
| information_schema |
| jardineria         |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| tarea1             |
| tarea2             |
| tarea3             |
| tarea71            |
| tarea72            |
| tarea7_4           |

## Se pide realizar los procedimientos y funciones:
### Realice los siguientes procedimientos y funciones sobre la base de datos jardineria.
- Función  __calcular_precio_total_pedido__
  >__Nota__:Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
   - Parámetros de entrada: codigo_pedido (INT)
   - Parámetros de salida: El precio total del pedido (FLOAT)
```sql
DELIMITER //
DROP FUNCTION IF EXISTS calcular_precio_total_pedido;
CREATE FUNCTION calcular_precio_total_pedido(codigo_pedido int)
RETURNS float deterministic
BEGIN
    DECLARE precio_total float;
    SELECT SUM(precio_unidad * cantidad) FROM detalle_pedido AS d WHERE d.codigo_pedido = codigo_pedido INTO precio_total;
    RETURN precio_total;
END //
DELIMITER ;
```

Comprobamos que la funcion funcione mediante:
```sql
select calcular_precio_total_pedido(13);
```
| calcular_precio_total_pedido(13) |
|----------------------------------|
|                              738 |




- Función  __calcular_suma_pedidos_cliente__
  >__Nota__:Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.
  - Parámetros de entrada: codigo_cliente (INT)
  - Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)

```sql
DELIMITER //
DROP FUNCTION IF EXISTS calcular_suma_pedidos_cliente;
CREATE FUNCTION calcular_suma_pedidos_cliente(codigo_cliente int)
RETURNS float deterministic
BEGIN
    DECLARE suma_total float;
    SELECT COUNT(codigo_cliente) FROM pedido AS p WHERE p.codigo_cliente = codigo_cliente INTO suma_total;
    RETURN suma_total;
END//
DELIMITER ;
```

Comprobamos que la funcion funcione mediante:
```sql
select calcular_suma_pedidos_cliente(19);
```
| calcular_suma_pedidos_cliente(19) |
|-----------------------------------|
|                                 5 |



- Función __calcular_suma_pagos_cliente__
  >__Nota__:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
  - Parámetros de entrada: codigo_cliente (INT)
  - Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)
```sql
DELIMITER //
DROP FUNCTION IF EXISTS calcular_suma_pagos_cliente;
CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INT)
RETURNS float deterministic
BEGIN
    DECLARE suma_total float;
    SELECT SUM(total) FROM pago AS p WHERE p.codigo_cliente = codigo_cliente INTO suma_total;
    RETURN suma_total;
END//
DELIMITER ;
```

Comprobamos que la funcion funcione mediante:
```sql
select calcular_suma_pagos_cliente(7);
```
| calcular_suma_pagos_cliente(7) |
|--------------------------------|
|                           2390 |


- Procedimiento __calcular_pagos_pendientes__
  >__Nota__:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS calcular_pagos_pendientes;
CREATE PROCEDURE calcular_pagos_pendientes() 
BEGIN 
    ;
END //
DELIMITER ;
```

Calculamos los pagos pendientes mediante:
```sql
call calcular_pagos_pendientes();
```
