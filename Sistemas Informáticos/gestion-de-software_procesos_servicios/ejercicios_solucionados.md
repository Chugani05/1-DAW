# HOJA DE EJERCICIOS DE GESTIÓN DE SOFTWARE
## Comandos Gestión de Software GNU/Linux
1. Sincroniza tu lista de software local con la de los repositorios oficiales: 
```bash
sudo apt update
```

2. Lista todo el software que está en los repositorios oficiales, ¿cuántos paquetes hay?: 
```bash
apt list
```

3. Lista todo el software que tienes instalado en tu sistema, ¿cuántos paquetes tienes?: 
```bash
dpkg -l | grep '^ii'
```

4. Lista todo el software que puede ser actualizado en tu sistema, ¿cuántos son?: 
```bash
apt list --upgradable| grep -c upgradable
```

5. Muestra todos los repositorios que usa tu sistema para gestionar el software... ¿son todos oficiales? ¿hay alguno de empresas externas? ¿y PPA?: `cat /etc/apt/sources.list` y `cat /etc/apt/sources.list.d/*` te mostrarán los repositorios configurados. Puedes verificar si son oficiales o de terceros.

6. Lista todos los repositorios que tienes en tu sistema. Al listarlos aparecerán etiquetas como jammy, vanessa, main, universe, multiverse, restricted, security, backports... ¿qué significan?: Estas etiquetas representan diferentes componentes y secciones de los repositorios de Ubuntu. Por ejemplo, `main` contiene software completamente compatible con la política de Ubuntu, `universe` contiene software mantenido por la comunidad, `multiverse` contiene software no libre y `restricted` contiene software con restricciones legales. `security` y `backports` contienen actualizaciones de seguridad y versiones posteriores del software, respectivamente.

7. Identifica 7 de estas etiquetas y explica su significado:**
   - `main`: Contiene software completamente compatible con la política de la distribución.
   - `universe`: Contiene software mantenido por la comunidad.
   - `multiverse`: Contiene software no libre.
   - `restricted`: Contiene software con restricciones legales.
   - `security`: Contiene actualizaciones de seguridad.
   - `backports`: Contiene versiones posteriores del software.
   - `vanessa`: Nombre de una versión específica de Ubuntu.

8. Instala la aplicación "galletas de la fortuna" (fortune cookies): 
```bash
sudo apt install fortune
```

9. Instala varios paquetes útiles mostrando información sobre ellos antes de instalarlos:
```bash
apt show nombre_del_paquete
```

10. Elige un paquete de la lista de actualizaciones y actualízalo: 
```bash
sudo apt upgrade nombre_del_paquete
```

11. Actualiza todos los paquetes del sistema: 
```bash
sudo apt upgrade
```

11. Reinstala algún paquete instalado: 
```bash
sudo apt reinstall nombre_del_paquete
```

11. Elimina algún paquete instalado dejando su configuración:
```bash
sudo apt remove nombre_del_paquete
```

11. Elimina totalmente algún paquete instalado: 
```bash
sudo apt purge nombre_del_paquete
```

11. Instala Google Chrome, MS Teams, o Skype: Por ejemplo, para instalar Google Chrome, descarga el paquete .deb desde el sitio web oficial y luego instálalo con `sudo dpkg -i nombre_del_paquete.deb`.

11. Indica durante la instalación si deseas añadir los paquetes recomendados, sugeridos y/o las mejoras: Puedes usar la opción `--install-recommends` o `--no-install-recommends` con `apt` para instalar o no instalar los paquetes recomendados.

11. Añade un repositorio de una empresa reconocida y luego instala un paquete de ese repositorio: Por ejemplo, para añadir el repositorio de Google Chrome y luego instalar Chrome, sigue las instrucciones proporcionadas por Google para añadir el repositorio y luego instala el paquete.

11. Añade un repositorio personal de un usuario reconocido y luego instala un paquete de ese repositorio: Para añadir el repositorio, edita los archivos en `/etc/apt/sources.list` y `/etc/apt/sources.list.d/`. Luego, instala el paquete usando `apt`.

11. Elimina el software instalado a través de repositorios externos y elimina esos repositorios: 
```bash
sudo apt remove --purge nombre_del_paquete
```

11. Elimina todos los paquetes del sistema que se instalaron como dependencias y ya no son necesarios: 
```bash
sudo apt autoremove
```

## FHS en GNU/Linux
1. ¿Qué hace el siguiente comando?:`ls -l` Este comando lista el contenido del directorio raíz del sistema en formato detallado.

