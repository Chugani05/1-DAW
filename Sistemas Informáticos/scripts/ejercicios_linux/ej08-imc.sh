#!/bin/bash

#################################################
#
# Nombre: ej08-imc.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Calcular el IMC y clasificar la condición según la tabla de la OMS.
#
# Entradas: Altura en centímetros y Peso en kilogramos.
# Salidas: IMC y condición.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Almacenar los argumentos en variables
altura=$1
peso=$2


if [ "$#" -ne 2 ]; then
    echo "Error: Debes proporcionar exactamente dos argumentos."
    echo "Sintaxis: $0 <altura_en_cm> <peso_en_kg>"
    exit
fi

#read -p "Indique su peso en Kg: " peso
#read -p "Indique su altura en Centimetros: " altura


# Calcular el IMC (Índice de Masa Corporal)
imc=$(( (10000 * peso) / (altura * altura) ))

# Clasificar la condición según la tabla de la OMS (redondear al entero más cercano)
if [ $imc -lt 16 ]; then
    condicion="Delgadez severa"
elif [ $imc -lt 17 ]; then
    condicion="Delgadez moderada"
elif [ $imc -lt 18.5 ]; then
    condicion="Delgadez leve"
elif [ $imc -lt 25 ]; then
    condicion="Normal"
elif [ $imc -lt 30 ]; then
    condicion="Preobesidad"
elif [ $imc -lt 35 ]; then
    condicion="Obesidad leve"
elif [ $imc -lt 40 ]; then
    condicion="Obesidad moderada"
else
    condicion="Obesidad severa"
fi

# Mostrar el resultado
echo "IMC: $imc"
echo "Condición: $condicion"