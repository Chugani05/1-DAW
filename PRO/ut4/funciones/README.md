# Funciones

```py
# Definición de la función
def function_name(param1, param2, paramN):
    return values

# Llamada de la función
function_name(arg1, arg2, argN)
```
- Los parámetros pueden ser __posicionales__ (se ingresan de forma normal, ejemplo: `say_name('Juan')`) o __nominales__ (se ingresan llamando al nombre del parametro antes, ejemplo: `say_name(name='Juan')`)

- Una vez se empieza el ingreso de argumentos __nominales__, los siguientes deberán serlo también.

- Para volver obligatorios que los argumentos sean posicionales o nominales, se debe colocar __/__ (esto dirá que los parametros __antes__ del símbolo serán siempre __posicionales__) o __*__ (los parámetros __después__ del símbolo serán siempre __nominales__)

- Es preferible explicitar el `return None` siempre que se pueda.

- Para darle un valor por defecto a algún parámetro, en la __definición de la función__ se le debe asignar con `param_name=default_value`.

- NO es buena práctica modificar los valores ingresados en una función; se debe optar por generar un nuevo valor en base al ingresado.

- Siempre que se trabaje con datos mutables, como listas, estás se deben inicializar dentro de la función como una variable y no como un parámetro, pues le puede dar un ictus y funcionar como le salga de la gana.

- Se puede empaquetar/desempaquetar valores en tuplas o diccionarios añadiendo a los argumentos y/o parámetros un __*__ (de argumentos posicionales a tupla) o __**__ (de argumentos nominales a diccionarios).

- Las funciones mismas también pueden ser argumentos de otras funciones.

## Documentación

La documentación de una función se llama __docstring__. Este se crea usando triple comillas. Se puede consultar la documentación de cualquier función con `help(func_name)`. Hay varias herramientas para generar la documentación con el que necesitas usar cierto formato para aplicarlo; el que usamos es __Sphinx__ y su formato es el siguiente:
```py
def my_power(x, n):
    """Calculate x raised to the power of n.

    :param x: number representing the base of the operation
    :type x: int
    :param n: number representing the exponent of the operation
    :type n: int

    :return: :math:`x^n`
    :rtype: int
    """
    result = 1
    for _ in range(n):
        result *= x
    return result
```

## Tipos de funciones

- Funciones lambda: se escriben en una sola linea, son anónimas (no tienen nombres), su cuerpo lleva un `return` implícito y puede recibir cualquier número de parámetros.
```py
num_words = lambda t: len(t.split())
```
- Funciones interiores: funciones que se encuentran dentro de otras, normalmente porque realizan acciones muy específicas para el funcionamiento de la función padre.
```py
def get_words_with_all_vowels(text: str) -> list[str]:
    VOWELS = 'aeiou'
    def get_unique_vowels(word: str) -> set[str]:
        return set(c for c in word if c in VOWELS)
    ...
```
- Clausuras: función que retorna otra función con argumentos personalizados.
```py
def make_multiplier_of(n: int):
    def multiplier(x: int) -> int:
        return x * n
    return multiplier
```
- __Decoradores__: permite modificar el comportamiento de otras funciones, y estos solo se aplican al usar `@decorator_name` encima de la función a decorar.
- Cuando se aplican varios decoradores, estos se hacen __desde dentro hacia afuera__, ejemplo:
```py
# Primero se aplica @div2 y luego @plus5
@plus5
@div2
def prod(a, b):
    return a * b
```
- Si se quiere usar decoradores __con argumentos__, se debe añadir una capa de función adicional con el nombre del decorador.
  
- __Generadores__: hay dos tipos; funciones generadoras y expresiones generadoras.
- Los generadores crean datos y los arroja conforme se pidan; no las guarda todas en una estructura, ahorrando así memoria.
- Después de pedir datos, los generadores se agotan.
- Recuerdan sus iteraciones y se congelan.
- La diferencia principal entre una función normal y una generadora, es que el primero lleva un `return` y el segundo un `yield`.
- __Una función retorna un generador, y sobre ese generador se itera para agarrar los datos.__
```py
# Función generadora
def evens(lim: int) -> int:
    for i in range(0, lim + 1, 2):
        yield i

# Expresión generadora
evens_gen = (i for i in range(0, 20, 2))
```

- __Funciones recursivas:__ funciones que se llaman a sí mismas.

## Espacios de nombres

Cuando usas nombres de variables, estos no hacen conflicto cuando se encuentran en distintos __namespaces__. Un __namespace__ puede ser el interior de una función, por lo que una variable `username` en una función `login()` es distinto de una variable `username` en una función `search_person()`.
Se pueden modificar variables globales desde el interior de un namespace añadiendo `global` antes de la variable.
Hay dos funciones en Python:
- locals(): devuelve un diccionario con las variables locales de un __namespace__.
- globals(): devuelve un diccionario con las variables del __namespace__ global.
