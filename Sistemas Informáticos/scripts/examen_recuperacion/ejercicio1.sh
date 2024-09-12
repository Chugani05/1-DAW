#!/bin/bash

######################################################
# Nombre: ejercicio1.sh
# Autor: Rashi Chugani
#
# Objetivo: Comprobar el tipo de fichero y modificar los accesos.
#
# Variables:
#   Entrada: nombre_fichero
#
# Historial:
#   04-06-2024: versión 1.0
######################################################
nombre_fichero=$1

while [[ -z "$nombre_fichero" ]]
do
    read -r -p "Introduce el nombre del proceso: " nombre_fichero
done
