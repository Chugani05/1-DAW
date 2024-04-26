# PROGRAMACIÓN DE TAREAS
- Algunas tareas que suelen programarse por su larga duración o consumo de memoria/cpu, suelen ser las copias de seguridad, migraciones, baterías de tests, auditorías de seguridad...
- Hay varios tipos de tareas programadas, como las de __tiempo__ (se ejecutan en una fecha/hora determinada), como por __evento__ (se ejecutan bajo algún hecho determinado del equipo).
- Estás tareas son realizadas por servicios que estarán activas monitorizando el tiempo o los eventos que _disparen_ (__"Triggers"__) y desencadenan tareas.
- Si el servicio no estuviera activo al momento que debe ejecutarse la tarea, este puede ignorarse, ejecutarse al iniciarse nuevamente, reprogramarse... dependiendo de la configuración del servicio.
- Por lo general estas tareas programadas son ejecutadas en una _terminal virtual_ cuyos datos de output (stdout y stderr), se pierden al finalizar la ejecución.
- Por otro lado, el directorio en el que se ejecutan las tareas no suele ser el esperado y por eso se recomiendo el uso de rutas absolutas para especificar ficheros.
- Usa redirecciones (> >> <<<) para almacenar la información y evitar su pérdida en la terminal virtual. Si hubiesen entradas de teclado, también se debe redirigir la entrada (stdin).

## Tareas por tiempo: puntuales (Comando At)
- Se suele usar el comando `at` (normalmente no viene instalada por defecto en el sistema UNIX).
- La hora se puede indicar tanto en el formato de 12 horas como el de 24. Las fechas, como recomendación, se indican en el formato japonés (YY-MM-DD)
- También soporta el uso de 'lenguaje natural' como _tomorrow, tuesday, next week, now + 10 minutes_, y _noon, midnight, teatime..._
- Una vez se invoca el comando `at` con una fecha determinada (Ex: `at 20:00 tomorrow`), se abre un pequeño intérprete de código para programar las tareas.
- Después de especificar los comandos y su redirección (Ex: `who >> ~/usuarios.txt 2>> ~/usuarios.err`), sales del intérprete con CTRL+D.
- Para mostrar la lista de tareas programadas: `atq` o `at -l`.
- Para mostrar los detalles de una tarea por su id: `at -c id`.
- Para borrar una tarea por su id: `atrm id` o `at -r id` o `at -d id`.

## Tareas por tiempo: repetitivas (Comando Cron)
- Hace referencia a Cronos.
- No posee un cliente para especificar una tarea, sino que deben escribirse en una tabla (crontab) con formato especial.
- Esta tabla es leida por el demonio _cron_ (_crond_ en algunos sistemas)
- Para editar la tabla, se debe ejecutar `crontab -e`.
- El formato que sigue es:
    1. __m__: minutos (de 0 a 59)
    2. __h__: hora (de 0 a 23)
    3. __dom__: día del mes (del 1 al 31 dependiendo del mes)
    4. __mon__: mes (de 1 a 12)
    5. __dow__: día de la semana donde 0 es domingo, 1 es lunes, 2 es martes...
    6. __command__: comando o script a ejecutar.

Un ejemplo de aplicación es:

    Usar un script para borrar ficheros temporales todos los días a las 12:15
    m h dom mon dow cmd
    15 12 * * * ~/borrar_temporales.sh >> ~/borrar_temporales.out 2>> ~/borrar_temporales.err

Los valores también se pueden especificar en estos símbolos:
- Cualquier valor: *
- Rangos (-): 4-8 (ambos inclusive)
- Lista (,): 3,6,9,12
- Intervalos (/): */5 (cada 5 = 0,5,10,15)
- Son combinables: 6-12/2 = 6,8,10,12

Otra operaciones utiles:
- Listar todas las tareas: `crontab -l`
- Borrar todas las tareas: `crontab -r`
- Para borrar una tarea en específico, se debe ingresar a la tabla y borrar su línea o comentarla con #

## Comando Watch
- Cron tiene una precisión de minutos, por lo que no es capaz de ejecutar tareas rápidamente en segundos, para eso usamos el comando Watch
- Ejecuta un comando de forma periódica, mostrando la salida en pantalla completa.
- Entre sus opciones se encuentra `-n X` (ejecuta el comando cada X segundos), `-d` (resalta diferencias en la salida), `-p` (aumenta la precisión en el cálculo de intervalos del tiempo), `-b` (emite un sonido si el comando arroja algún error).
- Un ejemplo del comando watch, en el que se simula el funcionamiento de `top`: `watch -n 1 -d ps aux`

