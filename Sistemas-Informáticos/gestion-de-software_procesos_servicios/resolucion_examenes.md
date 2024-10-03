# Examen Práctico Segundo Trimestre
## GNU/Linux
1. Pues como te temías, el nuevo usuario no tarda en llegar a solicitar tu ayuda. Resulta que en la empresa trabajan con servidores, y nuestro usuario necesita una aplicación para poder conectarse remotamente a los servidores. Quizá la aplicación de este tipo más común y utilizada a nivel mundial sea Secure Shell (ssh).
Existen múltiples versiones de esta aplicación para desarrollar diferentes tareas, pero para realizar conexiones a/desde otras máquinas, hay principalmente dos versiones, dependiendo de si lo que necesitas es conectarte desde tu máquina a otra, o a la inversa, que desde otra máquina se conecten a la tuya. Una de las versiones se usa solamente cuando se inicia la conexión, y otra de las versiones está siempre en ejecución, a la espera de recibir conexiones desde otros equipos.
Tú ya tienes claro qué versión se necesita en cada caso, así que le preguntas al usuario qué quiere hacer, y te dice que lo que él necesita es, desde su equipo, poder conectarse a otros equipos, como servidores, máquinas remotas, etc. Elige la versión más adecuada de ssh para este caso.

  a. ssh-client **LA CORRECTA** <br> b. ssh-audit <br> c. ssh-tools <br> d. ssh-contact <br> e. ssh-server

2. Ahora que sabes qué versión debes instalar del software, te das cuenta de que hay diferentes variantes que tienen etiquetas. ¿Cuál deberías elegir para instalar en un equipo moderno típico de despacho?

  a. ~rc5 <br> b. alpha4-5 <br> c. beta1-3 <br> d. lts-i386 <br> e. x86_64

3. Procede a instalar ahora la versión de Secure Shell (ssh) que permite que desde un equipo me pueda conectar a otros equipos remotos (es un programa tan común, que probablemente ya esté instalado, pero ignora esto y haz la instalación como si no estuviera instalado en el equipo) `sudo apt install ssh-client`

4. Ahora que lo acabas de instalar, te das cuenta de que se ha instalado una versión algo antigua, en los demás equipos de la oficina hay una versión más moderna. Hmmmm, quizá este equipo llevaba mucho tiempo sin encenderse, resuelve el problema para que se pueda instalar el software más actual disponible. `sudo apt update`

5. Ahora que tu equipo tiene acceso a las versiones más recientes, actualiza el paquete que acabas de instalar (solo ese paquete). `sudo apt install ssh-client`

6. Ahora el usuario te hace otra consulta. Resulta que le han pasado un script para hacer algunos cálculos, el fichero se llama calcula.sh, y él lo está intentando ejecutar escribiendo justo ese nombre, pero no le funciona. Indícale cómo debe ejecutar el script `./calcula.sh`

7. Pues parece que aún ejecutándolo como tú le has dicho, no consigue que el script funcione. Listas el contenido del directorio y ves lo siguiente, que te da una pista de lo que puede estar pasando... ¿cómo lo arreglarías? `chmod u+x calcula.sh`

  -rw-r-----  1 user27 usuarios 117K feb 12 10:55 datos.dat <br> -rw-------  1 user27 usuarios 181K mar 17 12:59 calcula.sh <br> -rw-r--r--  1 user27 usuarios 8,6K nov 16 12:25 graficos.png

8. Ahora parece que ya puede ejecutar el scripts, pero es raro, porque es un script de bash, y, sin embargo, se le está ejecutando con otra shell diferente. El usuario está un poco despistado con esto, no sabe cómo hacer para que su script se ejecute con bash, y alguien le comenta que debe poner "algo" en la primera línea del script. ¿Qué es lo que debe poner en la primera línea del script para que se ejecute con bash? `#!/bin/bash`

9. El usuario sigue hablando y te dice que ahora el script sí se ejecuta, pero no da el resultado correcto. Ha preguntado a otras personas de la empresa y le han dicho que probablemente sea porque el script usa una aplicación que se llama **calc** , y quizá la versión que tenga instalada no sea la correcta, así que te pide que le muestres qué versión de calc tiene instalada en su sistema (usa el nombre exacto calc y usa UN ÚNICO comando). `apt version calc`

