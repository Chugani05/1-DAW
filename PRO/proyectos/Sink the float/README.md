# UT3-TE1: Sink_fleet
Trabajo de Programación UT3


## Contenido

[Objetivo](#objetivo)  
[Desarrollo del juego](#desarrollo-del-juego)  
[Ejemplo de tablero](#ejemplo-de-tablero)  
[Puntuaciones](#puntuaciones)   
[Notas](#notas)

### Objetivo

Escriba un programa en Python que permita jugar a **HUNDIR LA FLOTA**.

### Desarrollo del juego

- **Sólo juega una persona** con un tablero `board` generado aleatoriamente.
- Este tablero (`board`) inicial tendrá un tamaño de 10x10 (como lista de listas) donde cada celda puede ser:
  - **Vacío** representado por la cadena vacía.
  - **Barco** representado por una combinación de letra+dígito.
- Habrá los siguientes barcos:
  - 1 barco de longitud 5 (`5A`)
  - 1 barco de longitud 4 (`4A`)
  - 2 barcos de longitud 3 (`3A` y `3B`)
  - 1 barco de longitud 2 (`2A`)
- En cada "turno" habrá que indicar la posición de tiro: `A4`, `B7`, `C1`, ... donde las letras representan filas y los números representan columnas.
- No se permite posición de tiro sobre una celda ocupada o sobre una celda fuera del tablero.
- En cada "turno" habrá que mostrar el tablero con los intentos realizados:
  - **Celda inexplorada** representada por ⬛
  - **Agua** representada por 🟦
  - **Barco tocado** representado por 🟧
  - **Barco hundido** representado por 🟥
- En cada turno habrá que mostrar:
  - Número de turnos.
  - Número de barcos que quedan por hundir.
  - Puntuación hasta el momento.
- El juego termina cuando se han hundido todos los barcos.

### Ejemplo de tablero

El tablero que se proporciona inicialmente indica dónde está cada barco y sus identificadores. Aquí se puede ver un ejemplo:

```
██ ██ ██ ██ ██ ██ ██ ██ ██ ██
██ ██ ██ ██ ██ ██ ██ ██ ██ ██
██ ██ ██ ██ ██ ██ ██ ██ ██ 5A
██ ██ ██ ██ 3B 3B 3B ██ ██ 5A
██ ██ ██ ██ 4A ██ ██ ██ ██ 5A
██ ██ 3A ██ 4A ██ ██ ██ ██ 5A
██ ██ 3A ██ 4A ██ ██ ██ ██ 5A
██ ██ 3A ██ 4A ██ ██ ██ ██ ██
██ ██ ██ 2A ██ ██ ██ ██ ██ ██
██ ██ ██ 2A ██ ██ ██ ██ ██ ██
```

### Puntuaciones

| Jugada           | Puntuación              |
| ---------------- | ----------------------- |
| AGUA             | -1                      |
| TOCADO           | 2 \* Longitud del barco |
| TOCADO Y HUNDIDO | 4 \* Longitud del barco |

> 💡 La puntuación "global" no puede ser menor que cero.

### Notas

- Utilizar sólo herramientas de Python que se hayan visto hasta el momento en clase.