## Tareas por eventos
- __Tareas cuando el sistema está "ocioso" (con baja carga, _idle_):__ el comando `batch`, encontrado en el paquete de `at`.
- __Tareas relacionadas con el sistema de ficheros__: el paquete `incron` (ejecutar una tarea al crear o borrar ficheros...)
- __Durante el arranque__: con el atajo @reboot en cron, si este lo soporta (Ex: `@reboot sleep 300 && ~/mi_script.sh`)
- __Cuando un usuario se conecta__: escribiendo los comandos en /etc/profile.d/
- __Cuando se abre una terminal__: escribiendo los comandos al final del fichero ~/.bashrc

# USUARIOS Y GRUPOS
## GNU/Linux
## Administración de usuarios
- crear nuevo usuario `sudo useradd nuevousuario`
(esto crea un grupo llamado igual por defecto y un directorio /home/nuevousuario)
- añadir a un grupo `useradd nuevousuario -g grupoprincipal` (el grupo debe existir)
- especificar el directorio `useradd -d /home/otrodirectorio`
- especificar nombre de usuario `useradd -c "Julia Schneider" julia`
- borrar un usuario: `userdel`
- modificar un usuario: `usermod` (Tiene una opción para todos los campos de /etc/shadow excepto GECOS. Incluye la opción de lock/unlock)
- modificar GECOS: `chfn`
- modificar shell: `chsh`
- modificar fechas de contraseña de /etc/shadow: `chage`
- para cambiar la contraseña: `passwd user`__
- para visualizar la información de GECOS: `finger user`.

### siglas
`-g` se usa para añadir al grupo principal <br>
`-G` agregar a grupo secundario(tantos como quiera)

Ejemplo: 
 > useradd nuevousuario -g grupoprincipal -G gruposecundario1,gruposecundario2

## Contraseñas
- para asignar una contraseña `sudo passwd julia`
- bloquear o desbloquear contraseña (poder o no cambiarla) <br>
`-l` , `--lock`, bloquearla <br>
`-u` , `--unlock`, desbloquearla
- establecer máximo de contraseña (hasta que expire)
--maximum=DÍAS `passwd --maximum=90 julia`
(así el usuario julia tendrá una contraseña que expire en 90 días)

## operaciones
### usermod
- cambiar nombre de inicio de sesión de usuario `usermod -l nombreantiguo nombrenuevo`
- cambiar el directorio de un usuario `usermod -d /nuevo/directorio -m nombreususario`
- agregar usuarios a grupos secundarios `usermod -G grupo1, grupo2, grupo3`
- ponerle fecha de expiración con formato AAAA-MM-DD `usermod --expiredate 2024-05-02 nombredeusuario`
- bloquear contraseña de usuario `usermod --lock nombreusuario`
- desbloquear contraseña de usuario `usermod --unlock nombreusuario`
- BORRAR CUENTA (debes ser root) `sudo userdel nombreusuario`--no borra los archivos
- borrar cuenta y forzar borrar su directorio y archivos `sudo userdel -rf nombreusuario` --forzar a borrar directorio y cuenta
- ver grupos que pertenecen a usuario `groups nombreusuario`

#### siglas
`-m` es de move <br>
`-d` de directorio

### Comando chage
- cambia número de días en los que se tiene que cambiar la contraseña `chage --list nombredeusuario` --muestra info respecto a contraseña de usuario
- establecer máximo días contraseña `chage -M 90 nombredeusuario`
- establecer contraseña como expirada (pedirá una nueva al usuario) `chage -d 0 username`

## etc/ passwd
Base de datos de usuarios del sistema. Cada línea es un usuario, y la info de este se separa mediante :

- Contiene la información de las cuentas de usuario y características.
> Cuenta (nombre de usuario) : Contraseña : UID (ID de usuario) : GID (ID de grupo) : GECOS (campo opcional con propósitos informativos) : Directorio (directorio principal o home del usuario) : shell (ruta al shell predeterminado, campo opcional)

Un ejemplo de usuario es:
> julia:x:504:506:Julia Schneider:/home/julia:/bin/bash

- Para ver el contenido del archivo: `cat /etc/passwd`

## etc/shadow
Archivo que guarda las contraseñas de los usuarios en formato encriptado, además de info del usuario

El formato es 
> name:password:lastmod:min:max:aviso:inactividad:expiración:reservado

Un ejemplo de contraseña es:
> julia:Z9B3Qve$f7tlKI8Shimc9ZDx.7KQGFBxFUrAX2xzMEOJVJ7YcEhePU5cR8Lo09V25aFbWe51eu3047K7kTlQJ3LG1K15y1:17043:0:90:7:::

- Sobre el campo de password, puede haber un * (nunca ha tenido un password), o ! (ha sido deshabilitada).
- Cuando se bloquea un usuario con `usermod -l user`, se añade un ! al comienzo del hash del password para indicar que se ha bloqueado.

## Administración de grupos
Conjunto de cuentas de usuarios que comparten permisos. A todos los usuarios se les asigna un identificador de usuario (uid) y de grupo (gid).

Ver los grupos disponibles con archivo:

