#!/bin/bash

#################################################
#
# Nombre: ej13-rutas.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Ejecutar el script ej09-info_ruta.sh para cada elemento del directorio actual con más de 4 caracteres.
#
# Entradas: Ninguna.
# Salidas: Información de cada ruta para los elementos del directorio actual con más de 4 caracteres.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

mkdir abcd
mkdir efgh

# Obtener la lista de elementos en el directorio actual con más de 4 caracteres
elementos=$(find . -maxdepth 1 -type d -name '????*')

# Iterar sobre cada elemento y ejecutar ej09-info_ruta.sh
for elemento in $elementos; do
    ./ej09-info_ruta.sh "$elemento"
done