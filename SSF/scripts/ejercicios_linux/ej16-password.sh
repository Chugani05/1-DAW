#!/bin/bash

#################################################
#
# Nombre: ej16-password.sh
# Autor: Rashi Chugani <chugani205@gmail.com>
#
# Objetivo: Verificar la contraseña ingresada por el usuario.
#
# Entradas: Contraseña proporcionada por el usuario (no visible en pantalla).
# Salidas: Mensaje de acierto o solicitud de reintento.
#
# Historial:
#   2024-01-21: versión 1.0
#
#################################################

# Argumentos
contrasena=$1

# Función para solicitar y leer la contraseña sin mostrarla en pantalla
obtener_contraseña() {
    read -p "Introduce tu contraseña: " contrasena
}

# Solicitar y leer la primera contraseña
echo "Bienvenido al sistema."
obtener_contraseña
echo  "Guardando contreseña inicial"

# Guardar la primera contraseña para verificar
contrasena_inicial=$contrasena

# Solicitar y leer la segunda contraseña para verificar
while true; do
    obtener_contraseña
    echo  "Verificando contraseña"

    # Verificar si las contraseñas coinciden
    if [ "$contrasena" == "$contrasena_inicial" ]; then
        echo "Contraseña correcta. ¡Bienvenido!"
        exit
    else
        echo "Contraseña incorrecta. Vuelve a intentarlo."
        exit
    fi
done