1. Después de ejecutar el comando anterior, explica para qué se utiliza cada directorio de los que aparecen en la salida:
   - `/bin`: Contiene los binarios esenciales del sistema.
   - `/etc`: Almacena los archivos de configuración del sistema.
   - `/home`: Directorios de usuarios.
   - `/lib` y `/lib64`: Bibliotecas compartidas esenciales.
   - `/usr`: Contiene archivos y directorios secundarios, incluidos binarios, bibliotecas y documentación.
   - `/var`: Almacena archivos variables como logs y bases de datos.

3. ¿Por qué tenemos tres directorios aparentemente iguales? Explica para qué se usa cada uno de ellos: `/bin`, `/usr/bin` y `/usr/local/bin`:
   - `/bin` contiene binarios esenciales para el sistema operativo.
   - `/usr/bin` contiene binarios para los usuarios del sistema.
   - `/usr/local/bin` contiene binarios de software instalado localmente que no provienen del repositorio oficial del sistema.

4. ¿Por qué tenemos varios directorios aparentemente iguales? Explica para qué se usa cada uno de ellos: `/lib`, `/lib32`, etc.: Estos directorios pueden contener bibliotecas compartidas para diferentes arquitecturas. Por ejemplo, `/lib` podría contener bibliotecas para la arquitectura predeterminada del sistema, mientras que `/lib32` podría contener bibliotecas para una arquitectura de 32 bits en un sistema de 64 bits.

5. Al instalar un software, gran parte de él va a uno de los siguientes directorios, ¿para qué se usa cada uno? `/usr`, `/usr/local` y `/opt`:**
   - `/usr`: Contiene archivos de solo lectura compartidos entre todos los usuarios.
   - `/usr/local`: Contiene archivos específicos del sistema local que no son gestionados por el gestor de paquetes.
   - `/opt`: Utilizado para instalar paquetes de software adicionales de terceros.

## Comandos Gestión de Software Windows
1. Sincroniza tu lista de software local con los repositorios oficiales: 
```cmd
winget refresh
```

2. Lista todo el software que está en los repositorios, ¿cuántos paquetes hay?: 
```cmd
winget search
```

3. Lista todo el software que tienes instalado en tu sistema, ¿cuántos paquetes tienes?: 
```cmd
winget list
```

4. Lista todo el software que puede ser actualizado en tu sistema, ¿cuántos son?: 
```cmd
winget upgrade --dry-run
```

5. Lista todos los repositorios que tienes en tu sistema: 
```cmd
winget source list
```

6. Instala varios paquetes útiles mostrando información sobre ellos antes de instalarlos: 
```cmd
winget show <nombre_paquete>
```

7. De la lista de software a actualizar, elige un paquete y actualiza sólo ese paquete: 
```cmd
winget upgrade <nombre_paquete>
```

8. Actualiza todos los paquetes: 
```cmd
winget upgrade --all
```

9. Elimina alguno de los paquetes que instalaste en apartados previos: 
```cmd
winget uninstall <nombre_paquete>
```

# HOJA DE EJERCICIOS DE PERMISOS EN GNU/LINUX
1- Sobre el comando que se utiliza para modificar los permisos, indica lo siguiente

1. ¿Qué comando es? 
```bash
chmod
```

2. ¿Qué opción debo usar para que me vaya mostrando todos los ficheros y directorios afectados? 
```bash
chmod -v
```
El `-v` se utiliza para **activar el modo "verbose" o detallado**. Cuando se usa `-v`, `chmod` mostrará mensajes detallados en la salida estándar, indicando los cambios realizados en los permisos de los archivos o directorios.

3. ¿Qué opción debo usar para que me vaya mostrando sólo los ficheros y directorios que han cambiado el permiso? 
```bash
chmod -c
```
El comando solo mostrará **mensajes detallados si se realizan cambios en los permisos.** Si no hay cambios, no se mostrará ningún mensaje. Esto puede ser útil cuando solo estás interesado en ver información sobre los cambios realizados, en lugar de ver un mensaje para cada archivo, incluso si los permisos no han cambiado.

2- El comando para cambiar los permisos tiene una opción para no sólo cambiar los permisos de un directorio, sino también de TODO su contenido, incluyendo subdirectorios.

1. ¿Qué opción permite eso? 
```bash
chmod -R
```
Se utiliza para aplicar cambios de permisos de manera recursiva a directorios y sus contenidos. Si estás cambiando los permisos de un directorio y quieres que esos cambios se apliquen a todos los archivos y subdirectorios dentro de él, puedes usar la opción `-R`.

