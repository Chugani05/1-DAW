# CASOS PRÁCTICOS DE GESTIÓN, PROCESOS Y SERVICIOS
## GESTIÓN DE SOFTWARE
1. Estás trabajando en una empresa de desarrollo de software. 
Tú utilizas tu editor de código favorito, pero en la empresa todos usan el editor de texto sublime. 
Te han pedido que lo instales en tu equipo que tiene GNU/Linux con una distribución basada en Ubuntu.
El primer lugar donde deberías buscar este software tendría que ser:

a) En la sección de descargas de la página web del desarrollador para obtener el paquete de mi distrución. <br> b) En los repositorios personales de otros usuarios. <br> c) En la sección de código fuente de alguna web para poder descargar el código y compilarlo. <br> d) En los repositorios oficiales de tu distribución de GNU/Linux  **LA CORRECTA** <br> e) En los repositorios de la empresa que desarrolla este software

2. Antes de instalar el paquete, te han comentado que es recomendable *sincronizar la lista local de software con la de los servidores externos.* ¿Cómo realizas esta sincronización? `sudo apt update`

3. Ahora indica qué comando usarías para buscar el paquete del editor de texto sublime (ten en cuenta que el nombre del paquete no siempre coincide exactamente con el nombre con el que conocemos la aplicación). `apt search sublime`

4. Antes de instalar sublime, te interesa saber qué versión se va a instalar, ¿qué comando usarías? `apt policy sublime-text`

5. Instala ahora el editor de texto sublime en tu equipo. `apt install sublime-text`

6. Ahora muestra un listado de todo el software que tienes instalado en el sistema. `apt list --installed`

7. Ahora muestra un listado con todo el software de tu sistema que puede ser actualizado. `apt list --upgradable`

8. Actualiza el paquete zfs-initramfs (SÓLO ese paquete). `sudo apt install zfs-initramfs`

9. Reinstala el paquete zenity. `sudo apt reinstall zenity`

10. Elimina el cliente de correo thunderbird, pero deja su configuración por si en el futuro quisieras volver a instalarlo. `sudo apt remove thunderbird`

11. Elimina totalmente el paquete mplayer. `sudo apt purge mplayer`

12. Parece que el disco está bastante lleno, y tienes sospechas que de tanto instalar y desinstalar software, se hayan podido quedar paquetes que ya no son necesarios. Elimina los paquetes sobrantes (paquetes que se han instalado para satisfacer alguna dependencia, pero ya no están en uso) **sudo apt autoremove**

## PROCESOS
### Linux
Vamos a ejecutar una aplicación para realizar dibujos. Para ello, primero abre el menú del sistema de la barra de tareas (botón con logo de Linux Mint-LM en la esquina inferior izquierda) y en el buscador escribe "Dibujo". Debería aparecerte un icono azul y en la descripción algo así como "Utilidad de dibujo sencilla", pulse ahí para abrir la aplicación.

1. Una vez lanzada la aplicación de dibujo, ahora quieres saber su PID. Supón que la aplicación se llama exactamente dibujo, indica cómo obtendrías su **PID utilizando el NOMBRE EXACTO de la aplicación**. `pidof dibujo`

2. Vaya, pues ejecutando el comando anterior no se obtuvo ningún resultado. Probablemente es que la aplicación no se llamaba dibujo, quizá el nombre estaba en inglés. Prueba ahora a obtener el PID usando el texto draw, **aunque no estás seguro/a del nombre**, quizá la aplicación se llame de forma parecida, pero NO exactamente así. `pgrep draw`

3. Ahora sí has obtenido un PID. ¿Cómo se llamaba exactamente esa aplicación? Indica cómo **obtendrías un resumen de la información del proceso,** incluido el nombre del comando/aplicación, a partir de su PID.
NOTA: RECUERDA QUE AL COPIAR EL COMANDO AQUÍ DEBES USAR EL PID: 1234 `ps 1234`

4. Ahora que sabes el PID de la aplicación, ¿cómo harías para **TERMINAR la aplicación desde consola, permitiendo que se cierre de forma ordenada**? `kill -TERM 1234`

