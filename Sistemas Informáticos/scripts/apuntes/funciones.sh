#!/bin/bash

############################################
#
# Nombre: funciones.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: ejemplos simple de funciones en scripts
#
# Historial:
#   2024-01-19: versión 1.0
#
############################################

#LISTA DE ERRORES
ERR_NOARG=3

# Declarar una funcion
# Modo 1
function media2v{
    a=$1
    b=$2

    if [ -z "$a" ] || [ -z "$b" ]
    then
        return $ERR_NOARG
    fi

    med=$(( (a+b)/2 ))
    echo $med
    return 0
}

# Modo 2
mediaNv() {

    # Cumpruebo que haya argumentos
    if [ $# -eq 0 ]
    then
        return $ERR_NOARG
    fi
    
    # Sumno todos los valores
    local suma=0
    for val in "$@"
    do
        ((sum+=val))
    done
    #La media es el sumatorio dividido por el numero de argumentos
    echo "$(( sum/$# ))"
}

# Modo 3
function mediaMv() {
    
    local suma=0
    local num_arg=o
    while [ -n "$1" ]
    do
        ((suma+=$1))
        ((num_arg++))
        shift
    done
    echo "$(( suma/$num_arg ))"
}

res$(media2v 4)
cod_err=$?
a=43
b=45
echo "El resultado es $res"
echo "El error devuelto es $cod_err"

media2v
echo "El error devuelto es $?"

res=$(mediaNv 2 42 8 12 13 6)
echo ""El error devuelto es $?"
echo "El resultado es $res"

res=$(mediaMv 2 42 8 12 13 6)
echo ""El error devuelto es $?"
echo "El resultado es $res"