2. ¿Por qué puede ser MUY peligroso asignar el mismo permiso a todo el contenido de un directorio?

Entre otras cosas, al utilizar la opción recursiva, asignarías el MISMO PERMISO a TODO el contenido, independientemente de su tipo. Esto puede ser muy peligroso, ya que cada elemento debería tener un permiso adecuado a su tipo, y asignar el mismo permiso a todos podría generar problemas de seguridad.

3. Investiga cómo se podría evitar este problema que has comentado en el apartado anterior.

Hay varias opciones, una de ellas puede ser usar el comando `find` para filtrar por tipo. Además, el permiso "falso" llamado `X` (mayúscula) en `chmod` permite añadir el permiso "x" solo a los directorios, evitando convertir documentos normales en ejecutables por error.

3- Indica cómo se ven los permisos de ficheros y directorios en GNU/Linux y qué significa cada uno de ellos. ¿Cómo veo quién es el propietario del fichero y a qué grupo pertenecen?

Los permisos se pueden mostrar con un simple listado: `ls -l`. Si ejecutamos `ls -l`, la primera columna indica el tipo de elemento en el primer carácter (`-`: fichero, `d`: directorio, `l`: enlace, etc.) y los 9 caracteres restantes están agrupados de 3 en 3 y son para los permisos del usuario (propietario), grupo, y otros.

- `rwxrwxrwx` _(usuario grupo otros)_
- `r`: lectura en ficheros / listar contenido en directorios
- `w`: escritura (modificación) en ficheros / modificar directorios
- `x`: ejecución en ficheros / acceso en directorios

El propietario se muestra en la tercera columna y el grupo en la cuarta.

Ejemplo: `-rw-rw-r-- 1 user1 grupo1   21896 jul 12 19:15 fichero.txt`

4- Sobre los permisos:

1. ¿Cuáles son los permisos más comunes para ficheros y directorios y qué implican?

   **Ficheros:** `640`, `664`, `644`... Normalmente, el usuario puede leer y escribir, y el resto depende de la configuración, pero suele estar más restringido.

   **Directorios:** `750`, `770`, `755` (rwx, y a grupos y otros solo leer y ejecutar pero no editar o write), `750`... Normalmente, el usuario tiene control total, y el resto depende de la configuración, pero suele estar más restringido.

1. Cuando creas un fichero cualquiera en tu equipo, ¿qué permisos se establecen por defecto y qué permiten y qué no?

   Depende de tu configuración, normalmente es `664`(usuario puede leer y modificar, grupo también, y otros solo pueden leer) o similar en entornos de usuario (en servidores suele ser más restrictivo, como `640` (a otros no les da ningún permiso)).

1. Y si en vez de crear un fichero creas un directorio, ¿cuáles son los permisos por defecto?

   Depende de tu configuración, normalmente es `775` (usuario y grupo todos los permisos, y otros solo ver y ejecutar) o similar en entornos de usuario (en servidores suele ser más restrictivo, como `750`).

1. Investiga cómo se podrían cambiar estos permisos por defecto.

   Usando el comando `umask`. Por ejemplo, `umask 0022` significa que los permisos predeterminados serán `755` para directorios y `644` para archivos.

5- Crea 10 archivos en tu equipo, desde `fich01` a `fich10`. Elige los permisos más adecuados para los siguientes casos e indica el comando y opciones para asignarle los permisos:

1. **fich01**: Es un documento confidencial en el que estás trabajando tú con tu equipo. 
```bash
chmod 660 fich01
```

2. **fich02**: Son unas instrucciones que deberían poder ser consultadas por todos, pero sólo tú puedes modificarlas. 
```bash
chmod 644 fich02
```

3. **fich03**: Es un documento muy confidencial, sólo tú deberías tener acceso. 
```bash
chmod 600 fich03
```

4. **fich04**: Es un documento compartido que todos deberían poder leer y modificar. 
```bash
chmod 666 fich04
```

5. **fich05**: Es un documento que estás modificando y que, además de ti, sólo podrá ser consultado por tu grupo, sin que pueda modificarlo. 
```bash
chmod 640 fich05
```

6. **fich06**: A este documento le falta por añadirle el permiso para que otros puedan leerlo y escribirlo. 
```bash
chmod o+rw fich06
```

7. **fich07**: Este documento podía ser modificado por tu grupo y otras personas, pero ahora has decidido que sólo tú puedas modificarlo. 
```bash
chmod go-w fich07
```

