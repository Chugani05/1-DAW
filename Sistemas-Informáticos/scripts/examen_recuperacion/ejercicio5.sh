#!/bin/bash

######################################################
# Nombre: ejercicio5.sh
# Autor: Rashi Chugani
#
# Objetivo: Comprobar si existe un servicio y cambiar su estado de arranque.
#
# Variables:
#   Entrada: nombre_servicio
#
# Historial:
#   04-06-2024: versión 1.0
######################################################
nombre_servicio=$1

while [[ -z "$nombre_servicio" ]]
do
    read -r -p "Introduce el nombre del proceso: " nombre_servicio
done

getent $nombre_servicio > /dev/null 2 /dev/null

