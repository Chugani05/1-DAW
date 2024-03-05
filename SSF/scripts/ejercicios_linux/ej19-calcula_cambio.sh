#!/bin/bash

#################################################
#
# Nombre: ej19-calcula_cambio.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Calcular el cambio a devolver al cliente.
#
# Entradas: Precio del artículo (argumento obligatorio) y dinero entregado por teclado.
# Salidas: Cálculo del cambio utilizando billetes de euro.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Verificar si se proporciona al menos 1 argumento
if [ $# -eq 0 ]; then
    echo "Error: Debes proporcionar el precio del artículo como argumento."
    exit
fi

# Obtener el precio del artículo
precio_articulo=$1

# Verificar si se proporciona el segundo argumento
if [ -z "$2" ]; then
    read -p "Introduzca el dinero entregado: " dinero_entregado
else
    dinero_entregado=$2
fi

# Función para calcular el cambio
calcular_cambio() {
    dinero_entregado=$1
    cambio=$((dinero_entregado - precio_articulo))

    if [ $cambio -lt 0 ]; then
        echo "El cliente no entregó suficiente dinero. Faltan $(($cambio * -1)) euros."
        exit
    elif [ $cambio -eq 0 ]; then
        echo "El cliente entregó la cantidad exacta. No hay cambio."
        exit
    else
        echo "Cambio a devolver: $cambio euros"

        # Array de billetes de euro
        billetes=(500 200 100 50 20 10 5 2 1)

        # Calcular la cantidad de cada billete en el cambio
        for billete in "${billetes[@]}"; do
            cantidad=$((cambio / billete))
            cambio=$((cambio % billete))

            if [ $cantidad -gt 0 ]; then
                echo "$cantidad billete(s) de $billete euro(s)"
            fi
        done
    fi
}

# Llamar a la función para calcular el cambio
calcular_cambio "$dinero_entregado"