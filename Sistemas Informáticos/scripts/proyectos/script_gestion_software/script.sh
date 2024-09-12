#!/bin/bash

############################################################
#
# AUTORAS: Rashi Chugani, Lili Guo Zeng
#
# OBJETIVO: 1. Debe recibir un argumento (nombre del paquete), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.
#           2. Empezar sincronizando el listado de software local.
#           3. Si el paquete indicado NO ESTÁ INSTALADO en el sistema, se comproborá si existe en los repositorios del sistema:
#                   * Si el paquete SÍ EXISTE en los repositorios: se le mostrará la información del paquete y se le dará la opción de instalarlo.
#                   * Si el paquete NO EXISTE en los repositorios: se le indicará al usuario que no hay ningún paquete que se llame como ha indicado, y se le mostrará el resultado de la búsqueda que se obtiene con el argumento que ha dado el usuario (puede que la búsqueda no dé ningún paquete, o puede que la búsqueda muestre paquetes que se llaman de forma similar. En cualquier caso, se mostrará el resultado).
#           4. Si el paquete indicado SÍ ESTÁ INSTALADO: se le dará la opción de:
#                   * Mostrar su versión
#                   * Reinstalarlo
#                   * Actualizarlo (solo este paquete, si fuera actualizable)
#                   * Eliminarlo (guardando la configuración)
#                   * Eliminarlo totalmente
#
# ENTRADA: Nombre del paquete
# SALIDA: Si está instalada mostrar un menú de opciones, si no está instalada ver si existe o no en los repositorios.
#
# HISTORIAL:
#   2024-02-07 version 1.0
#
#######################################################################

nombre_paquete=$1

sincronizacion_local() {
    echo "Sincronizando listado de software local..."
    sudo apt update
}

buscar_paquete() {
    nombre_paquete="$1"
    busqueda=$(apt search "$nombre_paquete" 2>/dev/null)
    echo "$busqueda"
}

informacion_paquete() {
    nombre_paquete="$1"
    info=$(apt show "$nombre_paquete" 2>/dev/null)
    echo "$info"
}

instalacion_paquete() {
    nombre_paquete="$1"
    sudo apt install "$nombre_paquete"
}

funcion_principal() {
    if [ $# -eq 0 ]; then
        read -p "Por favor, ingrese el nombre del paquete: " nombre_paquete
    else
        nombre_paquete="$1"
    fi

    sincronizacion_local

    if dpkg -s "$nombre_paquete" &>/dev/null; then
        echo "El paquete '$nombre_paquete' está instalado."

        echo "--------------------------------------------------"
        echo "----------------------MENÚ------------------------"
        echo "--------------------------------------------------"
        echo ""
        echo "1. Mostrar versión"
        echo "2. Reinstalar"
        echo "3. Actualizar"
        echo "4. Mostrar paquetes actualizables"
        echo "5. Eliminar (guardando la configuración)"
        echo "6. Eliminar totalmente"
        echo "7. Salir sin hacer nada"
        read -p "Por favor, seleccione una opción (1-7): " opcion

        case $opcion in
            1|a|A) dpkg -s "$nombre_paquete" | grep Version ;;
            2|b|B) sudo apt install --reinstall "$nombre_paquete" ;;
            3|c|C) sudo apt install --upgrade "$nombre_paquete" ;;
            4|d|D) sudo apt list --upgradable "$nombre_paquete" ;;
            5|e|E) sudo apt remove "$nombre_paquete" ;;
            6|f|F) sudo apt purge "$nombre_paquete" ;;
            7|g|G) echo "Saliendo" ;;
            *) echo "Error: $opcion opción inválida." ;;
        esac
    else
        echo "El paquete '$nombre_paquete' no está instalado."
        resultado=$(buscar_paquete "$nombre_paquete")
        echo "Resultados de la búsqueda:"
        echo "$resultado"
        echo ""
        read -p "¿Desea instalar este paquete? (y/n): " opciones_instalacion
        if [ "$opciones_instalacion" = "y" ]; then
            instalacion_paquete "$nombre_paquete"
            echo "Paquete instalado"
        fi
    fi
}

funcion_principal "$@"