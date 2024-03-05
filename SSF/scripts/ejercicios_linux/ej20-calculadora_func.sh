#!/bin/bash

#################################################
#
# Nombre: ej20-calculadora_func.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Calculadora con funciones para cada operación.
#
# Entradas: Números y operaciones seleccionadas por el usuario.
# Salidas: Resultado de las operaciones seleccionadas.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Argumentos
num1=$1
num2=$2
resultado=$3

# Función para realizar la suma
sumar() {
    resultado=$(($1 + $2))
    echo "Resultado: $resultado"
}

# Función para realizar la resta
restar() {
    resultado=$(($1 - $2))
    echo "Resultado: $resultado"
}

# Función para realizar la multiplicación
multiplicar() {
    resultado=$(($1 * $2))
    echo "Resultado: $resultado"
}

# Función para realizar la división
dividir() {
    if [ $2 -eq 0 ]; then
        echo "Error: No se puede dividir por cero."
    else
        resultado=$(echo "scale=2; $1 / $2" | bc)
        echo "Resultado: $resultado"
    fi
}

# Menú de la calculadora
while true; do
    echo "----------- Menú de la Calculadora -----------"
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Multiplicar"
    echo "4. Dividir"
    echo "5. Salir"

    read -p "Opción: " opcion

    case $opcion in
        "sumar" | 1 | a)
            read -p "Ingrese el primer número: " num1
            read -p "Ingrese el segundo número: " num2
            sumar "$num1" "$num2"
            ;;
        "restar" | 2 | b)
            read -p "Ingrese el primer número: " num1
            read -p "Ingrese el segundo número: " num2
            restar "$num1" "$num2"
            ;;
        "multiplicar" | 3 | c)
            read -p "Ingrese el primer número: " num1
            read -p "Ingrese el segundo número: " num2
            multiplicar "$num1" "$num2"
            ;;
        "dividir" | 4 | d)
            read -p "Ingrese el numerador: " num1
            read -p "Ingrese el denominador: " num2
            dividir "$num1" "$num2"
            ;;
        "salir" | 5 | e)
            echo "Saliendo de la calculadora."
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtelo de nuevo."
            ;;
    esac
done