5. Probablemente con el apartado anterior la aplicación ya se haya cerrado, pero imagínate que estuviera colgada y no se hubiera cerrado ¿cómo harías para **MATAR la aplicación desde consola usando su PID**, cerrándola inmediatamente? `kill -9 1234 / kill -KILL 1234`

6. Ahora que ya sabes cómo se llama el comando de la aplicación de dibujo que hemos usado en los apartados anteriores, ejecútalo en una terminal (si no sabes el comando, puedes usar otro como xeyes, gnome-calculator, etc.)
Al lanzarlo, verás que se abre la aplicación. Vuelve a la terminal donde ejecutaste el comando, e intenta lanzar otro comando, por ejemplo ls -l. ¿Qué ocurre? Verás que aunque escribas el comando y pulses Enter, el comando NO se va a ejecutar...
Como vimos en clase, esto se debe a que la terminal está bloqueada por el primer comando. ¿Qué comandos o acciones tendrías que realizar **para desbloquear la terminal y poder ejecutar nuevos comandos en ESA MISMA TERMINAL**, pero de forma que la aplicación de Dibujo (o la que hayas lanzado) siga funcionando con normalidad? Si hay más de un comando/acción, usa el separador ; `CTRL+Z ; bg`

7. Ahora que has liberado la terminal y puedes lanzar más comandos. Ejecuta un nuevo comando, por ejemplo el editor xed, pero ejecútalo de forma que NO bloquee la terminal, para que puedas seguir lanzando más comandos.
TEN EN CUENTA que en clase hemos visto que para lanzar comandos de forma que no bloqueen la terminal es muy recomendable que estos comandos NO muestren la salida en pantalla, para que no interfieran.De este modo, en lugar de usar la pantalla, debemos guardar las salidas de estos comandos en ficheros. **Ejecuta xed de forma que no bloquee la terminal, que la salida normal se guarde en \~/xed.out y que se ignoren los errores.** `xed > xed.out 2> errores_cmd.txt & --NO está del todo Bien!`

8. Aunque la terminal no esté bloqueada, se están ejecutando varios comandos (los que has lanzado anteriormente). Muestra todos los comandos que se están ejecutando en esa terminal, indicando también su PID. `jobs -l`

9. Imagínate que el primer comando que lanzaste (la aplicación de Dibujo u otra similar) necesitara que le introdujeras algún dato por teclado directamente al comando (no por la interfaz gráfica). Como el comando no está bloqueando la terminal, no puedes interaccionar por teclado con él. ¿Cómo harías para que el **comando de la aplicación de dibujo volviera a bloquear la terminal y así puedas interaccionar**? `fg 1234 / fg %1`

10. Ahora que el comando de la aplicación Dibujo está bloqueando la terminal, imagínate que la aplicación se hubiera quedado "colgada" (no responde) y tú deseas cerrarla DESDE ESA MISMA TERMINAL. No puedes ejecutar ningún comando porque la terminal está bloqueada, pero hay una forma de **cancelar (Interrumpir) el comando desde esa misma terminal**, prueba a hacerlo e indica cómo lo has hecho. `Ctrl+C`

11. En el apartado anterior finalizaste una de las aplicaciones que se ejecutaban en esa terminal, pero aún te debería quedar otra que se ejecuta sin bloquear. **¿Cómo harías para que esa aplicación se siguiera ejecutando aunque se cerrara la terminal?** Una vez que hayas ejecutado el comando, puedes cerrar la terminal y comprobar si se sigue ejecutando. `disown -h 1234`

12. Abre una nueva terminal, vamos a ejecutar una aplicación que sabemos que suele solicitar muchos recursos y hacer que nuestro equipo vaya más lento, así que vamos a lanzarla con una prioridad un poco peor a la normal. Imaginemos que esta aplicación es xeyes, ejecútala de forma que su prioridad sea 5 puntos peor que la normal. `nice -5 xeyes`

13. Aunque la aplicación que lanzaste en el apartado anterior fue enviada con menos prioridad, la máquina ha empezado a ir cada vez más lenta. Haz que esta aplicación que sigue en ejecución, empeore su prioridad en otros 5 puntos. `renice -10 xeyes`

14. Parece que el equipo ya va mejor, indica el **comando que usarías para dejar la aplicación anterior con su prioridad inicial**. `No se puede`

