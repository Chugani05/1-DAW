# PROGRAMACIÓN DE TAREAS
1. ¿Cuál NO es la característica que de cumplir, en general, los servicios?

a) Ejecutarse en segundo plano <br> b) Realizar tareas esenciales o importan <br> c) para el sistema (o aplicaciones) <br> d) Tener una interfaz usable y accesible comunicación con usuarios <br> e) Estar preparados para ejecución cor responder en cualquier momento

2. ¿De dónde suelen leer la configuración y dónde suelen mostrar las salidas y errores los servicios en GNU/Linux?

a) Como todo proceso, la entrada se hace desde teclado y las salidas y errores por pantalla <br> b) La configuración suele estar en /etc y las salidas y errores en /var/log <br> c) Los servicios no leen entradas ni muestran salidas ni errores <br> d) La configuración, entradas, salidas y errores la gestiona el cliente en modo gráfico

3. En general, y sobre todo en los serv ¿qué se recomienda sobre los servicios?

a) No activar ninguno nunca, para evita problemas de compatibilidad <br> b) Activar los estrictamente necesarios, seguridad y eficiencia de recursos <br> c) Siempre deben estar activos entre un un 80% de los servicios <br> d) Activarlos todos, para que el equipo más funcionalidades

4. En GNU/Linux, ¿quién gestiona los servicios y procesos?

a) La BIOS o la UEFI <br> b) El administrador de disco <br> c) El sistema de iniacialización (init) <br> d) El módulo de auditoría del Kernel

5. En la actualidad, ¿cuál es el sistema de inicialización más usado en las distribuciones más relevantes de GNU/Linux?

a) Systemd <br> b) System III <br> c) System V <br> d) UpStart

6. ¿Cuál es el principal comando que usa systemd para gestionar los servicios?

Response: **`Systemctl`**

7. Con systemd, ¿cómo veo la información básica del servicio (si está activo o no, si está habilitado o no, cuándo se inició, PID, consumo de memoria y CPU, etc.)

a) systemctl config <br> b) systemctl show <br> c) systemctl status <br> d) systemctl is-active <br> e) systemctl is-enabled

8. Usando systemd hay un servicio que siempre que arranco está inactivo y lo tengo que activar manualmente, ¿por qué?

a) El servicio no está instalado (uninstalled) <br> b) El servicio está deshabilitado (disabled) <br> c) El servicio está enmascarado (masked) <br> d) El servicio está aislado (isolated)

9. ¿Cuál de estas afirmaciones es VERDADERA?

a) Un servicio enmascarado NO puede estar activo <br> b) Un servicio deshabilitado NO puede estar activo <br> c) Un servicio habilitado NO puede estar inactivo <br> d) Un servicio enmascarado NO se puede activar

10. Usando systemd quiero que un servicio no se pueda volver a iniciarse ni manual ni automáticamente, ¿qué tengo que hacer?

a) systemctl stop <br> b) systemctl disable <br> c) systemctl isolate <br> d) systemctl mask

11. ¿Qué es FALSO sobre modificar la configuración de un servicio?

a) Al cambiar fichero de config. en /srv los cambios se aplican inmediatamente <br> b) La gran mayoría de servicios sólo comprueban y cargan la config. al iniciar <br> c) Generalmente hay que reiniciar o recargar el servicio para aplicar cambios <br> d) Si el servicio tiene la opción de reload, debemos usarla prioritariamente

12. Con systemd quiero aplicar una nueva configuración a un servicio y asegurarme que QUEDE ACTIVO, ¿qué se recomienda?

a) systemctl reload <br> b) systemctl restart <br> c) systemctl try-restart <br> d) systemctl reload-or-restart <br> e) systemctl try-reload-or-restart

13. ¿Qué runlevel es VERDADERO?

a) Runlevel 0: Apagado del equipo <br> b) Runlevel 1: Modo normal (multiusuario con red y entorno gráfico) <br> c) Runlevel 5: Reinicio del equipo <br> d) Runlevel 6: Monousuario sin red ni entorno gráfico (rescue)

14. En Windows, ¿cuál es el estado de los servicios que se inician a demanda, pero no durante el arranque del sistema?

a) Automático <br> b) Automático (inicio retardado) <br> c) Deshabilitado <br> d) Manual

15. En MS Windows, ¿qué forma de mostrar todos los servicios y su información básica NO es correcta?

a) En consola cmd, con el comando: service info <br> b) En consola cmd, con el comando: sc query <br> c) En PowerShell, con el cmdlet: Get-Service <br> d) Con la aplicación gráfica "Servicios" de MS

16. ¿Cómo muestro la configuración de un servicio en la terminal cmd?

a) sc config <br> b) **sc qc** <br> c) sc show <br> d) sc sconfig


# USUARIOS Y GRUPOS
1. En GNU/Linux, ¿dónde se almacenan los datos de los usuarios?

