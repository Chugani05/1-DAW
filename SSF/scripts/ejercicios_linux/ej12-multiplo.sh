#!/bin/bash

#################################################
#
# Nombre: ej12-multiplo.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Verificar si los números dados son múltiplos de un valor dado por el usuario.
#
# Entradas: Números como argumentos y valor introducido por el usuario.
# Salidas: Indicación de si cada número es múltiplo o no del valor introducido.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Obtener números como argumentos
numeros=("$@")

# Solicitar al usuario un valor
read -p "Introduzca un valor: " valor

# Mostrar los números y verificar si son múltiplos del valor
echo "Analizando si los números ${numeros[*]} son o no múltiplos de $valor"
for numero in "${numeros[@]}"; do
    if [ $((numero % valor)) -eq 0 ]; then
        echo "El número $numero SÍ es múltiplo de $valor"
    else
        echo "El número $numero NO es múltiplo de $valor"
    fi
done