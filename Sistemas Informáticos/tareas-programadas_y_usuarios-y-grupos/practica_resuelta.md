# Tareas Programadas y Usuarios
## GNU/Linux
1. Tu jela te pide que le "hagna el alla al nuevo empleado para que puede empezar a usar su equipo. Cuando vas a realizar esta operación, te das cuenta de que los empleados en la empresa se organizan por secciones o grupos, y al darles de alta hay que asignarles en su sección respectiva. Este empleado es de una sección que se llama "Inspectares, y no te suena haberla oido antes, asi que lo primero que debes hacer es comprobar si esta sección existe `getent group inspectores`

2. Elecovamente, bm dudas se confirman y esa sección no estaba en el sistema, nai que debes cromila antes de hacerle el alta al usuario `sudo groupadd inspectores`

3. Ahora sí puedes hacerle el alta al usuario, asegurándote que pertenece a los inspectores. Para el nombre del usuario, vamos a usar insp01, que previamente hemos comprobado que no existe y este usuario usará como bash como shell de inicio, como hacemos todos los usuarios/as en la empresa. Intenta hacerle el alta lo mejor posible, para que quede bien configurada. `sudo useradd -d /home/insp01 -g inspectores -k /etc/skel -m -s /bin/bash insp01`

4. Le pides al empleado que pruebe a conectarse a un equipo a ver si tiene algún problema. Lo intenta y te dice que le pide una contraseña y que no sabe cuál es. Decides asignarle una nueva contraseña, ¿cómo lo harías? `sudo passwd insp01`

5. Ahora que le has creado una contraseña, prueba tú a conectarte como ese usuario desde tu consola, abriendo una sesión CON EL ENTORNO DEL USUARIO. `su - insp01`

6. El usuario ya puede entrar en su cuenta, pero resulta que está acostumbrado a usar ll para listar el contenido de un directorio, y en su equipo no le funciona. Tú le indicas que realmente debe usar ls -l, pero él dice que está ya muy acostumbrado a usar ll. ¿Cómo harías para que cuando el usuario use ll, realmente estuviera haciendo ls -l? `alias ll="ls -l"`

7. Ahora te indica que tiene una aplicación que necesita un código para funcionar, y que necesita definir una variable de entorno global llamada CODIGO que tenga el valor 112233. ¿Cómo la definirías? `export CODIGO="112233"`

8. Después de haberle configurado su comando ll y creado su variable de entorno, el usuario te indica que cuando abre una nueva shell de bash, ya no le funciona ni el comando ni la variable. ¿En qué fichero deberías poner la configuración de este comando y variable para que funcione siempre al iniciar una nueva terminal con bash? INDICAR RUTA ABSOLUTA `-/.bashrs`

9. Perfecto, tras editar el fichero anterior, ya le funciona siempre que inicia una nueva shell... Sin embargo, NO le funciona en la shell que ya tenía abierta antes de que modificaras el fichero, ¿cómo lo solucionas? USA RUTAS ABSOLUTAS ``

10. Además, el usuario necesita usar la impresora (usarla, NO administrarla) y el scanner. ¿Cómo le AÑADIRÍAS esos privilegios (SIN quitar los que ya tenía)? `sudo usermod -aG lp,scanner insp01`

11. Nuestro usuario ha empezado a utilizar su aplicación de forma masiva, saltándose los límites de buen uso de la empresa y saturando la red, por lo que muchos otros usuarios se han quejado. A pesar de que le hemos advertido, nuestro usuario ha seguido ejecutando a diestro y siniestro, así que la jefa de sección ha decidido ponerle una sanción y bloquearle su cuenta. Establece esa sanción. `sudo passwd -l insp01`

12. Comprueba que realmente la cuenta del usuario esté bloqueada `sudo passwd -S insp01`

13. Tu jefa te indica que el bloqueo debe durar 5 y te insiste mucho en que no te debes olvidar de desbloquear la cuenta dentro de 5 días. Como no sabes lo que vas a estar haciendo en ese momento y, por si acaso se te olvide, decides prepararlo para que la cuenta se desbloquee automáticamente dentro de 5 días. Indica cómo lo harías (supón que este comando lo vas a ejecutar desde la cuenta de root, por lo que, en esta ocasión, NO debes usar sudo, para evitar que al usarlo te pida la contraseña). ``

