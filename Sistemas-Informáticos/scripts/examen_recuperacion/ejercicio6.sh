#!/bin/bash

######################################################
# Nombre: ejercicio6.sh
# Autor: Rashi Chugani
#
# Objetivo: Comprobar si existe un usuario, si ni es así, crearlo.
#
# Variables:
#   Entrada: usuario
#
# Historial:
#   04-06-2024: versión 1.0
######################################################
ususario=$1

if [ $# -eq 0 ]
then
	echo "ERROR: No has indicado argumentos. Debes indicar 1 argumentos"
	exit 10

elif [ $# -eq 1 ]
then
	echo "Perfecto!! Has indicado 1 argumentos"
else
	echo "Has indicado $# argumentos, sólo usara el primero y se ignorará el resto"
fi

while [ -z "$grupo" ]; do
    read -p "Inserte el nombre del grupo: " grupo
done

    getent passwd $usuario > /dev/null 2 /dev/null

if [ "$?" -eq 0 ]; then
    exit 10
else
    sudo useradd -d /home/${usuario} -m -k /etc/skel -s /bin/bash -g $grupo $usuario
    pass=$RANDOM
    sudo chpasswd <<< "$user: $pass"
    if [ "$?" -eq 0 ]; then
        echo "Creando usuario \"$user\" con grupo principal \"$grupo\" y contraseña: $pass"
    fi
fi