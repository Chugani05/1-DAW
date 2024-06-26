# Objetos y clases

<div align=center>
<img src="../../../extras/winter.gif" alt="me" width="60%">
</div>

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
Se cea una clase de la siguiente forma:
```python
class CreandoObjetos:
    pass
```
> [!NOTE]
> Donde esta puesto el `pass` va el código de la clase.

Para decir que una instancia pentenece a una clase se hace de la siguiente forma:
```python
objeto1 = CreandoObjetos()
objeto2 = CreandoObjetos()
```

### Añadiendo métodos
Un método es una función asociada a una clase u objeto. Tiene acceso a los atributos y otros métodos de la clase u objeto al que pertenece. Su definición es similar a la de una función ordinaria, pero incluye un primer parámetro llamado `self`, que referencia a la instancia actual del objeto. Esto permite que el método pueda operar sobre los datos específicos de esa instancia.

```python
class Droid:
    def switch_on(self):
        print("Hi! I'm a droid. Can I help you?")

    def switch_off(self):
        print("Bye! I'm going to sleep")

# Crea una instancia de clase Droid
k2so = Droid()

# LLama al método `switch_on`
k2so.switch_on()  # Output: Hi! I'm a droid. Can I help you?

# LLama al método `switch_off`
k2so.switch_off()  # Output: Bye! I'm going to sleep
```

### Añadiendo atributos
Los atributos son esenciales para definir el estado de un objeto. En el contexto de un droide, podríamos tener un atributo llamado "estado" que almacene si el droide está encendido o apagado.

```python
class Droid:
    def switch_on(self):
        self.power_on = True
        print("Hi! I'm a droid. Can I help you?")

    def switch_off(self):
        self.power_on = False
        print("Bye! I'm going to sleep")
```
Este código define una clase llamada `Droid`, que representa un droide. La clase tiene dos métodos: `switch_on()` y `switch_off()`.

- El método `switch_on()` activa el droide al establecer el atributo `power_on` en `True` e imprime un mensaje.
- El método `switch_off()` desactiva el droide al establecer el atributo `power_on` en `False` e imprime otro mensaje.

```python
k2so = Droid()

k2so.switch_on()  # Output: Hi! I'm a droid. Can I help you?
print(k2so.power_on)  # Output: True

k2so.switch_off()  # Output: Bye! I'm going to sleep
print(k2so.power_on)  # Output: False
```
Luego, se crea una instancia de la clase `Droid` llamada `k2so`.

Cuando se llama al método `switch_on()` en la instancia `k2so`, el mensaje "Hi! I'm a droid. Can I help you?" se imprime en la consola, y el atributo `power_on` de la instancia `k2so` se establece en `True`.

Cuando se llama al método `switch_off()`, el mensaje "Bye! I'm going to sleep" se imprime en la consola, y el atributo `power_on` de la instancia `k2so` se establece en `False`.

> [!IMPORTANT]
> Siempre que queramos acceder a algún método o atributo del objeto habrá que utilizar `self`.

### Inicialización
El método `__init__` es el constructor de una clase. Se ejecuta automáticamente cuando se crea una nueva instancia del objeto. Es útil para inicializar los atributos del objeto o realizar cualquier otra tarea necesaria en el momento de la creación.

```python
class Droid:
    def __init__(self, name: str):
        self.name = name

# Creación de una instancia de la clase Droid con nombre 'BB-8'
droid = Droid('BB-8')

# Accede al atributo 'name' creado previamente en el constructor
print(droid.name)  # Output: 'BB-8'
```
La línea 2 define el constructor `__init__`, que toma un parámetro `name` y lo asigna como un atributo del objeto `self.name`. Luego, en la línea 7, cuando creamos una instancia de la clase `Droid` con `droid = Droid('BB-8')`, se llama implícitamente al método `__init__`, pasando `'BB-8'` como argumento para el parámetro `name`. Finalmente, en la línea 9, podemos acceder al atributo `name` del objeto `droid`.