a) /etc/users <br> b) **/etc/passwd** <br> c) /etc/shadow <br> d) /etc/group

2. ¿Cuál de las siguientes afirmaciones sobre /etc/passwd es CIERTA en GNU/Linux?

a) Guarda las contraseñas de los usuarios <br> b) Guarda el grupo primario de los usuarios <br> c) Guarda los grupos secundarios de los usuarios <br> d) Guarda la caducidad y restricciones de las contraseñas de los usuarios

3. Al crear un usuario con useradd, si no indico su grupo primario... ¿qué sucede?

a) El usuario se crea sin grupo primario <br> b) **Se crea automáticamente un grupo que se llame igual que el usuario y se le asigna como primario** <br> c) Se le asigna como grupo primario el grupo por defecto <br> d) El comando da un error, no se puede crear un usuario sin indicar su grupo primario

4. Cuando creo a un usuario normal con useradd, ¿qué grupo de opciones NO deberíamos usar?

a) -d, -m <br> b) -g, -G <br> c) **-h, -r** <br> d) -S, -k

5. En GNU/Linux, ¿cómo cambio los privilegios de un usuario, por ejemplo para que pueda usar dispositivos y / o servicios, como impresoras, scanners, etc.?

a) En la aplicación de configuración de cada dispositivo <br> b) Creando un enlace simbólico a cada dispositivo <br> c) No se puede, sólo el root puede utilizar esos dispositivos <br> d) **Añadiendo el grupo secundario adecuado al usuario**

6. En GNU/Linux, si quiero cambiar la shell de arranque de un usuario, ¿cuál debo usar?

a) usermod -c <br> b) usermod -g <br> c) **usermod -s** <br> d) usermod -L

7. En GNU/Linux, ¿cuál es correcto?

a) chfn me permite cambiar la shell de inicio de un usuario <br> b) **chage me permite cambiar la caducidad de la contraseña** <br> c) chown me permite cambiar la información del usuario (nombre, oficina, etc.) <br> d) chsh me permite cambiar el usuario propietario de ficheros y directorios

8. En un script queremos cambiar la contraseña del usuario "user1", de forma que la nueva contraseña sea "r3Loj". ¿Cómo lo haríamos?

a) sudo passwd r3Loj <br> b) **sudo chpasswd <<< "user1:r3Loj"** <br> c) sudo usermod -p r3Loj user1 <br> d) No es posible cambiar contraseñas en scripts

9. Podemos usar el comando passwd para bloquear el acceso a un usuario. ¿Cuál de las siguientes opciones es FALSA?

a) sudo passwd -I user: bloquea al usuario <br> b) sudo passwd -u user: desbloquea al usuario <br> c) sudo passwd -S user: muestra si el usuario estaba bloqueado o no <br> d) sudo passwd -C user: cambia el estado del bloqueo (desbloquea si estaba bloqueado y viceversa)

10. En GNU/Linux, ¿qué estoy haciendo con el siguiente comando?getent passwd user1

a) Cambiando la contraseña a user1 <br> b) Comprobando si user1 existe y mostrando su información <br> c) Bloqueando al usuario user1 <br> d) Eliminando al usuario user1

11. Quiero eliminar el usuario usr1 que tiene una sesión abierta, borrando todo el contenido de su directorio personal y finalizando inmediatamente todos sus procesos, ¿cómo lo hago?

a) **sudo userdel -r -f usr 1 &&** <br> b) **sudo pkill -u usr1 -9** <br> c) sudo remove usr1 && <br> d) sudo xkill usr1 <br> e) sudo userdel usr1

12. En GNU/Linux, ¿qué estoy haciendo con el siguiente comando? `sudo gpasswd -d AB`

a) Cambiando las contraseñas de los usuarios A y B <br> b) Eliminando los usuarios A y B <br> c) **Quitando el grupo secundario B del usuario A** <br> d) Quitando el bloqueo de los usuarios A y B

13. En GNU/Linux, ¿cuál es FALSA?

a) `SU -` abrir la sesión como otro usuario <br> b) `who` Ver usuarios conectados <br> c) **`last` Mostrar únicamente el último usuario conectado** <br> d) `id` Ver el nombre e id del usuario y sus grupos

14. Cómo muestro la información del usuario user1 en MS Windows

a) **net user user1** <br> b) net show user1 <br> c) net info user1 <br> d) net user1

15. En MS Windows, ¿qué descripción del comando es FALSA?

a) `net user` Listar todos los usuarios locales <br> b) `net group A B/add`  Añadir al usuario B en el grupo local A <br> c) **`net user A /delete` Eliminar al usuario A** <br> d) `net user A^ * / add` Añadir al usuario A, solicitando su contraseña

16. En MS Windows, ¿cómo veo la información sobre las restricciones de las contraseñas de los usuarios? (caducidad, longitud mínima, historial de contraseñas, etc.)? DOS PALABRAS

Respuesta: **`net accounts`**
