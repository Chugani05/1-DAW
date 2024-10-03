#!/bin/bash

#################################################
#
# Nombre: ej09-info_rutas.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: informar sobre las características de los elementos en disco
#
# Entradas: 1: elemento (fichero, directorio, etc.)
# Salidas: información sobre el elemento
#
# Historial:
#   2024-01-20: versión 1.0
#
#################################################

elem=$1

# 3 formas de comprobar que una variable no esté vacía
#if [ "$elem" = "" ]
#if [ -z "$elem" ]
if [ ! -n "$elem" ]
then
	echo "ERROR: Debe indicar un elemento"
	read -p "Indique el elemento: " elem
fi

if [ -e "$elem" ]
then
	echo "'$elem' EXISTE"
else
	echo "Lo siento, '$elem' NO existe"
	exit
fi

# Compruebo el tipo de elemento
if [ -f "$elem" ]
then
	echo "'$elem' es un FICHERO"
elif [ -d "$elem" ]
then
	echo "'$elem' es un DIRECTORIO"
elif [ -h "$elem" ]
then
	echo "'$elem' es un ENLACE"
else
	echo "'$elem es OTRO ELEMENTO"
fi

# Compruebo si está vacío o no
if [ -s "$elem" ]
then
	echo "'$elem' NO es vacío"
else
	echo "'$elem' es VACÍO"
fi

# Comprobar permisos
if [ -r "$elem" ]
then
	echo "'$elem' tiene permisos de LECTURA"
else
	echo "'$elem' NO tiene permisos de LECTURA"
fi
if [ -w "$elem" ]
then
	echo "'$elem' tiene permisos de ESCRITURA"
else
	echo "'$elem' NO tiene permisos de ESCRITURA"
fi
if [ -x "$elem" ]
then
	echo "'$elem' tiene permisos de EJECUCIÓN/ACCESO"
else
	echo "'$elem' NO tiene permisos de EJECUCIÓN/ACCESO"
fi