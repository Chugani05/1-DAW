@echo off

title ej08-imc

rem ****************************************
rem *
rem * Nombre: ej08-imc.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Calcular el Índice de Masa Corporal (IMC) basado en la altura y el peso proporcionados como parámetros.
rem *
rem * Entradas: Altura (en cm) y peso (en Kg)
rem * Salidas: IMC y clasificación correspondiente
rem *
rem * Versión: 2024-02-13 versión 1.0
rem *
rem ****************************************

REM Verificar si se proporcionaron dos parámetros
if "%2"=="" (
    echo Por favor, proporciona la altura (en cm) y el peso (en Kg) como parámetros.
    exit /b 1
)

REM Utilizar PowerShell para manejar valores decimales
set "altura=%1"
set "peso=%2"

REM Calcular el IMC
for /f "delims=" %%i in ('powershell -command "[math]::Round(%peso% / (($altura$/100) * ($altura$/100)))"') do set "imc=%%i"

REM Determinar la clasificación del IMC
if %imc% lss 16 (
    echo IMC: %imc% - Delgadez severa
) else if %imc% leq 16 (
    echo IMC: %imc% - Delgadez moderada
) else if %imc% leq 18 (
    echo IMC: %imc% - Delgadez leve
) else if %imc% leq 24 (
    echo IMC: %imc% - Normal
) else if %imc% leq 29 (
    echo IMC: %imc% - Sobrepeso
) else if %imc% leq 34 (
    echo IMC: %imc% - Obesidad tipo I
) else if %imc% leq 39 (
    echo IMC: %imc% - Obesidad tipo II
) else (
    echo IMC: %imc% - Obesidad tipo III
)
