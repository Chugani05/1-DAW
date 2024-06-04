# script_gestion_servicios

1. Debe recibir un argumento (nombre del servicio), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.
2. Lo primero que hará es comprobar si el nombre indicado es realmente un servicio. Si no es así, emitirá un error con código 10 y terminará la ejecución
3. Mostrar un resumen del estado del servicio indicando su nombre y si está activo (SÍ o NO), habilitado (SÍ o NO), enmascarado (SÍ o NO)
4. Mostrar un menú con las siguientes opciones (van a depender del estado del servicio)
    1. Activar el servicio (si estaba inactivo y NO enmascarado. Si estaba ya activo, se ofrecerá la opción de Desactivarlo).
    2. Habilitar el servicio (si estaba deshabilitado. Si estaba habilitado, se ofrecerá la opción de Deshabilitarlo).
    3. Enmascarar el servicio (si estaba desenmascarado. Si estaba ya enmascarado, se ofrecerá la opción de Desenmascararlo).
    4. Mostrar configuración del servicio.
    5. Reiniciar el servicio (dejando el servicio activo).
    6. Reiniciar el servicio (dejando el servicio en su último estado).
    7. Aplicar cambios en la configuración dejando el servicio activo (intentando evitar la interrupción del servicio).
    8. Aplicar cambios en la configuración dejando el servicio en su último estado (intentando evitar la interrupción del servicio).
    9. Asignar la configuración de habilitado/deshabilitado indicada por el desarrollador (vendor preset).
    10. Mostrar el tiempo de carga total del sistema.
    11. Mostrar el tiempo de carga de este servicio.
    12. Mostrar el nivel de ejecución actual del equipo.
    13. Apagar el equipo (usar el comando de control de servicios).
    14. Reiniciar el equipo (usar el comando de control de servicios).
    15. SALIR