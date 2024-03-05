#!/bin/bash

#################################################
#
# Nombre: ej15-rectangulo.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Pintar un rectángulo y mostrar su área.
#
# Entradas: Base y altura proporcionadas como argumentos o valores por defecto.
# Salidas: Rectángulo dibujado y área mostrada.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Argumentos
base=$1
altura=$2

# Obtener la base y altura de los argumentos o usar valores por defecto
if [ $# -eq 0 ]; then
    base=7
    altura=4
elif [ $# -eq 1 ]; then
    base=$1
    altura=4
else
    base=$1
    altura=$2
fi

# Verificar que base y altura sean enteros positivos
if ! [[ $base =~ ^[1-9][0-9]*$ ]] || ! [[ $altura =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Base y altura deben ser enteros positivos."
    exit 1
fi

# Función para imprimir el rectángulo
imprimir_rectangulo() {
    for (( i=1; i<=altura; i++ )); do
        for (( j=1; j<=base; j++ )); do
            echo -n "*"
        done
        echo
    done
}

# Calcular el área del rectángulo
area=$((base * altura))

# Mostrar el rectángulo
echo "Rectángulo dibujado con base=$base y altura=$altura:"
imprimir_rectangulo

# Mostrar el área
echo "Área del rectángulo: $area"
