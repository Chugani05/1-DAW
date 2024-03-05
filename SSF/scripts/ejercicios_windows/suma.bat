@echo off

title Suma

rem ****************************************
rem *
rem * Nombre: suma.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Sumar dos valores con variables
rem *
rem ****************************************

set /a a = 56
set /a b = 12

set /a resultado = %a% + %b%

echo La suma de %a% + %b% = %resultado%