## /etc/group
- Consta del siguiente formato: _name:passwd:GID:miembros_
- De forma similar a /etc/shadow, existe una versión para grupos, __/etc/gshadow__
- En cuanto a Usuarios:
    - El 0 es el root
    - luego reservados para el sistema hasta el 500
    - hasta el 999 para demonios o aplicaciones para el sistema
    - del 1000 hacia arriba son usuarios normales

### siglas
`-a` de add
`-d` de delete

### operaciones
- crear un nuevo grupo `groupadd nombregrupo`
- si queremos que sea un grupo que use el sistema `groupadd -r nombregrupo`
- cambiar nombre del grupo `groupmod -n gruponuevo grupoantiguo`
- agregar usuario a grupo con gpasswd `gpasswd -a nombredeusuario nombredegrupo`
- eliminar usuario de grupo `gpasswd -d nombredeusuario nombredegrupo`
- borrar grupo `groupdel nombredelgrupo`
- modificar grupo primario: `usermod -g GROUP user`
- modificar grupos secundarios: `usermod -G GROUP user`
- añadir a un grupo secundario SIN SOBRESCRIBIR: `usermod -a -G GROUP user`

## Getent
es un comando para consultar las bases de datos del sistema de nombres, como **`/etc/passwd`**, **`/etc/group`**, **`/etc/hosts`**

Ejemplo:
> sudo useradd -d /home/kaiman -k /etc/skel/ -g pruebas -G lpadmin -m -s /bin/bash kaiman

> Este comando crea un nuevo usuario llamado "kaiman" con un directorio de inicio en **`/home/kaiman`**, usando la configuración de **`/etc/skel/`** como base, asignándolo al grupo primario "pruebas" y al grupo secundario "lpadmin", asignándole **`/bin/bash`** como su shell predeterminado.

- para cambiar de usuario `su pepito`
- para cambiar de usuario `su nombreusuario`
- para añadir darle a usuario permiso de administrador `sudo usermod -G sudo nombreusuario`


## Windows
- `net user`: Muestra la lista de usuarios en el sistema.

- `net user ssf`: Muestra información detallada del usuario "ssf", incluyendo su nombre completo, si tiene una contraseña asignada, y su configuración de cuenta.

- `net user prb1 /add`: Agrega un nuevo usuario llamado "prb1" al sistema. Por defecto, este usuario tendrá una configuración mínima.

- `net localgroup`: Permite visualizar los grupos locales disponibles en el sistema.

- Crear grupo: `net localgroup Impresora /add`: Crea un nuevo grupo local llamado "Impresora".

- Añadir a un grupo: `net localgroup Impresora /add prb1`: Agrega al usuario "prb1" al grupo "Impresora".

- Borrar de un grupo: `net localgroup Impresora /del prb1`: Elimina al usuario "prb1" del grupo "Impresora".

- `net user prb2 */add`: Crea un nuevo usuario llamado "prb2" y solicita una contraseña al momento de crearlo.

Ejemplo: 
> `net user prb2 */add /active`: no /expires:10/10/2024 /times:L-V,14:00-21:00 /fullname:"Jesusito" /passwordreq:yes:

> Lo que hace esto es: <br>
    - Crea un nuevo usuario llamado "prb2". <br>
    - Desactiva la cuenta hasta que se active manualmente. <br>
    - Establece la fecha de vencimiento de la cuenta para el 10 de octubre de 2024. <br>
    - Define un horario de inicio de sesión válido solo de lunes a viernes, de 14:00 a 21:00. <br>
    - Establece el nombre completo del usuario como "Jesusito". <br>
    - Requiere que se establezca una contraseña para el usuario.

- Añadir a administrador (y quitar de usuarios): `net localgroup Administradores /add prb2`: Agrega al usuario "prb2" al grupo de administradores y lo elimina del grupo de usuarios estándar.

- Activar cuenta: `net user prb2 /active:yes`: Activa la cuenta del usuario "prb2".

- Cambiar las horas de inicio de sesión: `net user prb2 /times`: Permite modificar el horario de inicio de sesión del usuario "prb2".

- `net accounts`: Muestra información global de la configuración de cuentas del sistema, incluyendo la longitud mínima de la contraseña, la duración de la contraseña y otras políticas de seguridad.

Configuración de la contraseña: 
> net accounts /minpwlen:12 /minpwage:7 /maxpwage:30 /uniquepw:3: 

> Establece las siguientes políticas de contraseña: <br>
    - Longitud mínima de la contraseña: 12 caracteres. <br>
    - Edad mínima de la contraseña: 7 días. <br>
    - Edad máxima de la contraseña: 30 días. <br>
    - Número de contraseñas únicas requeridas: 3.

# Dónde está la info de cada resumen:
- Usuario: /etc/passwd
- Contraseña de bloqueo: /etc/shadow
- Grupo: /etc/group
- Contraseña grupo: /etc/gshadow