8. **fich08**: Es un script que cualquiera puede ejecutar, pero sólo tú puedes modificar. 
```bash
chmod 755 fich08
```

9. **fich09**: Es un script que tanto tú como tu equipo pueden modificar y ejecutar. 
```bash
chmod ug=rwx fich09
```

10. **fich10**: Es un documento que quieres proteger para que sólo tú puedas leerlo, pero no modificarlo. 
```bash
chmod u=r fich10
```

6- Crea 5 directorios en tu equipo, desde `dir1` a `dir5`. Elige los permisos más adecuados para los siguientes casos e indica el comando y opciones para asignarle los permisos:

1. **dir1**: Tú y solo tú tienes el control total de este directorio, mientras que el resto no puede hacer nada. 
```bash
chmod 700 dir1
```

2. **dir2**: Tú tienes el control total, pero tu grupo puede acceder y ver el contenido. 
```bash
chmod u=rwx,g=rx dir2
```

3. **dir3**: Tú y tu equipo pueden ver el contenido del directorio y acceder a él, pero no modificarlo. Los demás sólo pueden acceder sin ver el contenido ni modificarlo.  _(1 es solo ejecutar o abrir)_
```bash
chmod 551 dir3
```

4. **dir4**: Todos tienen el acceso total. 
```bash
chmod 777 dir4
```

5. **dir5**: Tú tienes control total, tu grupo puede acceder y modificar sin ver contenido, los demás sólo pueden ver contenido. _(3 es ejecutar y modificar, y 4 solo ver)_
```bash
chmod 734 dir5
``` 

7- Indica de qué tipo se trata (fichero, directorio, ...) y qué se puede hacer y qué no con los siguientes permisos:

1. `drwxr-xr-x` *directorio, el propietario tiene control total, el grupo puede acceder y ver contenido, pero no modificar, y los demás pueden acceder pero no verlo ni modificarlo*

1. `-rwxr-xr-x` *fichero ejecutable, el propietario tiene control total, el grupo y otros pueden leer y ejecutar*

1. `lrwxrwxrwx` *enlace (normalmente en los enlaces se dan todos los permisos, luego ya se aplicarán los permisos del elemento al que enlaza)*

1. `drwxr-x---` *directorio, el usuario tiene control total, el grupo puede acceder y ver el contenido, y los demás no tienen ningún permiso*

1. `-rw-r--r--` *fichero, el propietario puede leer y escribir, el grupo y los otros, sólo leer*

1. `-rw-rw----` *fichero, el propietario y el grupo pueden leer y escribir. Los otros no pueden hacer nada.*

1. Fichero con permisos `644` *el propietario puede leer y escribir, el grupo y los otros, sólo leer*

1. Directorio con permisos `755` *el propietario tiene control total, el grupo y otros pueden acceder y ver contenido, pero no modificar*

1. Fichero con permisos `600` *el propietario puede leer y escribir. El grupo y los otros no pueden hacer nada.*

1. Directorio con permisos `740` *el propietario tiene control total. El grupo sólo puede ver el contenido. Los otros no pueden hacer nada*

8- En mi servidor web estoy teniendo un problema y sospecho que es por permisos, ¿es buena idea asignar el permiso `777` a los directorios para ver si así se soluciona el problema? Razona la respuesta.

No, ya que eso permitiría que cualquier usuario tuviera control total de esos directorios. Esto podría ser una seria amenaza para la seguridad, ya que los permisos `777` otorgan todos los derechos de lectura, escritura y ejecución a todos los usuarios, lo cual es innecesario y puede exponer datos sensibles o permitir modificaciones no autorizadas en el servidor web. Es preferible identificar y corregir el problema de permisos de manera más específica y segura.

# HOJA DE EJERCICIOS DE PROCESOS
## Ejercicio A (GNU/Linux)

1. Realizar todos los ejercicios que están al final del documento con la teoría de Procesos y tareas (GNU/Linux)

No puedo realizar los ejercicios finales del documento sin acceso al mismo. Si proporcionas los ejercicios específicos, estaré encantado de ayudarte a resolverlos.

