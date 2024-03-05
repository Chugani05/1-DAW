#!/bin/bash

############################################
#
# Nombre: if.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo:
#
# Historial:
#   2024-01-16: versión 1.0
#
############################################

# Caso 1: elemento vacio
elem=$1
#if [ "elem" = ""]
#if [ -z "$elem" ]
#if [ ! -n "$elem" ]
then
        echo "ERROR: Debe indicar un elemento"
        read -p "Indique el elemento: " elem


# Caso 2: 
# e = existe
if [ -e "$elem" ]
then
        echo "'$elem' EXISTE"
else
        echo "Lo siento, '$elem' NO existe"
fi


# Caso 3: 
# f = fichero
# d = directorio
# h = enlace
if [ -f "$elem" ]
then
        echo "'$elem' es un FICHERO"
elif [ -d "elem" ]
then    
        echo "'$elem es un DIRECTORIO"
elif [ -h "$elem" ]
then    
        echo "'$elem' es un ENLACE"
else    
        echo "'$elem' es OTRO ELEMENTO"


#Caso 4: Compruebo si esta vacía o no
if[ -s "$elem" ]
then
        echo "'$elem' NO es VACÍO"
else    
        echo "'$elem' es VACÍO"


# Caso 5: comprobar permisos
if [ -r "$elem"]
then
        echo "'$elem' tiene permisos de LECTURA"
else
        echo "'$elem' no tiene permisos de LECTURA"
fi
if [ -w "elem" ] ; then

fi


echo "Has indicado $# argumentos" #numero de argumentos
echo "Los agumenmtos que has indicado son:$@" #texto
echo "Los agumenmtos que has indicado son:$*" #array
echo "estoy en la linea $LINENO,llevo ejecuntado $SECONDS y fui ejecutado por el usuario $USER"

# Case 
# -eq = equals
if [ $# -eq 0 ] 
then
    echo "ERROR: No has indicado argumentos.Debes indica 2 argumentos"
    echo "SINTAXI:$0 <grados celcious > <nume decimales>"
    exit
elif [ $# -eq 1 ]
then
    resultado=$(echo "scale=2; ($gradosC-32)* 5 / 9"| bc)
    echo "($1 - 32) x 5 / 9 = $resultado" 
elif [ $# -eq 2 ]
then
    resultado=$(echo "scale=$indec; ($gradosC-32)* 5 / 9"| bc)
    echo "($1 - 32) x 5 / 9 = $resultado" 

# -gt = greater then
elif [ $# -gt 2 ]
then
    echo "Warning as indicado mas de 2 numeros solo se usaran los dos primeros argumentos"
    resultado=$(echo "scale=$indec; ($gradosC-32)* 5 / 9"| bc)
    echo "($1 - 32) x 5 / 9 = $resultado" 
fi

# -lt = less than


#para mirar el ultimo error
echo $? 
#./ej02.sh  << GAMBSINO

#./ej02.sh  <<< GAMBSINO #SOLO un dato
#read-p