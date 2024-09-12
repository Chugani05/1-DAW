@echo off

title Suma_arg

rem ****************************************
rem *
rem * Nombre: suma.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: Sumar dos valores por argumentos
rem *
rem ****************************************

rem Obtengo los parámetros
set a=%1
set b=%2

rem CÓDIGO DE ERRORES
set NO_ARG 5

if NOT defined a (
	echo ERROR!! Deberias haber indicado Dos variables
	exit /b %NO_ARG%
)

if "%b%" == "" (
	echo ERROR!! Debe indicar el parametro b:
	set /p b=Indique el parametro b:
)

set /a resultado = %a% + %b%

echo La suma de %a% + %b% = %resultado%
