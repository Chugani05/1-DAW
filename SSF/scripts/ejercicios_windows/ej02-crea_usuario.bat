@echo off

title ej02-crea_usuario

rem ****************************************
rem *
rem * Nombre: suma.bat
rem * Autor: Rashi Chugani Narwani
rem *
rem * Objetivo: 
rem *
rem *
rem ****************************************

set nombre=Rashi
set /p apellido=Dime tu apellido: 
set usuario=%1

echo Bienvenido, %Nombre%
echo Tus datos son: %nombre% %apellido%
echo Vamoa crear tu usuario %usuario%
echo Tu nueva ID es %RANDOM%