14. Y otra cosa más, este usuario ha hecho un uso excesivo de la impresora, y tu jefa te ha pedido que le quites "el permiso" de impresión, para que no pueda volver a imprimir. ``

15. Ha llegado una nueva directiva de seguridad porque ha habido algunos ataques informáticos. Tenemos que hacer que nuestro usuario cambie su contraseña cada 20 días, dándole dos días de margen antes de bloquearle la cuenta si no la cambia. Por si se olvida, le mostraremos avisos desde 5 días antes. Por último, el jefe nos dice que esta persona finaliza el contrato el 15 de junio de 2024, por lo que habría que desactivarle su cuenta ese mismo día. ¿Cómo harías esto con un único comando? Debes indicar el comando y las opciones empleadas (recuerda ordenar las opciones por orden alfabético) `sudo change -E 2024-06-15 -l 2 -M 20 -W 5 insp01`

16. Además, también te dice tu jefa que por la nueva directiva de control energético, tienes que hacer que los equipos se apaguen cada día de lunes a viernes a las 21:30. Para apagarlos, usa los niveles de ejecución (como esto se ejecutará en la cuenta de root, NO debes usar sudo, ya que a esa hora no habrá nadie para poner la contraseña). `30 21 * * 1-5 systemctl isolate runlevel0.target`

17. Pues al final nuestro usuario ha obtenido otro destino, y nuestra jefa nos ha pedido que le demos de baja. Antes de eliminar al usuario, tenemos que asegurarnos que no deja nada en ejecución. Finaliza inmediatamente todas las ejecuciones del usuario insp01. `sudo pkill -9 -u insp01`

18. Elimina al usuario insp01, independientemente de si tiene o no aplicaciones aún en ejecución (que no debería, porque las acabamos de finalizar, pero por si acaso...). Elimina también todos sus archivos que tuviera en su espacio personal. `sudo userdel -f -r insp01`

19. Elimina también la sección de inspectores, ya que no hay nadie más que pertenezca a ella. `sudo groupdel inspectores`

## MS Windows
20. Tu jefa te pide que le "hagas el alta" al nuevo empleado para que pueda empezar a usar su equipo. Para el nombre del usuario, vamos a usar insp01, que previamente hemos comprobado que no existe. Al hacerle el alta, asegúrate de que el sistema te pide que le indiques la contraseña de forma que NO se vea cuando la escribes. `net user insp01 * /add`

21. Una vez creado el usuario insp01, te das cuenta de que los empleados en la empresa se organizan por secciones o grupos, y al darles de alta hay que asignarles en su sección respectiva. Este empleado es de una sección que se llama "inspectores", así que primero compruebas si existe en el sistema. Como no es así, procede a crearlo. `net localgroup inspectores /add`

22. Ahora haz que el nuevo usuario insp01 pertenezca a los inspectores. `net localgroup inspectores insp01 /add`

23. Parece que hubo un problema y el usuario insp01 se desactivó por error. Vuelve a activar al usuario insp01 y, de paso, haz que deba cambiar la contraseña cuando vuelva a iniciar la sesión, que NO pueda poner una contraseña vacía y que su cuenta se desactive el 15 de junio de 2024 ``

24. Además, tu jefa te ha dicho que TODOS los usuarios/as deben tener también las siguientes restricciones:
- Deberá cambiarse cada 20 días
- La contraseña mínima deberá ser de 8 caracteres
- No podrá usarse las 3 últimas contraseñas
`net accounts /MINPWLEN:8 /MAXPWAGE:20 /UNIQUEPW:3`

25. Ahora el usuario te pide que la calculadora se ejecute automáticamente todos los días a las 10:30. Llama a esta tarea automática "Iniciar calculadora" `schtasks /create /sc daily /st 10:30 /tn "Iniciar calculadora" /tr c:\Windows\System32\calc.exe`

26. Al final han destinado al usuario insp01 a otra sucursal de la empresa. Dale de baja de nuestros sistema `net user insp01 /del`

27. Ya tampoco va a ser necesaria la sección de inspectores. Elimínala `net localgroup inspectores /del`