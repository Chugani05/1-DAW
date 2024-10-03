# Diferencia entre nth-child y nth-of-type:

- **`nth-child`:** Selecciona elementos según su posición **general** como elemento hijo. En el caso de que hagamos por ejemplo nth-child(1n) pillará los hijos impares (hijo1, hijo3, hijo 5, etc.).
- **`nth-of-type`:** Selecciona elementos según su posición entre **elementos del mismo tipo** dentro del padre. En el caso de que hagamos por ejemplo nth-of-type(1n) pillará los elementos del mismo tipo impares (si especificasemos para los párrafos (etiqueta p) sería el párrafo 1, 3, 5, etc.).

# Explicación del código:

```html
<!DOCTYPE html>
<html>
<head>
<style> 
p:nth-of-type(2n ) {
    background: red;
}

p:nth-child(2n) {
    border: blue 10px solid;
}
</style>
</head>
<body>
<p>Parrafo 1, hijo1</p>
<p>Parrafo 2, hijo2</p>
<div> div1, hijo3</div>
<p>Parrafo 3, hijo4</p>
<div> div2, hijo5</div>
<div> div3, hijo6</div>
<p>Parrafo 4, hijo7</p>
<p>Parrafo 5, hijo8</p>
<p>Parrafo 6, hijo9</p>
<p>Parrafo 7, hijo10</p>

</body>
</html>
```

- **`p:nth-of-type(2n)`:** Esto selecciona todos los elementos `<p>` que son ocurrencias **pares** de la etiqueta `<p>` dentro de su elemento padre (el `<body>` en este caso). Entonces, aplicará un fondo rojo a los elementos `<p>` segundo, cuarto y sexto (Parrafo 2, Parrafo 4 y Parrafo 6).
- **`p:nth-child(2n)`:** Aquí, estamos seleccionando todos los elementos `<p>` que son **hijos pares en total** dentro del `<body>`. Esto seleccionará los elementos `<p>` hijos segundo, cuarto, sexto, etc. En este caso, como hay otros tipos de elementos (div) se aplicará el borde azul a los p hijos 2, 4, 8 y 10.

# Desglosado de aplicación de los estilos:

| Elemento | nth-child(2n) | nth-of-type(2n) |
|---|---|---|
| Párrafo 1, hijo1 | No | No |
| Párrafo 2, hijo2 | <span style="color:blue;">**Borde azul**</span> | <span style="color:red;">**Fondo rojo**</span> |
| div1, hijo3 | No | No |
| Párrafo 3, hijo4 | <span style="color:blue;">**Borde azul**</span> | No |
| div2, hijo5 | No | No |
| div3, hijo6 | No | No |
| Párrafo 4, hijo7 | No | <span style="color:red;">**Fondo rojo**</span> |
| Párrafo 5, hijo8 | <span style="color:blue;">**Borde azul**</span> | No |
| Párrafo 6, hijo9 | No | <span style="color:red;">**Fondo rojo**</span> |
| Párrafo 7, hijo10 | <span style="color:blue;">**Borde azul**</span> | No |

- Si solo hay elementos del mismo tipo dentro del padre, `nth-child` y `nth-of-type` producirán los mismos resultados.
- `nth-child` es más susceptible a los cambios en la estructura HTML si se agregan o eliminan otros tipos de elementos.
- `nth-of-type` generalmente es más confiable cuando deseas seleccionar tipos de elementos específicos independientemente de su posición entre todos los elementos secundarios.
