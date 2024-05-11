# Excepciones

## Índice
- [Manejo de errores](#manejo-de-errores)
- [Exepciones propias](#exepciones-propias)
- [Aserciones](#aserciones)

## Manejo de errores
En Python, las excepciones juegan un papel crucial en el manejo de errores durante la ejecución del programa. Cuando una excepción no es capturada en un punto específico de nuestro código, se propaga hacia arriba en la pila de llamadas hasta que es manejada por una función que ha hecho la llamada. Si no se encuentra un control de excepciones en toda la pila de llamadas, Python muestra un mensaje de error junto con información adicional.

El uso del bloque `try` y `except` nos permite manejar (capturar) excepciones de manera efectiva. El código dentro del bloque `try` se ejecuta normalmente, siempre y cuando no ocurra un error. Si se produce una excepción, se captura dentro del bloque `except`, donde se ejecuta el código de manejo de la excepción.

```python
def intdiv(a: int, b: int) -> int:
    try:
        return a // b
    except ZeroDivisionError:
        print('Por favor, no dividas por cero...')

intdiv(3, 0)  # Output: Por favor, no dividas por cero...
```

La traza de llamadas (`Traceback`), que se muestra cuando ocurre una excepción, proporciona información sobre las llamadas que llevaron al error. Dependiendo de la profundidad del error, la traza puede ser más o menos extensa.

Aquí, vemos un ejemplo de cómo una excepción puede propagarse a través de múltiples niveles de llamadas de función hasta que se maneja adecuadamente o se muestra un mensaje de error. El entendimiento y manejo eficiente de excepciones son habilidades esenciales para escribir código robusto y confiable en Python.

```python
def intdiv(a: int, b: int) -> int:
    return a // b

def arithmetics():
    return intdiv(3, 0)

def manage():
    return arithmetics()

def main():
    return manage()

main()
# Output:
# Traceback (most recent call last):
#   File "<stdin>", line 1, in <module>
#   File "<stdin>", line 2, in main
#   File "<stdin>", line 2, in manage
#   File "<stdin>", line 2, in arithmetics
#   File "<stdin>", line 2, in intdiv
# ZeroDivisionError: integer division or modulo by zero
```

### Especificando excepciones
#### Expreciones predefinidas
Aquí tienes una lista de algunas de las excepciones predefinidas en Python que son importantes conocer para manejar errores de manera efectiva:

| Error        | Descripción       | Ejemplo       |
|---|---|---|
| SyntaxError         | Ocurre cuando hay un error de sintaxis en el código Python.            | Error de sintaxis: falta un paréntesis de cierre `print("Hola Mundo")`          |
| IndentationError    | Se produce cuando la indentación del código no es correcta.          | Indentación incorrecta `for i in range(5):` `print(i)`             |
| NameError           | Indica que se ha utilizado un nombre que no está definido en el ámbito actual.          | Variable no definida `print(variable_inexistente)`     |
| TypeError           | Ocurre cuando se realiza una operación o función en un tipo de dato incorrecto.        | Intentando sumar un string con un entero `resultado = "5" + 3`             |
| ValueError          | Se genera cuando una función recibe un argumento con el tipo correcto pero un valor inapropiado.         | Convertir una cadena que no representa un entero a entero `entero = int("hola")`                    |
| ZeroDivisionError   | Aparece cuando se intenta dividir un número por cero.      | División por cero `resultado = 5 / 0`                                                              |
| FileNotFoundError  | Indica que un archivo o directorio no pudo ser encontrado.         | Intentar abrir un archivo que no existe with `open("archivo_inexistente.txt", "r") as archivo:` `contenido = archivo.read()` |
| IOError             | Se produce cuando ocurre un error de entrada/salida.            |    |
| IndexError          | Ocurre cuando se intenta acceder a un índice que está fuera del rango de una secuencia.          | Acceder a un índice que no existe en una lista `lista = [1, 2, 3]` `print(lista[4])`                  |
| KeyError            | Indica que se está intentando acceder a una clave que no existe en un diccionario.             | Acceder a una clave que no existe en un diccionario `diccionario = {"a": 1, "b": 2}` `print(diccionario["c"])`               |
| AttributeError     | Se genera cuando un objeto no tiene el atributo que se está intentando acceder.              |  Acceder a un atributo que no existe en un objeto `class Ejemplo:     pass` `objeto = Ejemplo()` `print(objeto.atributo_inexistente)`               |
| ImportError        | Ocurre cuando un módulo no puede ser importado.              | Intentar importar un módulo que no existe `import modulo_inexistente`              |

#### Agrupando expreciones 
Si nos interesa tratar distintas excepciones con el mismo comportamiento, es posible agruparlas en una única línea:

```python
def intdiv(a, b):
    try:
        result = a // b
    except (TypeError, ZeroDivisionError):
        print('Check operands: Some of them caused errors...')
    except Exception:
        print('Ups. Something went wrong...')
```

### Variantes en el tratamiento