> [!IMPORTANT]
> Hay que tener en cuenta que si no usamos `self` estaremos creando una variable local en vez de un atributo del objeto lo que producirá un error.

## Atributos
### Acceso directo
Aunque se cree un atributo en el constructor de la clase, este se puede modificar desde "fuera" con un acceso directo:

```python
class Droid:
    def __init__(self, name: str):
        self.name = name

droid = Droid('C-3PO')

droid.name # Output: 'C-3PO'

# Aquí estamos accediendo al atributo `name` para modificarla
droid.name = 'waka-waka'
```

También se pueden añadir atributos después de su creación:

```python
droid.manufacturer = 'Cybot Galactica'
droid.height = 1.77
```

### Propiedades
Las propiedades permiten definir métodos para acceder (get) y modificar (set) los atributos de una clase, manteniendo así un control más estricto sobre cómo se accede y se cambia el estado de los objetos.

Los decoradores en Python proporcionan una forma elegante y concisa de aplicar propiedades. Los dos decoradores más comúnmente utilizados para este propósito son **`@property`** y **`@name.setter`**. A continuación se explica cómo se utilizan:

El **decorador `@property`** se utiliza para definir un método que actúa como un getter. Es decir, se usa para leer el valor de un atributo. Este método se define como si fuera un atributo regular, pero proporciona una interfaz controlada para acceder al valor.

```python
class Persona:
    def __init__(self, nombre):
        self._nombre = nombre

    @property
    def nombre(self):
        return self._nombre
```

En este ejemplo, `nombre` es un método que actúa como un getter para el atributo `_nombre`. Cuando se accede a `persona.nombre`, se llama al método `nombre`.

El **decorador `@name.setter`** se utiliza para definir un método que actúa como un setter. Es decir, se usa para escribir o modificar el valor de un atributo.

```python
class Persona:
    def __init__(self, nombre):
        self._nombre = nombre

    @property
    def nombre(self):
        return self._nombre

    @nombre.setter
    def nombre(self, valor):
        if isinstance(valor, str) and valor:
            self._nombre = valor
        else:
            raise ValueError("El nombre debe ser una cadena no vacía")
```

Aquí, se ha definido un setter para el atributo `nombre`. Este setter asegura que solo se puedan asignar valores que sean cadenas no vacías al atributo `_nombre`.

Aún así, podemos seguir accediendo a los atributos directamente, incluso cambiar su valor.

#### Valores calculados
Las propiedades no solo se utilizan para acceder y modificar atributos, sino que también pueden emplearse para devolver valores calculados. Esto es útil cuando el valor que se desea obtener depende de otros atributos o requiere algún tipo de procesamiento.

Imagina que tienes una clase `Rectangulo` con atributos `ancho` y `alto`, y quieres que la clase también tenga una propiedad `area` que devuelva el área del rectángulo, la cual se calcula multiplicando el ancho por el alto.

```python
class Rectangulo:
    def __init__(self, ancho, alto):
        self.ancho = ancho
        self.alto = alto

    @property
    def area(self):
        return self.ancho * self.alto

    @property
    def perimetro(self):
        return 2 * (self.ancho + self.alto)
```

> [!IMPORTANT]
> Las propiedades no pueden recibir parámetros.

#### Cacheando propiedades
El almacenamiento en caché de propiedades en Python puede mejorar el rendimiento al evitar cálculos repetitivos de valores que no cambian con frecuencia.

Este método implica utilizar un atributo privado para almacenar el valor calculado y un decorador para manejar el caché.

```python
class Rectangulo:
    def __init__(self, ancho, alto):
        self.ancho = ancho
        self.alto = alto
        self._area = None  # Atributo privado para cachear el valor

    @property
    def area(self):
        if self._area is None:  # Calcula solo si no está cacheado
            self._area = self.ancho * self.alto
        return self._area

    def reset_cache(self):
        self._area = None  # Resetea el caché

    def set_dimensions(self, ancho, alto):
        self.ancho = ancho
        self.alto = alto
        self.reset_cache()  # Resetea el caché cuando cambian las dimensiones
```

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