10. En el comando anterior intentaste mostrar la versión de **calc**, pero resulta que te dio un error, porque realmente no es que la versión no fuera la correcta, es que ese paquete NO está instalado en el equipo.  Antes de hacer nada más, busca si existe un paquete que se pueda instalar que se llame EXACTAMENTE así (debes especificar que quieres hacer una búsqueda por nombre EXACTO). ``

11. En la búsqueda sale efectivamente un resultado, por lo que el paquete sí está disponible en tu distribución. Antes de proceder a instalarlo, muéstrale qué versión se instalaría para ver si le sirve. `apt policy calc`

12. Al usuario le vale con la versión que le has indicado, así que procede a instalarla. `sudo apt install calc`

13. Ahora que le está funcionando el script bien y los cálculos son correctos, el usuario te viene con una preocupación que tiene, y es que los datos que necesita el script está en un **directorio muy confidencial** que se llama **datos**, y tiene miedo de que cualquier otro usuario pueda entrar allí. ¿Cómo podrías solucionar esto para que nadie más que el usuario pueda trabajar en este directorio? `chmod go-rwx datos`

14. De nuevo el usuario necesita poder usar una aplicación. Se trata de "aragorn" y tiene que ser una versión concreta que no tiene tu distribución, y todo el personal está usando la misma versión que te puedes descargar aquí. Tras descargarlo, ves que NO es exactamente un fichero de instalación, ¿cómo harías para extraer el contenido usando un ÚNICO COMANDO (SIN usar pipes, etc.)?  `tar xzvf aragorn.tar.gz`

15. Una vez que has obtenido el paquete tras ejecutar el comando del apartado anterior, instálalo ``

16. Tras instalarlo, el usuario lanza una ejecución de aragorn con unos determinados parámetros e inmediatamente el equipo empieza a ir bastante lento. El usuario se pone algo nervioso porque el equipo va cada vez peor, pero no sabe cómo cancelar la ejecución que acaba de lanzar. ¿Con qué combinación de teclas podrías cancelarla? `Ctrl+C`

17. El usuario está cada vez más nervioso, porque necesita ejecutar aragorn, pero no quiere que su equipo vaya tan lento. Le dices que no se preocupe, que hay una forma de que al lanzar una aplicación, esta consuma menos recursos. De hecho, hay varios niveles para decirle cuántos menos recursos debe asignarle, le dices que, por ejemplo, puede probar con 7 puntos menos. Indícale cómo debe lanzar aragorn para que el sistema le asigne menos recursos en un "factor 7". `nice -7 aragorn`

18. A pesar de que has indicado que debe utilizar menos recursos, aún así el equipo sigue yendo lento y el usuario sigue preocupado. Le dices que se tranquilice, que lo que vamos a hacer es que el sistema le asigne aún menos recursos a la ejecución de aragorn que acabamos de lanzar. Pero para eso primero necesitamos conocer su PID, ¿cómo conseguirías el PID de la aplicación que se llama exactamente aragorn? `pidof aragorn`

19. Ahora que sabes el PID de la ejecución de aragorn (recuerda que para responder a esta pregunta debes usar el PID 1234), le dices que ahora lo que vas a hacer es que el sistema le dé aún menos recursos. De hecho, vas a hacer que el sistema le dé la menor cantidad de recursos posible (usa el número EXACTO para que obtenga la PEOR asignación de recursos posible). `renice -n -20 -p 1234` --El comando es correcto, pero los argumentos no

20. Pues a pesar de que aragorn se está ejecutando con la peor asignación de recursos posible, la máquina sigue yendo mal. ¿Qué comando usarías para ver el desempeño general del sistema, para ver si realmente la máquina está libre o está trabajando por "encima de sus posibilidades"? ``

21. Efectivamente, el equipo está trabajando más de lo que debería, lo que hace que vaya bastante lento. El usuario sigue nervioso, porque realmente necesita usar la aplicación aragorn, pero tú le dices que hay algo mal, que pregunte en su departamento a ver si la está usando de forma incorrecta. Por el momento, lo que vas a hacer es, usando un único comando, finalizar TODAS las ejecuciones de la aplicación aragorn, dando tiempo para que la aplicación termine de forma ordenada, guardando los resultados. ``

