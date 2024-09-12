@echo off

title Suma_teclado

rem ****************************************
rem *
rem * Nombre: suma.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Sumar dos valores por teclado
rem *
rem ****************************************

set /p a=Introducir el primer valor: 
set /p b=Introducir el segundo valor: 

set /a resultado = %a% + %b%

echo La suma de %a% + %b% = %resultado%
