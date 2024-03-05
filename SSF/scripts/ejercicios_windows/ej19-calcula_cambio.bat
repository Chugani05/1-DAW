@echo off

title ej19-calcula_cambio

rem ****************************************
rem *
rem * Nombre: ej19-calcula_cambio.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Calcular el cambio a entregar al cliente después de una compra.
rem *
rem * Entradas: Precio del artículo y dinero entregado por el cliente.
rem * Salidas: Cantidad a entregar al cliente como cambio.
rem *
rem * Versión: 2024-02-20 versión 1.0
rem *
rem ****************************************

rem Verificar si se proporcionó el precio del artículo como argumento
if "%1"=="" (
    echo Uso: %0 ^<precio_del_articulo^>
    exit /b 1
)

rem Obtener el precio del artículo del primer argumento
set "precio_articulo=%1"

rem Solicitar el dinero entregado por el cliente
set /p dinero_entregado="Indique el dinero pagado: "

rem Calcular el cambio
set "cambio="
set /a cambio=dinero_entregado - precio_articulo

echo Se ha comprado un articulo de %precio_articulo% euros y ha pagado %dinero_entregado% euros.
echo El cambio son %cambio% euros, debe entregar:

rem Definir un array de billetes y su valor
set "billetes=500 200 100 50 20 10 5 2 1"

rem Iterar sobre cada billete para calcular la cantidad a entregar
for %%b in (%billetes%) do (
    set /a cantidad=cambio / %%b
    if !cantidad! gtr 0 (
        echo !cantidad! billete(s) de %%b euro(s)
        set /a cambio=cambio - (cantidad * %%b)
    )
)