22. Ya te habías olvidado de nuestro usuario, pero al rato regresa emocionado. Te cuenta que, efectivamente, se había confundido y los datos que estaba usando con aragorn no eran correctos. Sus colegas le indicaron cómo debía ejecutarla, y ahora puede lanzar la aplicación sin problemas, el equipo le va bien.
Pero resulta que le ha surgido otro problema. Está lanzando la aplicación aragorn desde una terminal, y parece que va todo bien, pero nunca llega a obtener los resultados. A ti te suena un poco raro esto, y le dices que te lo muestre, pero cuando llegas a su equipo ves que no tiene ninguna terminal abierta. Él te dice que no, que él para ejecutar abre la terminal, lanza aragorn y luego cierra la terminal, que no le gusta tener terminales abiertas... En fin, suspiras y le dices que no puede cerrar la terminal.
Sin embargo, el usuario te dice que necesita enviar una ejecución especial de aragorn que va a durar mucho tiempo, y quiere que aunque cierre la terminal donde lanzó el comando, la aplicación se siga ejecutando, y que guarde la salida en pantalla en un fichero ~/aragorn.out y los errores en ~/aragorn.err.  ¿Cómo lo harías? ``

23. Nuestro compañero vuelve a la carga con un nuevo problema. Resulta que ya le habíamos instalado al usuario la versión de Secure Shell (ssh) que permitía que desde su equipo se pudiera conectar a otros. Ahora necesita que instalar la otra versión "inversa", la que permite que otros usuarios desde otros equipos se puedan conectar al equipo de nuestro usuario. Lo ha intentado y no ha conseguido instalarla, índicale cómo debe hacerlo. `sudo apt install ssh-server`

24. Durante la instalación, obtenemos un error porque, aparentemente el disco está lleno. Esto te sorprende, porque el equipo estaba limpio y tenía bastante espacio disponible. Le preguntas al usuario si ha almacenado ficheros grandes en el disco, pero te dice que no. Según nos cuenta, como no sabía muy bien cómo se instalaba el software ni qué versión exacta necesitaba, estuvo probando a instalar bastantes paquetes, pero cuando comprobaba que no era lo que necesitaba, lo desinstaló.
Por si acaso, le pides que diga qué paquetes instaló y luego, según él, desinstaló. Para poder comprobar que este software que te ha nombrado ya no está en el equipo, necesitas ver qué paquetes están actualmente instalados en el sistema, ¿cómo los muestras? `apt list --installed`

25. Hmmmm, parece que este usuario tiene razón, los paquetes que según él instaló, no aparecen como instalados en el sistema... Sin embargo, la lista de paquetes instalados en el sistema te parece excesivamente grande... Entonces te das cuenta de dónde está el problema. Soluciónalo para liberar espacio en disco. `sudo apt autoremove`

26. Aunque acabas de instalar la versión de ssh que permite que otros equipos remotos se conecten al del usuario, como durante la instalación hubo un error porque se llenó el disco, decides volver a reinstalarlo, por si acaso, ahora que acabas de solucionar el problema del disco lleno. `sudo apt reinstall ssh-server`

27. Parecía que a este usuario le iba todo bien, pero ahora su equipo a vuelto a presentar problemas. Según sus investigaciones, se debe a un proceso que está relacionado con la última instalación que le hiciste. Por lo que ha averiguado, el proceso se llama algo así como ssh. Comprueba si esa aplicación con un nombre parecido a ssh se está de verdad ejecutando y obtén su identificador. Ten en cuenta que el usuario está casi seguro que se llama ssh, pero quizá no sea exactamente así y el nombre sea ligeramente diferente, debes tener esto en cuenta para obtener el PID. `pgrep ssh`

28. Ahora que tienes el PID, puedes buscar información sobre esta ejecución y ver el nombre real del comando. Hmmmm, por el nombre ves que NO parece un proceso "normal", sino que más bien se trata de un proceso "especial" del sistema. ¿Con qué comando te podrías asegurar de que, efectivamente, es un "proceso especial" y podrías ver su estado? `systemctl status 1234`

29. Efectivamente, tu intuición no te ha fallado y ese proceso es "especial".  El usuario te mira con cara rara, no sabía que había algunos procesos "más especiales" que otros.
Ahora que sabes que es un "proceso especial", decides tocar un poco su configuración para que consuma menos recursos. Tras terminar de cambiar la configuración, parece que este proceso no se ha enterado de los nuevos valores... Hmmmm, algo está pasando... ¿Cómo podrías hacer que el proceso usara los nuevos valores de la configuración, sin detenerlo si es posible, y asegurándote de que queda activo? ``

30. Nada, ni aún cambiando la configuración logras reducir el impacto del proceso en el sistema. Le dices que no preocupe, que vas a parar este proceso "especial" y vas a hacer que no se inicie al arrancar de nuevo la máquina. ¿Cómo podrías hacer estas dos acciones en UN ÚNICO comando? ``

