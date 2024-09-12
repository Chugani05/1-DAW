#!/bin/bash

############################################
# Nombre: sumatorio.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: pedir por teclado el nombre del usuario, asegurandote de que ha introducido un valor (NO lo puede dejar vacio)
#
# Historial:
#   2024-01-16: versión 1.0
############################################

# Se puede usar 'while' o 'until' en este caso
nombre=$1

#while [ -z "$nombre" ]
until [ -n "$nombre" ]
do
    read -p "Introduzca su numero: " nombre
done
echo "Tu nombre es $nombre"