15. Para finalizar, **muestra la carga del sistema** (utiliza cualquier de los comandos que hemos indicado en clase). `uptime`

### Windows
16. Lista todos los procesos en MS Windows que consuman más de 1MiB de memoria. `tasklist /fi "MEMUSAGE gt 1234`

17. Lanza un bloc de notas (notepad.exe) con la prioridad más baja posible. `start "" /low notepad.exe`

18. Obtén el PID de la aplicación que lanzaste en el apartado anterior. `wmic process where name="notepad.exe" get processid`

19. Vuelve a dejar al Bloc de Notas en su prioridad normal. `wmic process where processid="1234" CALL setpriority "Normal"`

20. Finaliza el Bloc de Notas de forma inmediata. `taskkill /f /PID 1234`


## SERVICIOS
### Linux
Imagínate que trabajas en una empresa como administrador de sistemas informáticos. Ha venido un usuario diciéndote que tiene problemas con una aplicación, que le ocupa muchos recursos y que el equipo le va muy lento.
Mirando en algunas webs, este usuario ha aprendido cómo ver los procesos del sistema, y está convencido que el problema de todo lo tiene el proceso "cupsd". De hecho, ha hablado con otros administradores para que finalicen este proceso, pero resulta que a pesar de que han intentado matarlo, el proceso siempre está presente.

1. Con esa información y con ese nombre, tú ya empiezas a sospechar que ese proceso es algo "especial" y se trate de un servicio o demonio, concretamente el asociado al sistema de impresión cups ¿Con qué comando podrías **asegurarte de si realmente es un servicio y, de paso, comprobar su estado**? `systemctl status cups`

2. Efectivamente, tus sospechas se han confirmado y se trata de un servicio que está activo. El usuario te insiste en que quiere **detener el proceso**, y tú le informas de que puede ser peligroso y hacer que el sistema sea inestable. Sin embargo, investigas y ves que este servicio no es crítico para el sistema, por lo que no parece haber problema en detenerlo. Avisas al usuario de las posibles implicaciones, y procedes a detener el servicio, ¿cómo lo harías? `sudo systemctl stop cups`

3. Tras detener el servicio, pensabas que el usuario no iba a crear más incidencias, pero resulta que al poco tiempo vuelve porque su equipo tiene un "comportamiento" extraño y **quiere que vuelvas a activar cups**. Tú no crees que eso esté relacionado, pero para probar, decides volver a activarlo, ¿cómo lo harías? `sudo systemctl start cups`

4. Como te temías, el usuario en cuestión vuelve al rato, diciendo que no puede trabajar por culpa de cups, que vuelve a estar consumiendo muchos recursos. En ese momento decides comprobar la configuración del servicio, a ver si hay algún parámetro extraño. **¿Cómo mostrarías la configuración de cups?** `systemctl show cups`

5. Al ver la configuración, detectas algunos parámetros que pueden ser algo elevados y estar afectando al consumo de recursos, y decides disminuir los valores a ver si así se resuelve el problema. **¿En qué directorio crees que podría estar la configuración del servicio cups?** `/etc/cups`

6. A pesar de haber cambiado la configuración, por alguna razón los nuevos valores parece que no están funcionando y sigue ejecutando la antigua configuración, ¿qué puede estar pasando?
Las nuevas configuraciones sólo se cargan al reiniciar la máquina.

a) Los servicios no permiten modificar la configuración, ya que esta la establece los desarrolladores y solo ellos pueden cambiarla. <br> b) La mayoría de servicios sólo cargan la configuración al iniciarse y no detectan cuándo la configuración ha cambiado, hay que forzarles a que la actualicen. **LA CORRECTA** <br> c) La forma de cambiar la configuración que he hecho no es correcta, la configuración debe cambiarse siempre por la interfaz gráfica del servicio.

7. ¿Cómo harías para **asegurarte de que el servicio lee la nueva configuración y permanece en el estado activo/inactivo en el que estaba previamente, de forma que evite interrumpir el servicio si es posible**? `sudo systemctl try-reload-or-restart cups`

8. Después de tu esfuerzo, aún así el usuario vuelve después de un rato diciendo que su equipo vuelve a tener problemas, y que quiere que **pares el servicio y que no se vuelva a ejecutar al reiniciar la máquina**. ¿Cómo harías esto usando UN ÚNICO COMANDO? `sudo systemctl disable cups --now`

