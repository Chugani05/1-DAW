#!/bin/bash

############################################################
#
# AUTORAS: Nichole A Louis, Rashi Chugani Narwani
#
# OBJETIVO: Obtención de procesos con mayor uso de CPU y memoria, opciones para detener este proceso.
# ENTRADA: Dos Argumento
# SALIDA: Dependiendo de las opciones, el script indica que cantidad de cpu y memoria esta usando un proceso y te da un menu de opciones para interactuar co este.
#
# HISTORIAL:
#   2024-02-24: versión 1.0
#
############################################################

if [ "$#" -ne 2 ]; then
    echo "Error, deben proporcionarse dos argumentos."
    exit 100
fi

maxCPU=$1
maxMem=$2

if [ "$1" -lt 0 ] || [ "$2" -lt 0 ]; then
    echo "Error, ambos valores deben ser iguales o mayores que 0."
    exit 200
elif [ "$maxMem" -gt 100 ]; then
    echo "Error maxMem debe ser menor o igual a 100."
    exit 150
fi

manejar_senal() {
    case $1 in
        INT | SIGINT)
            echo " Interrumpiendo ejecución"
            exit 0
            ;;
        TERM | SIGTERM)
            echo " Finalizando ejecución"
            exit 0
            ;;
        USR1 | SIGUSR1)
            echo " Carga del sistema:"
            uptime
            ;;
        USR2 | SIGUSR2)
            echo " Límites de los procesos del sistema:"
            ulimit -a
            ;;
    esac
}

trap 'manejar_senal INT' INT
trap 'manejar_senal TERM' TERM
trap 'manejar_senal USR1' USR1
trap 'manejar_senal USR2' USR2

while true; do
    maxCPUPID=$(ps -eo pid,%cpu --sort=-%cpu | grep -v PID | head -n 1 | awk '{print $1}')
    maxCPUpercent=$(ps -eo pid,%cpu --sort=-%cpu | grep -v PID | head -n 1 | awk '{print $2}')

    maxMemPID=$(ps -eo pid,%mem --sort=-%mem | grep -v PID | head -n 1 | awk '{print $1}')
    maxMemPercent=$(ps -eo pid,%mem --sort=-%mem | grep -v PID | head -n 1 | awk '{print $2}')

    if (( $(echo "$maxCPUpercent <= $maxCPU" | bc -l) )) && (( $(echo "$maxMemPercent <= $maxMem" | bc -l) )); then
        echo "Los procesos están dentro de los límites."
    else
        echo "Error: El proceso con PID $maxCPUPID supera el límite de CPU ($maxCPU%) o el proceso con PID $maxMemPID supera el límite de memoria ($maxMem%)"
        echo "Elige un proceso:"
        echo "1. Proceso de CPU PID: $maxCPUPID"
        echo "2. Proceso de memoria PID: $maxMemPID"

        read -p "Selecciona una opción: " opcion
        case $opcion in
            1 | a | A ) 
                proceso="$maxCPUPID"
                ;;
            2 | b | B ) 
                proceso="$maxMemPID"
                ;;
            *) 
                echo "Opción no válida."
                continue
                ;;
        esac

        echo "Información del proceso:"
        ps -p "$proceso" -o pid,%cpu,%mem,cmd
        echo "--------------------------------------------------"
        echo "----------------------MENÚ------------------------"
        echo "--------------------------------------------------"
        echo "1. Ignorar el aviso y seguir comprobando"
        echo "2. Disminuir en 3 puntos la prioridad del proceso"
        echo "3. Interrumpir el proceso"
        echo "4. Terminar el proceso"
        echo "5. Finalizar inmediatamente el proceso"
        echo "6. Detener el proceso (congelarlo 'evitable')"
        echo "7. Detener el proceso (congelarlo 'inevitable')"
        echo "8. Salir"

        read -p "Selecciona una opción: " opcion

        case $opcion in
            1 | a | A )
                ;;
            2 | b | B )
                renice +3 -p "$proceso"
                ;;
            3 | c | C )
                kill -INT "$proceso"
                ;;
            4 | d | D )
                kill "$proceso"
                ;;
            5 | e | E )
                kill -9 "$proceso"
                ;;
            6 | f | F )
                kill -STOP "$proceso"
                ;;
            7 | g | G )
                kill -KILL "$proceso"
                ;;
            8 | h | H )
                echo "Saliendo..."
                exit 0
                ;;
            *)
                echo "Opción no válida."
                ;;
        esac
    fi

    maxCPU_proceso=$(ps -eo %cpu --sort=-%cpu | awk 'NR==2{print $1}')
    maxMem_proceso=$(ps -eo %mem --sort=-%mem | awk 'NR==2{print $1}')
   
    if (( $(echo "$maxCPU_proceso > $maxCPU" | bc -l) )) || (( $(echo "$maxMem_proceso > $maxMem" | bc -l) )); then
        echo "El proceso $maxCPUPID excede el límite de CPU ($maxCPU%) o el proceso $maxMemPID excede el límite de memoria ($maxMem%)"
    fi

    sleep 30
done