## Ejercicio B (GNU/Linux)
1. Ejecutar el comando `ps aux` e indicar qué significa cada columna. ¿Qué estados puede tener un proceso y qué significa cada uno?
   - El comando `ps aux` muestra información detallada sobre todos los procesos del sistema. Las columnas significan:
     - USER: El usuario que inició el proceso.
     - PID: El ID del proceso.
     - %CPU: El porcentaje de CPU utilizado por el proceso.
     - %MEM: El porcentaje de memoria utilizada por el proceso.
     - VSZ: Tamaño virtual de la imagen del proceso en (KiB).
     - RSS: Tamaño de la memoria física que el proceso está utilizando (KiB).
     - TTY: Terminal asociado con el proceso.
     - STAT: Estado del proceso. Puede ser S (Sleeping), R (Running), Z (Zombie), etc.
     - START: Hora de inicio del proceso.
     - TIME: Tiempo de CPU utilizado por el proceso.
     - COMMAND: Nombre del comando que inició el proceso.

2. Ejecutar el comando `uptime`. ¿Qué significa cada uno de los datos que muestra y qué información puedo obtener de ellos?
   - El comando `uptime` muestra el tiempo que ha estado funcionando el sistema, el número de usuarios conectados y la carga promedio del sistema durante los últimos 1, 5 y 15 minutos. La carga promedio indica cuánto trabajo tiene el sistema.
   - Por ejemplo, si la carga promedio es 1.00 en un sistema con un solo procesador, significa que hay suficiente trabajo para mantener ocupado el procesador durante todo el tiempo, sin ningún proceso esperando en la cola.

3. ¿Un sistema con 8 cores tiene una carga de 5.3, a qué porcentaje aproximado de rendimiento está funcionando este equipo?
   - Si el sistema tiene 8 cores, una carga de 5.3 indica que el sistema está utilizando aproximadamente el 66.25% de su capacidad total (5.3 / 8 * 100).

4. a) Obtener el PID del proceso que más % CPU esté usando en ese momento:
   ```bash
   ps aux --sort=-%CPU | awk 'NR==2 {print $2}'
   ```
   b) Obtener el PID del proceso que más % MEM esté usando en ese momento:
   ```bash
   ps aux --sort=-%MEM | awk 'NR==2 {print $2}'
   ```

5. ¿Qué información me muestra el comando `jobs`? ¿Qué significan los símbolos + y - que aparecen en la lista?
   - El comando `jobs` muestra los trabajos en segundo plano asociados con la shell actual. Los símbolos + y - indican el trabajo activo y el trabajo previo, respectivamente.

6. Al ejecutar el comando `jobs` veo que, por ejemplo, el elemento [3] de la lista está en estado stopped (Detenido, Terminado, Terminated o similar), ¿qué significa esto? ¿cómo puedo hacer que pase a ejecutarse en segundo plano?
   - Significa que el trabajo ha sido detenido. Puedes reanudar el trabajo en segundo plano utilizando el comando `bg %3`.

7. He lanzado un comando `xeyes` que ya se está ejecutando en primer plano, indicar qué tendría que hacer para pasarlo a ejecutar en segundo plano (y que siga ejecutándose):
   - Puedes presionar `Ctrl + Z` para detener el proceso y luego ejecutar `bg` para ponerlo en segundo plano.

8. Lanzar el comando `xeyes` en segundo plano, y luego volver a pasarlo a primer plano:
   - Puedes ejecutar `xeyes &` para lanzarlo en segundo plano y luego usar el comando `fg` para llevarlo al primer plano.

9. ¿Cómo puedo hacer que el comando `xeyes` se siga ejecutando aunque se cierre la shell en la que se ejecutó si aún no lo he lanzado?
   - Puedes usar `nohup` para ejecutar el comando:
     ```bash
     nohup xeyes &
     ```

10. ¿Cómo puedo hacer que el comando `xeyes` se siga ejecutando aunque se cierre la shell en la que se ejecutó si ya se está ejecutando?
    - Puedes usar `disown` para desvincular el proceso de la shell actual:
      ```bash
      disown
      ```

11. Como usuario tienes que lanzar el comando `xeyes` con la mínima prioridad posible, ¿qué comando utilizarías? ¿qué valor le asignarías y cuánta es la prioridad efectiva final? ¿por qué? ¿qué pasaría en el caso inverso, que quisiera asignarle la máxima prioridad posible antes de lanzarlo?
    - Puedes usar `nice` para ajustar la prioridad del proceso:
      ```bash
      nice -n 19 xeyes
      ```
     - Esto establecerá la prioridad más baja posible, con un valor de ajuste de -20 a 19. La prioridad efectiva final sería 19, ya que los valores más altos indican una prioridad más baja. Si quisieras asignar la máxima prioridad, usarías un valor de -20:
      ```bash
      nice -n -20 xeyes
      ```

