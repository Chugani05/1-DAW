#!/bin/bash

######################################################
# Nombre: ejercicio3.sh
# Autor: Rashi Chugani
#
# Objetivo: Comprobar si existe un proceso, si es asi mandarle una orden de finalización. Esta orden no se puede interumpir. 
#
# Variables:
#   Entrada: nombre_proceso
#
# Historial:
#   04-06-2024: versión 1.0
######################################################
nombre_proceso=$1

while [[ -z "$nombre_proceso" ]]
do
    read -r -p "Introduce el nombre del proceso: " nombre_proceso
done

activar_proceso() {
    echo Activando el proceso "$nombre_proceso"
    sudo systemctl start "$nombre_proceso"
    echo El proceso "$nombre_proceso" ha sido activado.
}

desactivar_proceso() {
    echo Desactivando el proceso "$nombre_proceso"
    sudo systemctl stop "$nombre_proceso"
    echo El proceso "$nombre_proceso" ha sido desactivado.
}

if systemctl is-active; then
    desactivar_proceso
else
    activar_proceso

trap 'echo "Gestión en proceso, NO SE PUEDE TERNINAR"' SIGTERM