9. Te habías olvidado ya de este usuario, pero al día siguiente vuelve a contactar contigo diciendo que a pesar de todo lo que le habías dicho y hecho, algo no es correcto porque el servicio vuelve a estar activo. ¿Cómo es esto posible? Antes que nada, primero **comprueba si realmente el servicio está activo (utiliza el comando que únicamente te dice si está activo o inactivo**). `systemctl is-active cups`

10. Pues parece que el usuario tiene razón y el servicio está activo. Comprueba ahora si el servicio se carga o no al arrancar la máquina (utiliza el **comando que sólo te muestra esta información, NO el estado completo del servicio**). `systemctl is-enabled cups`

11. Pues resulta que el servicio está configurado para que NO se cargue en el arranque, aún así está activo... El usuario jura y perjura que había reiniciado su máquina hacía ya rato, ¿qué puede haber pasado?
El comando que muestra el estado tiene un error, es imposible que ese servicio esté activo.
El usuario debe haberse equivocado y no ha reiniciado su máquina, porque una vez reiniciada no se puede activar el servicio.
Cuando se cambió la configuración hubo algún error, por lo que se sigue usando la configuración antigua.
Aunque el servicio no se haya cargado en el arranque, otro proceso o servicio puede haberlo iniciado.
Para evitar que esto suceda otra vez, indica el **comando que usarías para asegurar que el servicio NO pueda arrancarse de ninguna forma**. `sudo systemctl mask cups`

12. Comprueba ahora que cups NO puede iniciarse (utiliza el **comando que sólo te muestra esta información, NO el estado completo del servicio**). `systemctl is-enabled cups`

13. Pues pasado un tiempo, cuando ya ni te acordabas de este usuario, resulta que vuelve a contactar contigo diciendo que al final ya sabía que era lo que estaba pasando, y muy contento te dice que él solo resolvió el problema y que la máquina le iba lenta casualmente cuando para distraerse intentaba abrir con el reproductor multimedia un fichero de 300GiB de música relajante de dominio público que alguien le había dado... (sin comentarios).
Ahora que él solito ha descubierto el problema y su solución (no intentar abrir más ese archivo), quiere que dejes el servicio cups tal y como estaba al principio. Para ello, el primer paso es **quitar el bloqueo para que el servicio pueda activarse**. `sudo systemctl unmask cups`

14. Una vez eliminado el bloqueo, hay que **configurar el servicio para que se inicie al arrancar el sistema y también activar el servicio** ¿Cómo harías esto usando UN ÚNICO COMANDO? `sudo systemctl enable cups --now`

15. Ya para terminar, el usuario te pide que reinicies la máquina, para quedarse seguro de que el servicio funciona correctamente. Tú le indicas que no es necesario reiniciar, que se puede comprobar ahora, pero él te responde que no se queda tranquilo, que prefieres que reinicies y que, por si no lo sabías, el comando para reiniciar el equipo es reboot.
Tú le indicas que no es el único comando, que hay otros que permiten reiniciar la máquina, pero parece que el usuario no te cree del todo. **Muéstrale cómo podrías reiniciar la máquina usando los niveles de ejecución**. `sudo systemctl isolate runlevel6.target`

### Windows
1. Lista los servicios del sistema. `sc query`
2. Lista SOLO los servicios INACTIVOS `sc query state=inactive`
3. Muestra información sobre el servicio XblAuthManager. `sc query XblAuthManager`
4. Haz que el servicio XblAuthManager esté en ejecución (no importa si ya lo estaba) `sc start XblAuthManager`
5. Intenta pausar el servicio XblAuthManager (no importa si obtienes un error) `sc pause XblAuthManager`
6. Si el servicio XblAuthManager estuviera pausado, ¿cómo harías para que continuara ejecutándose? `sc continue XblAuthManager`
7. Muestra la configuración de XblAuthManager. `sc qc XblAuthManager`
8. Haz que el servicio XblAuthManager se inicie de forma automática (al arrancar el sistema) `sc config XblAuthManager start=auto`
9. Detén el servicio XblAuthManager. `sc stop XblAuthManager`