31. Para quedarte tranquilo, comprueba que efectivamente el proceso "especial" está detenido y NO se está ejecutando (usa el comando que te da únicamente esa información) `systemctl is-active 1234` --El nombre del servicio no es correcto

32. A pesar de que el proceso "especial", en teoría, estaba detenido y no se iba a iniciar de nuevo al arrancar la máquina. El usuario viene un poco más tarde diciendo que apagó su máquina, se fue a comer, y al volver a encender la máquina, tras un rato, el proceso "maldito" volvía a estar en ejecución.
Antes de hacer nada, comprueba que efectivamente antes ejecutaste el comando de forma correcta, y el proceso no debería iniciarse al arrancar el equipo (usa el comando que te indica únicamente esta información, si el proceso debería iniciarse o no al arrancar el equipo). ``

33. Efectivamente, tras ejecutar el comando anterior confirmas que ese proceso NO debería ejecutarse al arrancar la máquina, pero la realidad es que se está ejecutando... En ese momento te das cuenta de cuál es el problema... ¡Cómo se te pudo escapar un detalle tan importante!!
Ahora que sabes cuál fue la causa, haz que ese proceso tan "especial", NO puede activarse (directamente) de ninguna manera `sudo systemctl mask 1234` --El nombre del servicio no es correcto

34. Para quedarte tranquilo, comprueba ahora que es verdad que el proceso no puede arrancarse de forma directa (usa el comando que te indica únicamente esta información). `systemctl is-enabled 1234` --El nombre del servicio no es correcto

35. Tras un tiempo en el que no habías tenido noticias del nuevo usuario, vuelve a aparecer en tu oficina con otra nuevo problema. Resulta que había lanzado el comando xed para ejecutar un editor de texto gráfico. Estando en la terminal donde ejecutó el comando, alguna combinación de teclas pulsó que ahora el editor está como "congelado", es decir, el editor sigue estando en pantalla, pero no lo puede usar porque no responde al ratón ni al teclado... ¿Qué combinación de teclas crees que pulsó? ``

36. ¿Cómo puedes hacer para que el editor vuelva a funcionar, pero que el comando NO bloquee la terminal y pueda seguir ejecutando comandos? ``

37. Al usuario le parece muy interesante lo de poder ejecutar comandos de forma que no bloqueen la terminal y se pueda seguir usando. Ahora quiere ejecutar otro editor xed en esa misma terminal, pero que no la bloquee. ¿Cómo se haría? ``

38. El usuario ha lanzado varios comandos de la forma que le has indicado, y pregunta si hay alguna forma de ver la lista de esos comandos que se están ejecutando de forma que no bloqueen la terminal, INCLUYENDO también su identificador de aplicación en ejecución (PID). ``

39. Ahora el usuario te comenta que una de esas aplicaciones que están ejecutándose sin bloquear la terminal, necesita interaccionar con el usuario y quiere que la vuelves a poner de forma que puedas introducir datos por teclado. En concreto es la aplicación xeyes, ¿cómo lo harías? ``

  [1]   Ejecutando     xed ... <br> [2]   Ejecutando     xed ... [3]-  Ejecutando     xeyes ... <br> [4]+  Ejecutando     gnome-calculator ...

40. Pues al final, a nuestro usuario lo han destinado para otra sucursal de nuestra empresa. Después de tanto tiempo, hasta le has cogido cariño y te da pena que se vaya, incluso te ha traído un regalo por todas las molestias causadas... ;)
Ahora que su equipo queda libre, desde Dirección nos han pedido preparar este equipo para otro nuevo usuario. Lo primero que nos han solicitado es desinstalar parte del software que instalamos. En primer lugar, nos dicen que hay que eliminar la aplicación calc, pero dejando la configuración, por si en el futuro hiciera falta. ``

41. Ahora elimina totalmente la aplicación aragorn `sudo apt purge aragorn`

42. También te planteas que deberías aprovechar para actualizar todo el software instalado, pero antes quieres hacerte una idea de cuántos paquetes están pendientes de actualización
¿Cómo harías para mostrar únicamente el número de paquetes que están pendientes de instalación? (se debe mostrar sólo un número). `apt list --upgradable | grep -c upgradable` --mal