12. Repetir el ejercicio anterior, pero sobre el comando `xeyes` que ya se está ejecutando (indicar qué comando hay que utilizar para modificar la prioridad de un proceso que ya está en ejecución, y qué valores máximos y mínimos se pueden asignar).
    - Puedes usar `renice` para cambiar la prioridad de un proceso en ejecución. Por ejemplo, para aumentar la prioridad de un proceso con PID 1234 a -15:
      ```bash
      renice -n -15 -p 1234
      ```
     - Y para disminuir la prioridad:
      ```bash
      renice -n 15 -p 1234
      ```

## Ejercicio C (MS Windows)
1. Mostrar el PID, nombre y prioridad de todos los procesos del sistema:
   ```cmd
   tasklist /fo table /nh
   ```

2. Mostrar el PID, nombre y prioridad de todos los procesos del sistema que empiecen por la letra "c":
   ```cmd
   tasklist /fo table /nh | findstr /i "^c"
   ```

3. Lanza varias instancias del "Bloc de notas" (`notepad.exe`) y muestra todos sus PIDs:
   ```cmd
   start notepad.exe
   start notepad.exe
   ```

4. Muestra todos los procesos que consuman más de 50MB de memoria:
   ```cmd
   tasklist /fo table /nh | findstr /r " [5-9][0-9][0-9][0-9][0-9] "
   ```

5. Muestra solo los procesos que estén ejecutándose (estado RUNNING):
   ```cmd
   tasklist /fo table /nh | findstr /i "Running"
   ```

6. Muestra todos los procesos que llevan consumidos más de 10 segundos de tiempo de CPU y tienen más de 10MB en memoria:
   ```cmd
   tasklist /fo table /nh | findstr /r "[1-9][0-9][0-9][0-9][0-9]  .*[1-9][0-9][0-9][0-9][0-9] "
   ```

7. Finaliza de forma inmediata todos los "Bloc de notas":
   ```cmd
   taskkill /f /im notepad.exe
   ```

8. Lanza una calculadora, obtén su PID y finaliza su ejecución usando su PID:
   ```cmd
   start calc.exe
   tasklist /fi "imagename eq calc.exe"
   taskkill /pid <PID> /f
   ```

9. Ejecuta una calculadora con la prioridad mínima y otro con la prioridad máxima:
   ```cmd
   start /low calc.exe
   start /high calc.exe
   ```

10. Modifica la prioridad de las dos calculadoras del ejercicio anterior y ponla en "Normal":
    ```cmd
    wmic process where "name='calc.exe'" CALL setpriority 32
    ```

# HOJA DE EJERCICIOS DE SERVICIOS Y DEMONIOS
## GNU/Linux

1. Muestra todos los servicios de tu sistema
```bash
sudo systemctl list-units --type=service
```

2.  Elige 3 servicios de tu sistema y, para cada uno de ellos, indica:
   
      a) - **Nombre:** sshd <br> - **Uso:** Permite el acceso remoto seguro al sistema a través del protocolo SSH. <br> - **Estado:** Activo <br> - **Habilitado:** Sí <br> - **Enmascarado:** No

      b) - **Nombre:** apache2 <br> - **Uso:** Servidor web Apache, utilizado para alojar sitios web. <br> - **Estado:** Activo <br> - **Habilitado:** Sí <br> - **Enmascarado:** No

      c) - **Nombre:** cups <br> - **Uso:** Sistema de impresión Common Unix Printing System, permite la gestión de impresión en el sistema. <br> - **Estado:** Activo <br> - **Habilitado:** Sí <br> - **Enmascarado:** No

3. Los procesos "comunes" suelen tomar las entradas de periféricos como el teclado (o ratón) y mostrar las salidas y/o errores en pantalla. ¿Los servicios también funcionan así? Si no es así, indica de dónde suelen tomar las entradas (la configuración del servicio, por ejemplo) y dónde suelen mostrar las salidas (información de accesos, errores, etc.).

Los servicios en GNU/Linux generalmente no interactúan directamente con dispositivos de entrada/salida como teclados o ratones. Obtienen configuración de archivos de configuración específicos y pueden enviar salida a varios destinos, incluidos registros de sistema, archivos de registro específicos del servicio o incluso a otras aplicaciones a través de sockets o archivos de salida específicos.

4. He cambiado la configuración de un servicio, pero por alguna razón parece que el servicio no se ve afectado por los cambios... ¿qué puede estar pasando? ¿qué tengo que hacer?

Si has cambiado la configuración de un servicio y no parece afectar su funcionamiento, puede ser debido a la falta de reinicio del servicio después de aplicar los cambios. Algunos servicios requieren un reinicio para aplicar cambios en su configuración.

