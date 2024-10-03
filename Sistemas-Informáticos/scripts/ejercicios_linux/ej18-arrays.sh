#!/bin/bash

#################################################
#
# Nombre: ej18-arrays.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Simulador de depósito a plazo fijo de interés compuesto.
#
# Entradas: Cantidad en euros del depósito, %TAE del interés y cantidad de años del depósito.
# Salidas: Estado del depósito para cada año.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Argumentos
datos=$1
elementos=$2
minimo=$3
maximo=$4
suma=$5

# Verificar si se proporcionan al menos 1 argumento
if [ $# -eq 0 ]; then
    echo "Error: Debes proporcionar al menos 1 número entero como argumento."
    exit
fi

# Inicializar arrays
datos=()
elementos=0
minimo=
maximo=
suma=0

# Función para determinar si un número es par
es_par() {
    if [ $(($1 % 2)) -eq 0 ]; then
        return 0  # Verdadero (es par)
    else
        return 1  # Falso (no es par)
    fi
}

# Procesar cada argumento
for arg in "$@"; do
    # Verificar si el argumento es un número entero
    if [[ $arg =~ ^[0-9]+$ ]]; then
        # Verificar si el número es negativo y continuar al siguiente argumento si es el caso
        if [ $arg -lt 0 ]; then
            echo "Se ignora el valor $arg por ser negativo."
            continue
        fi

        # Incrementar el número de elementos
        ((elementos++))

        # Verificar si el número es par o impar y agregarlo al array
        if es_par $arg; then
            datos=($arg "${datos[@]}")
            echo "$arg se inserta por el PRINCIPIO porque es PAR"
        else
            datos+=($arg)
            echo "$arg se inserta por el FINAL porque es IMPAR"
        fi

        # Actualizar mínimo y máximo
        if [ -z "$minimo" ] || [ $arg -lt $minimo ]; then
            minimo=$arg
        fi

        if [ -z "$maximo" ] || [ $arg -gt $maximo ]; then
            maximo=$arg
        fi

        # Actualizar suma
        suma=$((suma + arg))
    else
        echo "Se ignora el valor $arg por ser negativo o no ser un número entero."
    fi
done

# Mostrar el array construido
echo "------"
echo "Array construido ($elementos elementos): ${datos[@]}"
echo "MIN: $minimo, MAX: $maximo, MEDIA: $(echo "scale=2; $suma / $elementos" | bc)"