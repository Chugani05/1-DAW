@echo off

title ej15-rectangulo

rem ****************************************
rem *
rem * Nombre: ej15-rectangulo.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Calcular el área y dibujar un rectángulo en la consola.
rem *
rem * Entradas: Base y altura del rectángulo (opcional)
rem * Salidas: Información sobre el rectángulo y representación visual en la consola.
rem *
rem * Versión: 2024-02-20 versión 1.0
rem *
rem ****************************************

rem Establecer los valores por defecto de base y altura
set "base=7"
set "altura=4"

rem Verificar la cantidad de argumentos proporcionados por el usuario
if "%2" neq "" (
    set "base=%1"
    set "altura=%2"
) else if "%1" neq "" (
    set "base=%1"
)

rem Calcular el área
set /a area=base * altura

rem Mostrar información sobre el rectángulo
echo Vamos a pintar un rectangulo de base: %base%, altura: %altura% y area: %area%

rem Pintar el rectángulo
for /l %%i in (1,1,%altura%) do (
    for /l %%j in (1,1,%base%) do (
        echo | set /p="# "
    )
    echo.
)
