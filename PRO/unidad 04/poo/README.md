# Objetos y clases

## Índice
- [Programación orientada a objetos](#programación-orientada-a-objetos)
- [Creando objetos](creando-objetos)
- [Atributos](#atributos)
- [Métodos](#métodos)
- [Herencia](#herencia)
- [Estructuras mágicas](#estructuras-mágicas)
- [Estructura de una clase](#estructura-de-una-clase)

## Programación orientada a objetos
La Programación Orientada a Objetos (POO), también conocida como OOP por sus siglas en inglés, es un paradigma de programación que permite modelar el mundo real a través de entidades y comportamientos encapsulados en objetos.

Principales beneficios:
- **Encapsulamiento:** Capacidad de agrupar datos y comportamientos en un único objeto, controlando su acceso y modificación mediante la definición de interfaces.

- **Abstracción:** Posibilidad de representar conceptos del mundo real en forma de clases, lo que facilita la creación de modelos más simples y comprensibles.

- **Herencia:** Mecanismo que permite la creación de nuevas clases basadas en clases previamente definidas, lo que promueve la reutilización de código y la organización jerárquica de las estructuras.

- **Polimorfismo:** Facultad de utilizar un mismo nombre para métodos o funciones que actúan de manera distinta según el contexto, lo que promueve la flexibilidad y modularidad del código.

La utilización efectiva de la programación orientada a objetos mejora la mantenibilidad, escalabilidad y legibilidad del código, siendo fundamental en el desarrollo de aplicaciones robustas y eficientes.

### ¿Qué es un objeto?
Un objeto es una estructura de datos personalizada que contiene datos y código:

| Elemento | ¿Qué son? | Nombre en POO | ¿Cómo se identifican? |
|----------|------------|---------------|-----------------------|
| Datos    | Variables que describen las características del objeto. | Atributos | Mediante sustantivos |
| Código   | Funciones que definen el comportamiento del objeto. | Métodos | Mediante verbos |

Un objeto es una instancia única de alguna entidad que tiene atributos que describen su estado y métodos que definen su comportamiento. Los objetos interactúan entre sí o consigo mismos mediante el uso de estos métodos.

### ¿Qué es una clase?
La clase es como un molde que define la estructura y el comportamiento de los objetos que se van a crear a partir de ella.

El principio de responsabilidad única es fundamental en el diseño de clases y objetos. Este principio establece que una clase debe tener una única razón para cambiar, es decir, debe tener una única responsabilidad. Esto ayuda a mantener el código modular, fácil de entender, y facilita su mantenimiento.

## Creando objetos
### Añadiendo métodos
### Añadiendo atributos
### Inicialización
## Atributos
### Acceso directo
### Propiedades
#### Valores calculados
#### Cacheando propiedades
### Ocultando atributos
### Atributos de clase
## Métodos
### Métodos de instancia
#### Propiedades vs métodos
### Métodos de clase
### Métodos estáticos
#### Métodos decorados
### Métodos mágicos
#### Sobrecarga de operadores
#### __str__
#### __repr__
#### Gestores de contenido
## Herencia
### Heredar desde una clase base
### Sobreescribir un método
### Añadir un método
### Accediendo a la clase base
### Herencia múltiple
### Mixins
### Agregación y composición
## Estructuras mágicas
### Secuencias
### Diccionarios
### Iterables
#### Iterables desde fuera
#### Usando un iterador externo
#### Generadores como iteradores
#### Ejemplos de iterables
## Estructura de una clase
```python
class OrganizedClass:
    """Descripción de la clase"""

    # Constructor

    # Decoradores

    # Métodos de instancia

    # Propiedades

    # Métodos mágicos

    # Métodos de clase

    # Métodos estáticos

```
