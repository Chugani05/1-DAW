@echo off

title ej03-gradosC2F

rem ****************************************
rem *
rem * Nombre: ej03-gradosC2F.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Convertir grados Celsius a Fahrenheit
rem *
rem * Entradas: Valor en Celsius
rem * Salidas: Valor en Fahrenheit
rem *
rem * versión: 2024-01-22 versión 1.0
rem *
rem *
rem ****************************************

set celsius=%1

if "%celsius" == "" ( 
echo ERROR!! No se indica el valor de los grados Celsius 
)

set /a Fahr=%Celsius% * 9 / 5 + 32

echo %Celsius%.C son %Fahr%.F
