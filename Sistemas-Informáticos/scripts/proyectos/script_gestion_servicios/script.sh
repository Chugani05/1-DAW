#!/bin/bash

############################################################
#
# AUTORES: Joseph Vanegas Caicedo, Rashi Chugani Narwani
#
# OBJETIVO: Este script permite administrar servicios del sistema.
#
# ENTRADA: El nombre del servicio como argumento de línea de comandos o por entrada de usuario.
# SALIDA: Información sobre el estado del servicio y menú de opciones para administrarlo.
#
# HISTORIAL:
#   2024-02-25 version 1.0
#
#############################################################

nombre_servicio=$1

while [[ -z "$nombre_servicio" ]]
do
    read -r -p "Introduce el nombre del servicio: " nombre_servicio
done
if ! systemctl status "$nombre_servicio" >/dev/null 2>&1; then
    echo "El servicio "$nombre_servicio" no existe o no está disponible."
    exit 10
fi

if systemctl is-active "$nombre_servicio" >/dev/null 2>&1; then
    activo="SI"
else
    activo="NO"
fi
if systemctl is-enabled "$nombre_servicio" >/dev/null 2>&1; then
    habilitado="SI"
else
    habilitado="NO"
fi
if systemctl is-enabled "$nombre_servicio" &>/dev/null && [[ "$(systemctl is-enabled "$nombre_servicio")" == "masked" ]]; then
    enmascarado="SI"
else
    enmascarado="NO"
fi

echo "Resumen del servicio "$nombre_servicio":"
echo "Activo: $activo"
echo "Habilitado: $habilitado"
echo "Enmascarado: $enmascarado"

activar_servicio() {
    echo Activando el servicio "$nombre_servicio"
    sudo systemctl start "$nombre_servicio"
    echo El servicio "$nombre_servicio" ha sido activado.
}

desactivar_servicio() {
    echo Desactivando el servicio "$nombre_servicio"
    sudo systemctl stop "$nombre_servicio"
    echo El servicio "$nombre_servicio" ha sido desactivado.
}

    while true; do
        echo "                ┌────────────────┐"
        echo "                │      Menú      │"
        echo "                └────────────────┘"
        echo ""
        echo "1. Activar/Desactivar el servicio"
        echo "2. Habilitar/Deshabilitar el servicio" 
        echo "3. Enmascarar/Desenmascarar el servicio"
        echo "4. Mostrar configuración del servicio"
        echo "5. Reiniciar el servicio (dejando el servicio activo)"
        echo "6. Reiniciar el servicio (dejando el servicio en su último estado)"
        echo "7. Aplicar cambios en la configuración dejando el servicio activo"
        echo "8. Aplicar cambios en la configuración dejando el servicio en su último estado"
        echo "9. Asignar la configuración de habilitado/deshabilitado indicada por el desarrollador (vendor preset)"
        echo "10. Mostrar el tiempo de carga total del sistema"
        echo "11. Mostrar el tiempo de carga de este servicio"
        echo "12. Mostrar el nivel de ejecución actual del equipo"
        echo "13. Apagar el equipo"
        echo "14. Reiniciar el equipo"
        echo "15. SALIR"
        read -r -p "Elija una opción (1-15): " opcion

        case $opcion in
            1 | a | A )
            case "$(systemctl is-active --quiet "$nombre_servicio" && echo "activo" || echo "inactivo")" in
                activo)
                    echo "El servicio "$nombre_servicio" está activo."
                    echo "¿Deseas desactivarlo? (s/n)"
                    read -r respuesta
                    case "$respuesta" in
                        s | S )
                            desactivar_servicio
                            ;;
                        *)
                            echo "Operación cancelada."
                            ;;
                    esac
                    ;;
                inactivo)
                    echo "El servicio "$nombre_servicio" está inactivo."
                    echo "¿Deseas activarlo? (s/n)"
                    read -r respuesta
                    case "$respuesta" in
                        s | S )
                            activar_servicio
                            ;;
                        *)
                            echo "Operación cancelada."
                            ;;
                    esac
                    ;;
                esac
                ;;
            2 | b | B )
                if [[ "$habilitado" == "SI" ]]; then
                    read -r -p "El servicio está habilitado, ¿desea deshabilitarlo? (S/n): " respuesta
                    if [[ "$respuesta" == "S" || "$respuesta" == "s" ]]; then
                        echo "Deshabilitando el servicio..."
                        systemctl disable "$nombre_servicio"
                        habilitado="NO"
                    fi
                else
                    read -r -p "El servicio está inhabilitado, ¿desea habilitarlo? (S/n): " respuesta
                    if [[ "$respuesta" == "S" || "$respuesta" == "s" ]]; then
                        echo "Habilitando el servicio..."
                        systemctl enable "$nombre_servicio"
                        habilitado="SI"
                    fi
                fi
                ;;
            3 | c | C )
                if [[ "$enmascarado" == "SI" ]]; then
                    read -r -p "El servicio está enmascarado, ¿desea desenmascararlo? (S/n): " respuesta
                    if [[ "$respuesta" == "S" || "$respuesta" == "s" ]]; then
                        echo "Desenmascarando el servicio..."
                        systemctl unmask "$nombre_servicio"
                        enmascarado="NO"
                    fi
                else
                    read -r -p "El servicio no está enmascarado, ¿desea enmascararlo? (S/n): " respuesta
                    if [[ "$respuesta" == "S" || "$respuesta" == "s" ]]; then
                        echo "Enmascarando el servicio..."
                        systemctl mask "$nombre_servicio"
                        enmascarado="SI"
                    fi
                fi
                ;;
            4 | d | D )  echo "Mostrando configuración del servicio..."
                systemctl show "$nombre_servicio"
                ;;
            5 | e | E )  echo "Reiniciando el servicio (dejando el servicio activo)..."
                systemctl restart "$nombre_servicio"
                ;;
            6 | f | F )  echo "Reiniciando el servicio (dejando el servicio en su último estado)..."
                systemctl reload "$nombre_servicio"
                ;;
            7 | g | G )  echo "Aplicando cambios en la configuración dejando el servicio activo..."
                systemctl reload-or-restart "$nombre_servicio"
                ;;
            8)  echo "Aplicando cambios en la configuración dejando el servicio en su último estado..."
                systemctl try-reload-or-restart "$nombre_servicio"
                ;;
            9)  echo "Asignando la configuración de habilitado/deshabilitado indicada por el desarrollador (vendor preset)..."
                systemctl preset "$nombre_servicio"
                ;;
            10) echo "Mostrar el tiempo de carga total del sistema..."
                uptime
                ;;
            11) echo "Mostrar el tiempo de carga de este servicio..."
                systemd-analyze blame | grep "$nombre_servicio"
                ;;
            12) echo "Mostrar el nivel de ejecución actual del equipo..."
                systemctl get-default
                ;;
            13) echo "Apagar el equipo..."
                sudo shutdown -h now
                ;;
            14) echo "Reiniciar el equipo..."
                "Reiniciar el equipo..."
                ;;
            15) echo "Saliendo del programa..."
                exit 0
                ;;
            *)  echo "Opción no válida. Por favor, seleccione una opción válida." ;;
        esac
    done