5. a) ¿Es siempre seguro detener cualquier servicio? ¿Por qué?

   No siempre es seguro detener cualquier servicio, ya que algunos servicios pueden ser críticos para el funcionamiento del sistema o pueden tener dependencias con otros servicios. Detener un servicio incorrecto podría causar problemas en el sistema.

   b) ¿Es siempre seguro reiniciar cualquier servicio? ¿Por qué?

   Tampoco es siempre seguro reiniciar cualquier servicio, ya que podría interrumpir el funcionamiento de otras aplicaciones o procesos que dependen de ese servicio.

6. Para un servicio dado, por ejemplo openvpn (o cups o algunos de los que vimos en clase), indica lo que debo hacer para:
   - Consultar su estado: 
      ```bash
      sudo systemctl status openvpn
      ```
   - Consultar su configuración: 
      ```bash
      sudo systemctl show openvpn
      ```
   - Detenerlo: 
      ```bash
      sudo systemctl stop openvpn
      ```
   - Activarlo: 
      ```bash
      sudo systemctl start openvpn
      ```
   - Reiniciarlo: 
      ```bash
      sudo systemctl restart openvpn
      ```
   - Reiniciarlo (sólo si estaba previamente activo): 
      ```bash
      sudo systemctl reload-or-restart openvpn
      ```
   - Recargar su configuración: 
      ```bash
      sudo systemctl reload openvpn
      ```
   - Recargar su configuración y, si eso falla, reiniciarlo: 
      ```bash
      sudo systemctl try-restart openvpn
      ```
   - Recargar su configuración y, si eso falla, reiniciarlo (sólo si estaba previamente activo): 
      ```bash
      sudo systemctl reload-or-restart openvpn
      ```

7. Cada servicio puede estar activo/inactivo, habilitado/deshabilitado, enmascarado/desenmascarado...

   a) ¿Qué significa cada uno de estos estados?
   - **Activo/Inactivo:** Indica si el servicio está actualmente en ejecución.
   - **Habilitado/Deshabilitado:** Indica si el servicio se iniciará automáticamente al arrancar el sistema.
   - **Enmascarado/Desenmascarado:** Indica si el servicio ha sido enmascarado para evitar que se inicie o si está desenmascarado y puede iniciarse normalmente.

   b) ¿Qué comando se utiliza para saber si un servicio está en cada uno de estos estados?
   - Para verificar si un servicio está activo/inactivo: 
      ```bash
      sudo systemctl is-active <nombre_servicio>
      ```
   - Para verificar si un servicio está habilitado/deshabilitado: 
      ```bash
      sudo systemctl is-enabled <nombre_servicio>
      ```
   - Para verificar si un servicio está enmascarado/desenmascarado: 
      ```bash
      sudo systemctl is-enabled <nombre_servicio>
      ```

   c) ¿Están esos estados están relacionados? Es decir, sabiendo que un servicio está deshabilitado ¿puede saber si está activo o no? ¿Puede estar un servicio activo si está enmascarado?

   Estos estados están relacionados pero no determinan directamente uno al otro. Por ejemplo, un servicio puede estar deshabilitado pero aún así estar activo si se inició manualmente. Y un servicio puede estar enmascarado pero aún así estar activo si se inició antes de ser enmascarado.

   d) Usando un único comando, ¿cómo puedo habilitar un servicio y activarlo a la vez? ¿Y viceversa (deshabilitar y parar un servicio)?
   - Para habilitar y activar un servicio a la vez: 
      ```bash
      sudo systemctl enable --now <nombre_servicio>
      ```
   - Para deshabilitar y detener un servicio a la vez: 
      ```bash
      sudo systemctl disable --now <nombre_servicio>
      ```

8. ¿Qué es lo que tengo que hacer si quiero?:

   a) Parar un proceso que alguien me ha comentado que es un servicio 
   ```bash
   sudo systemctl stop <nombre_servicio>
   ```

   b) Evitar que ese proceso aparezca cada vez que arranco el equipo
   
   ```bash
   sudo systemctl disable <nombre_servicio>
   ```

   c) ¿Es suficiente con parar un servicio y no cargarlo en cada arranque para asegurar que ese servicio nunca más se volverá a ejecutar? Si no fuese suficiente, ¿por qué? ¿cómo podría asegurarme que un servicio no se va a poder ejecutar de nuevo?

   No es suficiente con detener y deshabilitar un servicio para asegurar que nunca más se ejecutará, ya que alguien con privilegios de administrador podría volver a habilitarlo y reiniciarlo. Para evitarlo completamente, se puede eliminar el archivo de servicio o ajustar los permisos para que no sea ejecutable.

