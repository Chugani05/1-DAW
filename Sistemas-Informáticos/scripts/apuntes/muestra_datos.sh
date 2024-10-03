#!/bin/bash

############################################
#
# Nombre: muestra_datos.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: mostrar datos observados por teclado
#
# Entrada: ninguna, se piden por teclado
# Salida: mensaje
#
# Historial:
#   2024-01-15: versión 1.0
#
############################################

sleep 15

read -p "Indique su nombre: " nombre
read -p "Indique su apellido: " apellido
read -p "Indique su usuario: " usuario

echo "Bienvenido $nombre"
echo "Tus datos son $usuario, $apellido"
echo "Vamos a crear tu usuario: $usuario"
echo "Tu nueva ID es $RANDOM"