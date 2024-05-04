# Normalización
La normalización, en términos generales, se refiere al proceso de organizar datos en una base de datos de manera eficiente para reducir la redundancia y mejorar la integridad de los datos. Se utiliza comúnmente en el diseño de bases de datos relacionales. Aquí hay una explicación breve y resumida de los conceptos clave:

**Eliminación de redundancias:** La normalización busca minimizar la redundancia en una base de datos al organizar la información de manera eficiente. Se logra dividiendo las tablas grandes en tablas más pequeñas y relacionadas.

**Formas normales:** La normalización se logra a través de una serie de formas normales, que son reglas que definen la estructura de una base de datos normalizada. Las formas normales más comunes son la Primera Forma Normal (1NF), la Segunda Forma Normal (2NF) y la Tercera Forma Normal (3NF). Cada forma normal tiene reglas específicas que deben cumplirse para garantizar la organización eficiente de los datos.

**Clave primaria y dependencias:** La clave primaria es un atributo o conjunto de atributos que identifica de manera única cada fila en una tabla. La normalización se centra en eliminar las dependencias no deseadas en los datos, asegurando que la información esté organizada de manera lógica y coherente.

## Primera Forma Normal (1FN):
En 1FN, garantiza que cada celda en una tabla contenga un solo valor atómicos, evitando la presencia de atributos multievaluados y atributos compuestos en una sola celda.

**Ejemplo no en 1FN:**
Tabla: Empleados
| ID | Nombre    | Teléfonos                   |
|----|-----------|-----------------------------|
| 1  | Juan      | 123-456-7890, 555-123-4567  |
| 2  | María     | 987-654-3210                |
| 3  | Carlos    | 555-123-4567, 987-654-3210  |

En este ejemplo, la columna "Teléfonos" viola la 1FN porque contiene múltiples valores en una sola celda. 

**Corregido (en 1FN):**
Tabla: Empleados
| ID | Nombre | Teléfono       |
|----|--------|----------------|
| 1  | Juan   | 123-456-7890   |
| 1  | Juan   | 555-123-4567   |
| 2  | María  | 987-654-3210   |
| 3  | Carlos | 555-123-4567   |
| 3  | Carlos | 987-654-3210   |

## Segunda Forma Normal (2FN):
En 2FN, elimina la dependencia parcial, asegurando que todos los atributos no clave dependan completamente de la clave primaria.

**Ejemplo no en 2FN:**
Tabla: Ventas
| ID Venta | Producto    | Precio | Categoría    |
|----------|-------------|--------|--------------|
| 1        | Laptop      | 1000   | Electrónica  |
| 2        | Teléfono    | 500    | Electrónica  |
| 3        | Camiseta    | 20     | Ropa         |

En este ejemplo, "Categoría" depende solo parcialmente de la clave primaria (ID Venta, Producto), ya que la categoría está relacionada solo con el producto, no con toda la clave primaria.

**Corregido (en 2FN):**
Tabla: Productos
| Producto   | Categoría    |
|------------|--------------|
| Laptop     | Electrónica  |
| Teléfono   | Electrónica  |
| Camiseta   | Ropa         |

Tabla: Ventas
| ID Venta | Producto    | Precio |
|----------|-------------|--------|
| 1        | Laptop      | 1000   |
| 2        | Teléfono    | 500    |
| 3        | Camiseta    | 20     |

## Tercera Forma Normal (3FN):
En 3FN, elimina la dependencia transitiva, asegurando que los atributos no clave no dependan de otros atributos no clave.

**Ejemplo no en 3FN:**
Tabla: Empleados
| ID | Departamento | Jefe ID | Jefe Nombre |
|----|--------------|---------|-------------|
| 1  | IT           | 3       | Carlos      |
| 2  | Ventas       | 1       | Juan        |
| 3  | Finanzas     | NULL    | NULL        |

En este ejemplo, "Jefe Nombre" depende tanto de "Jefe ID" como de "ID". Esto crea una dependencia transitiva.

**Corregido (en 3FN):**
Tabla: Empleados
| ID | Departamento | Jefe ID |
|----|--------------|---------|
| 1  | IT           | 3       |
| 2  | Ventas       | 1       |
| 3  | Finanzas     | NULL    |

Tabla: Jefes
| Jefe ID | Jefe Nombre |
|---------|-------------|
| 1       | Juan        |
| 3       | Carlos      |

En este ejemplo, se separa la información del jefe en una tabla aparte para eliminar la dependencia transitiva.