9. Sobre los niveles de ejecución (runleveles) en GNU/Linux:

   a) ¿Para qué se usan y qué implican? 

   Los niveles de ejecución son diferentes estados operativos del sistema, cada uno con un conjunto diferente de servicios y aplicaciones en ejecución.

   b) ¿Cuántos hay en tu sistema y qué significa cada uno?

   En sistemas modernos basados en systemd, el concepto de runlevels tradicionales se ha reemplazado por "targets" o "objetivos" que representan estados específicos del sistema.

   c) ¿En qué runlevel te encuentras actualmente? 
   ```bash
   systemctl get-default
   ```

   d) Si el sistema presenta un error y necesito que se cargue lo mínimo posible, ¿qué runlevel debería usar? ¿Con qué comando puedo pasar a ese runlevel? 
   ```bash
   sudo systemctl isolate rescue.target
   ```

   e) Si mi sistema tiene un error y para solucionarlo necesito tener acceso a Internet, ¿cuál es el runlevel mínimo que tendría que usar? 
   ```bash
   sudo systemctl isolate network.target
   ```

   f) Si en una emergencia necesito apagar mi sistema, ¿podría hacerlo con runlevels? ¿cómo? ¿Y si necesito reiniciarlo?
   - Para apagar el sistema en una emergencia: 
      ```bash
      sudo systemctl poweroff
      ```
   - Para reiniciar el sistema: 
      ```bash
      sudo systemctl reboot
      ```

10. a) ¿Qué sistema Sistema de inicialización del kernel (init system) estás usando? ¿Cómo lo sabes?
   - Puedes averiguar el init system usando el comando: `ps -p 1 -o comm=`. Por ejemplo, si muestra `systemd`, estás usando systemd como init system.

b) Muestra el total de tiempo que tarda en arrancar tu máquina. Generalmente el tiempo total se desglosa en varias etapas, ¿qué significa cada una de estas etapas? ¿Cuál es la que más tarde? ¿y la que menos? ¿por qué crees que esto es así?
   - El tiempo de arranque se puede verificar con el comando 
   ```bash
   systemd-analyze
   ```
   - Las etapas pueden incluir el firmware (BIOS/UEFI), el bootloader, la inicialización del kernel y la inicialización del sistema.
   - La etapa que más tarda puede variar, pero generalmente, la inicialización del sistema (carga de servicios y aplicaciones) puede llevar más tiempo.
   - La que menos tarda suele ser la del kernel, ya que es una fase fundamental para el arranque del sistema.
   
c) Muestra lo que tarda en cargarse cada uno de los servicios de tu máquina.
```bash
systemd-analyze blame
```

### MS Windows
1. Usando la consola (cmd), elige dos o tres servicio no primordiales de Windows (como los relacionados con Xbox, teléfono, módem, etc.) y usa comandos de consola para obtener datos de este servicio y de su estado actual. Prueba a detenerlo, iniciarlo, pausarlo, reanudarlo, etc. Déjalo en su estado inicial.

   a) Obtener datos de un servicio: 
   ```cmd
   sc query <nombre_servicio>
   ```
   b) Detener un servicio: 
   ```cmd
   sc stop <nombre_servicio>
   ```
   c) Iniciar un servicio: 
   ```cmd
   sc start <nombre_servicio>
   ```
   d) Pausar un servicio: 
   ```cmd
   sc pause <nombre_servicio>
   ```
   e) Reanudar un servicio: 
   ```cmd
   sc continue <nombre_servicio>
   ```
   
2. Escoge alguno de los servicios del apartado anterior y cambia su modo de inicio (de automático a manual o viceversa, inicio diferido, etc.). Déjalo luego en su estado inicial. 
   - Automático a Manual: 
      ```cmd
      sc config <nombre_servicio> start= demand
      ```
   - Manual a Automático: 
      ```cmd
      sc config <nombre_servicio> start= auto
      ```

3. Repite los ejercicios anteriores anterior usando PowerShell
   
   a) Obtener datos de un servicio: 
   ```cmd
   Get-Service
   ```
   b) Detener un servicio: 
   ```cmd
   Stop-Service
   ```
   c) Iniciar un servicio: 
   ```cmd
   Start-Service
   ```
   d) Pausar un servicio: 
   ```cmd
   Suspend-Service
   ```
   e) Reanudar un servicio: 
   ```cmd
   Resume-Service
   ````