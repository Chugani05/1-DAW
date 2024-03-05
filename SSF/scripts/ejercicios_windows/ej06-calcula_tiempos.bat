@echo off

title ej06-calcula_tiempos

rem ****************************************
rem *
rem * Nombre: ej06-calcula_tiempos.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Convertir segundos a días, horas, minutos y segundos.
rem *
rem * Entradas: Número de segundos
rem * Salidas: Días, horas, minutos y segundos correspondientes
rem *
rem * Versión: 2024-02-20 versión 1.0
rem *
rem ****************************************

rem Verificar si se proporcionó el número correcto de argumentos
if "%1"=="" (
    echo Por favor, proporciona el numero de segundos como unico argumento.
    exit /b 1
)

rem Verificar si se proporcionó más de un argumento
if not "%2"=="" (
    echo Este script solo acepta un unico argumento.
    exit /b 1
)

rem Convertir el parámetro en un número entero
set /a segundos=%1

rem Calcular días, horas, minutos y segundos
set /a dias=segundos / 86400
set /a segundos_restantes=segundos %% 86400

set /a horas=segundos_restantes / 3600
set /a segundos_restantes=segundos_restantes %% 3600

set /a minutos=segundos_restantes / 60
set /a segundos=segundos_restantes %% 60

echo %dias% dia(s), %horas% hora(s), %minutos% minuto(s) y %segundos% segundo(s)
