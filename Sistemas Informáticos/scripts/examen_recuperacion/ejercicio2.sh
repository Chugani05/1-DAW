#!/bin/bash

######################################################
# Nombre: ejercicio2.sh
# Autor: Rashi Chugani
#
# Objetivo: Indicar si un paquete esta o no instalado. Si lo está darle opciones que pueda realizar.
#
# Variables:
#   Entrada: nombre_paquete
#
# Historial:
#   04-06-2024: versión 1.0
######################################################
nombre_paquete=$1

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

sincronizacion_local(){
    echo "Sincronizando listado de software local..."
    sudo apt update
}

funcion_principal(){
    if [ $# -eq 0 ]; then
        read -p "Por favor, ingrese el nombre del paquete: " nombre_paquete
    else
        nombre_paquete="$1"
    fi

    sincronizacion_local

    if dpkg -s "$nombre_paquete" &>/dev/null; then
        echo "El paquete '$nombre_paquete' está instalado"

        echo "---------------------------------------"
        echo "-----------------MENÚ------------------"
        echo "---------------------------------------"
        echo ""
        echo "1. Reisntalar"
        echo "2. Actualizar"
        echo "3. Eliminar guardando la configuración"
        echo "4. Eliminar totalmente"
        echo "5. Salir sin hacer nada"
        read -p "Por favor, seleccione una opción (1-5): " opcion

        case $opcion in
            1 | a | A ) 
                sudo apt install --reinstall "$nombre_paquete" ;;
            2 | b | B ) 
                sudo apt install --upgrade "$nombre_paquete" ;;
            3 | c | C ) 
                sudo apt remove "$nombre_paquete" ;;
            4 | d | D ) 
                sudo apt purge "$nombre_paquete" ;;
            5 | e | E ) 
                echo "Saliendo..."
                exit 0 ;;
            *) 
                echo "Error: $opcion opción inválida" ;;
        esac
    else
        echo "El paquete '$nombre_paquete' no está instalado"
    fi
}

funcion_principal "$@"