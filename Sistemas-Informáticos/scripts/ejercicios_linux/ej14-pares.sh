#!/bin/bash

#################################################
#
# Nombre: ej14-pares.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Mostrar los cuadrados de los números pares entre dos valores dados por el usuario.
#
# Entradas: Dos números proporcionados como argumentos o ingresados por teclado.
# Salidas: Cuadrados de los números pares entre los dos valores dados.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Función para calcular el cuadrado de un número
calcular_cuadrado() {
    echo $((numero * numero))
}

# Función para mostrar el mensaje del cuadrado
mostrar_cuadrado() {
    echo "El cuadrado del número par $numero es $(calcular_cuadrado)"
}

# Verificar si se proporcionaron dos números como argumentos
if [ $# -eq 2 ]; then
    num1=$1
    num2=$2
else
    # Pedir al usuario que introduzca dos números
    read -p "Introduzca el primer número: " num1
    read -p "Introduzca el segundo número: " num2
fi

# Determinar el rango de números
if [ $num1 -lt $num2 ]; then
    menor=$num1
    mayor=$num2
else
    menor=$num2
    mayor=$num1
fi

echo "Mostrando los cuadrados pares entre $mayor y $menor:"

# Iterar desde el mayor hasta el menor, de dos en dos
for (( numero=$mayor; numero>=$menor; numero-=2 )); do
    # Verificar si el número es par
    if [ $((numero % 2)) -eq 0 ]; then
        mostrar_cuadrado
    fi
done