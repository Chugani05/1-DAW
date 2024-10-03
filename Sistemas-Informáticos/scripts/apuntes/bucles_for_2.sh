#!/bin/bash

############################################
#
# Nombre: bucles_for_2.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: ejemplos simple de bucles en scripts
#
# Historial:
#   2024-01-16: versión 1.0
#
############################################

# Puedo recorrer todos los argumentos (único valor)
for arg in "$*"
do
    echo '$*: '"El argumento es @arg"
done


# Puedo recorrer todos los argumentos (uno a uno como una lista)
for arg in "$@"
do
    echo '$@: '"El argumento es @arg"
done


# Puedo recorrer todos los elementos del disco
# Fichero, directorios, etc
for elem in *
do
    echo '$@: '"Elementos: $elem"
    chmod u-x $elem  # quitando permiso de ejecución al usuario
    chmod go-x $elem  # quitando permiso de ejecución a grupos y otros
done


# Puedo recorrer la salida de cualquier comando
for elem in $(df -h)
do
    echo '$@: '"Elementos: $elem"
done

for elem in $(date)
do
	echo "Elemento: $elem"
done