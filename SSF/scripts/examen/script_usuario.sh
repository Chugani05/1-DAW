#!/bin/bash

############################################
# Nombre: script_usuario.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: dependiendo de si el usuario existe o no se realizan distintas acciones, Si existe se pide permiso par eliminar y usuario,
# en cambio si no existe se crea el ususario y se muestra una lista de sus privilegios.
#
# Variables:
#   User: el nombre del usuario introducido por comando
#   Group: el nombre del grupo que se crea.
#
# Historial:
#   2024-03-16: versión 1.0
############################################

user=$1
group=$2

if [$# -eq 0]
then 
    echo "ERROR: No has indicado argumentos. Debes indicar al menos 1 argumento."
    exit 25

else [$# -eq 1]
    echo "Perfecto!! Has indicado al menos 1 argumento"
fi

while true, do
    read -p "Intoduzca el nombre de usuario: " user
done

    if user not in (cat /etc/passwd)
    then 
        sudo groupadd $group
        sudo useradd -d /home/$user -m -g $group -k /etc/skell -s /bin/bash $user
        
    else 
        sudo pkill -9 -u $user
        sudo userdel -f -r $user
        exit 10
    fi

