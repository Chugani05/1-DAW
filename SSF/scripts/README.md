# Scripts
## Scripts en Linux
- Ecribir un script en Bash: `#!/bin/bash`

- Parámetos especiales:
    - `$` = Contiene el nombre del script tal como es inuccado. 
    - `$*` = El conjunto de todos los parámetros en un solo argumerito. 
    - `$@` = el conjunto de argumentos, un parámetro por parámetro.
    - `$#` = El número de parametros pasados al script.
    - `$?` = El código de retorno de último comando 
    - `$$` = EL PID dee shell que ejecuta el script.
    - `$!` = El PID del último proceso ejecutado en segundo plano.

- Comando `shift n`:
    - permite desplazar los parametros. 
    - n = número de posiciones que hay desplazar los parámetros.

- Comparaciones numéricas:
    - `eq` = igual a
    - `ge` = iqual o mayor
    - `gt` = mayor a
    - `le` = igual o menor
    - `lt` = menor a
    - `ne` = no es igual a

- Comparaciones y/o expresiones:

| 3 -eq 5 | ---> comprueba si el valor 3 es igual a 5, como es incorrecto devuelve falso

- Comparación de cadenas:
    - `cadena1 = cadera2`: verdadero si son identicas 
    - `cadena1 != cadena2`: vendadero si son distintas
    - `cadena1`: verdadero si es nulo
    - `-n codena1`: verdadero si la longitud de carácteres es mayor a 0 
    - `-z cadena1`: verdadero si la longitud. es emptyset

- Comparación de ficheros:
    - `-d nombrefich`: verdadero si es directorio
    - `-f nombrefich`: verdadero si es archivo
    - `-r nombrefich`: verdadero si el fichero puede ser
    - `-w nombrefich`: verdadero si puede ser escrito
    - `-x nombrefich`: verdadero si es ejecutable.
    - `-s nombrefich`: verdadero si NO es vacio
    - `-e nombrefich`: verdadero si EXISTE
    - `-h nombrefich`: verdadero si es enlace

- Comparaciones de expresiones:
    - `!expresión`: verdadero si no se cumple
    - `expresión1 -a expresión2`: verdadero si ambas se cumplen (&&)
    - `expresión1 -o expresión2`: verdadero si exp1 o exp2 se cumple (||)

### Condicionales
Puede ejecutar o no en función del valor de una expresión

[if - then](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/if.sh)
```bash
if [expresión]
then
[comandos]
fi
```

[if - then - else](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/if.sh)
```bash
if [expresión]
then
[comandos]
else
[comandos]
fi
```

[if - then - elif - else](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/if.sh)
```bash
if [expresión1]
then
[comandos]
elif [expresión2]
then
[comandos]
else
[comandos]
fi
```

### Menu case
[menu case](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/menu_case.sh)
```bash
echo "-----Menú-----"
echo "1. Mostrar el contenido del directorio"
echo "2. Mostrar el espacio libre de disco"
echo "3. Mostrar los permisos del contenido del directorio"
echo "4. Mostrar la memoria libre"
echo "5. Salir"
echo ""
read -p "Introduzca su opción: " opcion

case "$opcion" in
	a | A | 1 )
    ls -lh 
	;;

	b | B | 2 )
    df -h
	;;

	c | C | 3 )
    stat -c "%a %A %n" *
	;;

	d | D | 4 )
    free 
	;;

    e | E | 5 )
    echo "Salienso del programa..."
    exit 0
    ;;

	*) 
    echo "ERROR: '$opcion' no es una opción correcta"
	;;
esac
```
### Bucles
Un bucle repite los comandos que uno ha escrito tantas veces hasta que la expresión se unifique.

[for](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/bucles_for_1.sh)
```bash
for [inicializador; condición; incremento]
do
    [comandos]
done
```

[while](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/bucles_while.sh)
```bash
while [expresión]
do 
    [comandos]
done
```

[until]()
```bash
until [expresión]
do 
    [comandos]
done
```

### Par case
[par case](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/par_case.sh)
```bash
case cadena in 
cadena1 )
[comandos]
;;
cadena2 )
[comandos]
;;
*)
[comandos]
;;
esac
```

### Comprobación de argumentos
[make exec](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/make_exec.sh)
```bash
if [ $# -eq 0 ] 
then
    echo "ERROR: No has indicado args. Debes indicar x args"
    echo "SINTAXIS: $0 <arg1> <arg2> ..."
    exit

elif [ $# -eq 1 ]
then
    echo "Perfecto!! HAs indicado x argumentos"
else
    echo "Has indicado $# args, solo usaremos los x primeros, se ignoraran el resto"
fi
```

### Pide comandos por teclado si no son introducidos
[mustra datos](https://github.com/Chugani05/sistemas_informaticos/blob/main/scripts/apuntes/muestra_datos.sh)
```bash
read -p "Indique arg1: " arg1
read -p "Indique arg2: " arg2
```

## Scripts en Windows
