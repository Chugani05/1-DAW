#!/bin/bash

#################################################
#
# Nombre: ej17-deposito.sh
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

# Verificar si se proporcionan 3 argumentos
if [ $# -ne 3 ]; then
    echo "Error: Debes indicar 3 valores: cantidad, %TAE del interés y años del depósito."
    exit
fi

# Obtener los valores proporcionados por el usuario
cantidad_inicial=$1
interes_tae=$2
anos=$3

# Verificar que los valores sean números positivos
if ! [[ $cantidad_inicial =~ ^[0-9]+([.][0-9]{1,2})?$ ]] || ! [[ $interes_tae =~ ^[0-9]+([.][0-9]{1,2})?$ ]] || ! [[ $anos =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Los valores deben ser números positivos."
    exit
fi

# Función para calcular el dinero después de cada año
calcular_dinero() {
    cantidad=$1
    interes=$2
    anos=$3
    for (( i=1; i<=$anos; i++ )); do
        interes_ganado=$(echo "scale=2; $cantidad * $interes / 100" | bc)
        cantidad=$(echo "scale=2; $cantidad + $interes_ganado" | bc)
        echo "Año $i: Cantidad = $cantidad euros, Interés ganado = $interes_ganado euros"
    done
}

# Mostrar el resultado
echo "Simulación del depósito a plazo fijo de interés compuesto:"
echo "Cantidad inicial = $cantidad_inicial euros"
echo "TAE del interés = $interes_tae %"
echo "Años del depósito = $anos años"

# Llamar a la función para calcular y mostrar los resultados
calcular_dinero $cantidad_inicial $interes_tae $anos