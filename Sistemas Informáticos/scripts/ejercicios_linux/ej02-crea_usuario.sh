#!/bin/bash

############################################
#
# Nombre: ej02-crea_usuario.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: simular la creacion de un usuario
#
# Entrada: 1: nombre, 2: apellido, 3: usuario
# Salida: mensaje
#
# Historial: 
#   2024-01-08: versión 1.0
#   2024-01-21: versión 2.0
#
############################################

# argumentos
nombre=$1
apellido=$2
usuario=$3

# obliga a poner los argumentos y si no se hace da error
if [ $# -eq 0 ]
then
	echo "ERROR: No has indicado argumentos. Debes indicar 3 argumentos"
	echo "SINTAXIS: $0 <nombre> <apellido> <usuario>"
	exit 

elif [ $# -eq 1 ]
then
	echo "Perfecto!! Has indicado 3 argumentos"
else
	echo "Has indicado $# argumentos, sólo usaremos los tres primeros y se ignorará el resto"
fi

# mensaje
echo "Bienvenido, $nombre"
echo "Tus datos son $nombre, $apellido"
echo "Vamos a crear tu usuario: $usuario"
echo "Tu nueva ID es $RANDOM"