43. Pues hay bastantes paquetes pendientes de actualización. Aún así, decides que vas a actualizarlos, pero, antes, te acuerdes que hay una aplicación que usa la empresa que NO debes actualizar, porque tiene que ser exactamente la versión que está instalada. Esa aplicación es xeyes, así que debes evitar que esa aplicación se pueda actualizar cuando actualices todos los paquetes. ``

44. Comprueba que, efectivamente,  xeyes está en la lista de software que no debería actualizarse. ``

45. Ahora sí, actualiza todo el software que estaba pendiente de actualización (escribe el comando que haría esa acción aquí, pero NO lo ejecutes, porque tardaría bastante tiempo!!!) `sudo apt upgrade`

## MS Windows
1. Tras unos días, el usuario te envía un mensaje diciendo que para su trabajo necesita instalar una aplicación y que no sabe cómo hacerlo. Vas a su despacho a echarle una mano, y en el camino recuerdas lo fastidioso que es instalar una aplicación en MS Windows, ya que tienes que buscar de dónde te la podrías descargar, asegurarte que es una fuente segura (o lo más segura posible, preferentemente que sea el propio desarrollador y que tenga una buena reputación), luego descargarlo, instalarlo...
Pero en ese momento te acuerdas que, desde hace poco tiempo, MS Windows dispone de un sistema propio de gestión de software, así que decides usarlo. El software que necesita instalar el usuario es WinDirStat, es una pequeña aplicación para ver el uso de disco por directorios. Consulta a ver si esta aplicación está disponible en el gestor de software de Windows. `winget search WinDirStat`

2. Pues al buscar WinDirStat sí que obtienes un resultado. Se lo comentas al usuario y te pide que le muestres más información sobre este paquete. `winget show "WinDirStat"`

3. El usuario no está muy convencido de si esa versión de WinDirStat le servirá o no, pero te pide que se la instales para probar. `winget install "WinDirStat"`

4. El usuario sigue encontrando bastantes problemas. Hoy te ha venido con algo extraño, te dice que ha estado usando la calculadora y le está consumiendo muchos recursos. Inicia una calculadora desde línea de comandos (para ello debes usar **calc.exe**), pero de forma que se le asigne un POCO MENOS de recursos que los que se asignan normalmente. `start "" /BelowNormal calc.exe`

5. Parece que ha ido algo mal, y la calculadora no tiene suficientes recursos y va bastante lenta. Vamos a investigar un poco más, lista en su equipo todos los procesos que empiezan por calc `tasklist /fi "IMAGENAME eq calc*"`

6. Con el comando anterior habrás averiguado cuál es el NOMBRE EXACTO del proceso (que NO tiene por qué coincidir con el del ejecutable). Como estos procesos están dando problemas, le comentas al usuario que vas a FINALIZAR de forma INMEDIATA todos los procesos que tengan ese NOMBRE EXACTO. `taskkill /IM calc.exe` --El comando es correcto, pero tienes errores en las opciones

7. Ahora resulta que al usuario le está dando problemas algo llamado **spooler** y que alguien le ha comentado que es "algo relacionado con el sistema de impresión y que es un programa residente o algo así que es especial, que siempre se está ejecutando". Muestra los detalles de **spooler**. `sc query spooler`

8. El usuario no sabe ni para qué se usa **spooler**, y tú investigas y no parece que sea crítico, así que decides detenerlo. `sc stop spooler`

9. Por si acaso, también vas a configurar **spooler** para que no se inicie automáticamente, sino que sólo se arranque cuando haga falta. ``

10. Tras solucionarle todos los problemas anteriores, el usuario que ha estado usando la aplicación WinDirStat, aparentemente sin problemas por un tiempo, viene a decirte de repente que la versión que le instalaste era bastante antigua, que cómo es eso posible...
En ese momento te das cuenta de que se te ha olvidado hacer algo y quizá el sistema de gestión de software no contaba con las últimas versiones de todas las aplicaciones. ¿Qué debes hacer para asegurarte de que el sistema use las últimas versiones disponibles en este momento? `winget source update`

11. Una vez que te has asegurado de que el gestor de software está usando las versiones más recientes, intenta actualizar WinDirStat (sólo ese paquete), por si hubiera alguna nueva versión. `winget upgrade "WinDirStat"`

12. A pesar de tus esfuerzos, el usuario dice que la versión de WinDirStat que está usando no le sirve, y que, de todas formas, ya no le hace falta porque lo van a cambiar a otra sucursal, así que te pide que se la desinstales, y te de las gracias por toda la ayuda prestada. `winget uninstall "WinDirStat"`
