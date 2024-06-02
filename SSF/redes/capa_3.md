# Introducción a Internet y la Familia de Protocolos TCP/IP
## Concepto de Internet

Internet no es una nueva red física, sino un conjunto de tecnologías que permiten interconectar redes muy distintas entre sí. No depende de la máquina ni del sistema operativo utilizado, permitiendo la comunicación entre, por ejemplo, un servidor Unix y un ordenador con Windows 98, o entre plataformas como Macintosh, Alpha o Intel. En esta interconexión pueden estar involucradas diversas redes como Ethernet, Token Ring e incluso enlaces vía satélite.

## Familia de Protocolos TCP/IP

Para permitir la interoperabilidad entre diferentes tipos de redes y sistemas operativos, se utiliza la familia de protocolos TCP/IP. Esta familia incluye muchos protocolos, aunque comúnmente se habla simplificadamente de TCP/IP.

## Niveles del Protocolo TCP/IP

El protocolo TCP/IP debe operar a un nivel superior al tipo de red empleado y ser transparente a cualquier red. A su vez, debe estar a un nivel inferior de los programas de aplicación específicos de cada sistema operativo.

### Modelo de Referencia TCP/IP

1. **Capa Física**: Medio físico de transmisión de la información (e.g., cable coaxial, par trenzado, ondas, enlaces vía satélite).
2. **Capa de Acceso a la Red**: Determina cómo las estaciones envían y reciben información a través del soporte físico (e.g., Ethernet, Token Ring).
3. **Capa de Red**: Define cómo un mensaje se transmite a través de distintas redes hasta llegar a su destino. El principal protocolo de esta capa es IP, aunque también incluye ARP, ICMP e IGMP.
4. **Capa de Transporte**: Protocolos TCP y UDP que gestionan la comunicación extremo a extremo, añadiendo la noción de puertos.
5. **Capa de Aplicación**: Proporciona los servicios de Internet como HTTP, SMTP, FTP, TELNET.

## Función de Cada Capa

- **Capa Física**: Transmite la información a través del medio físico.
- **Capa de Acceso a la Red**: Gestiona la transmisión de datos en el medio físico.
- **Capa de Red**: Fragmenta mensajes en datagramas IP y los enruta a través de distintas redes.
- **Capa de Transporte**: Gestiona la comunicación extremo a extremo y el uso de puertos.
- **Capa de Aplicación**: Proporciona servicios específicos como correo electrónico y páginas web.

## Direcciones IP

### Estructura de Direcciones IP

Las direcciones IP están formadas por 4 bytes (32 bits) y se representan comúnmente en formato decimal (e.g., 192.168.0.10). También pueden representarse en hexadecimal o binario.

### Tipos de Direcciones IP

- **Públicas**: Visibles en toda Internet.
- **Privadas**: Visibles solo dentro de redes internas.
- **Estáticas**: Permanentes para un host.
- **Dinámicas**: Asignadas temporalmente a un host.

### Clases de Direcciones IP

- **Clase A**: Grandes redes con muchos hosts.
- **Clase B**: Redes de tamaño medio.
- **Clase C**: Redes pequeñas.
- **Clase D**: Direcciones para multicast.
- **Clase E**: Direcciones reservadas.

### Ejemplos de Direcciones IP Especiales

- **Loopback**: 127.0.0.1, usada para pruebas locales.
- **Difusión**: 255.255.255.255, para enviar a todos los hosts de una red.

## Redes Privadas y Públicas

- **Intranet**: Red privada que utiliza protocolos TCP/IP.
- **Extranet**: Conexión de varias intranets.
- **Internet**: Red pública global de redes TCP/IP.

### Uso de Direcciones IP Reservadas

Para redes privadas, se utilizan direcciones IP reservadas, garantizando que no haya conflictos con direcciones públicas en Internet.

### Comunicación Entre Redes

Para que ordenadores en diferentes redes se comuniquen, se utilizan routers que interconectan las redes, permitiendo el tráfico de paquetes entre ellas.

## Conclusión

El diseño de TCP/IP permite la interconexión eficiente de diversas redes y sistemas operativos, formando la base de Internet y permitiendo la comunicación global entre diferentes plataformas y redes.


# Máscara de Subred

Una máscara de subred es una dirección que, al enmascarar nuestra dirección IP, indica si otra dirección IP pertenece a nuestra subred o no.

## Máscaras de Subred por Clase

- **Clase A**: 255.0.0.0
- **Clase B**: 255.255.0.0
- **Clase C**: 255.255.255.0

La máscara de subred de clase A en binario:
11111111.00000000.00000000.00000000

Los bits en 1 indican la parte de la dirección correspondiente a la red y los bits en 0 corresponden al host.

## Ejemplo

- Dirección IP: 148.120.33.110
- Máscara de subred: 255.255.0.0
- Dirección de subred: 148.120.0.0

Si otra máquina tiene la IP 148.120.33.89 con la misma máscara, pertenece a la misma subred (148.120.0.0). Una dirección como 148.115.89.3 no pertenece a la misma subred.

## Cálculo de la Dirección de Difusión

Para calcular la dirección de difusión (broadcast), se hace una suma lógica (OR) de la IP con el inverso (NOT) de su máscara.

## Ejemplo de ISP

- Red del ISP: 63.81.0.0 / 255.255.0.0
- Direcciones para acceso a usuarios: 63.81.1.0 a 63.81.1.254

Si un usuario con IP 63.81.1.1 transfiere un archivo a 63.81.1.2, no saldrá de la red del proveedor.

# Subnetting

Las máscaras de subred se usan para dividir redes en subredes más pequeñas.

## Ejemplos de Divisiones de Redes de Clase C

| Máscara de Subred | Binario        | Número de Subredes | Núm. de Hosts por Subred | Ejemplos de Subredes        |
|-------------------|----------------|---------------------|--------------------------|-----------------------------|
| 255.255.255.0     | 00000000       | 1                   | 254                      | x.0                         |
| 255.255.255.128   | 10000000       | 2                   | 126                      | x.0, x.128                  |
| 255.255.255.192   | 11000000       | 4                   | 62                       | x.0, x.64, x.128, x.192     |
| 255.255.255.224   | 11100000       | 8                   | 30                       | x.0, x.32, x.64, x.96, ...  |
| 255.255.255.240   | 11110000       | 16                  | 14                       | x.0, x.16, x.32, x.48, ...  |
| 255.255.255.248   | 11111000       | 32                  | 6                        | x.0, x.8, x.16, x.24, ...   |
| 255.255.255.252   | 11111100       | 64                  | 2                        | x.0, x.4, x.8, x.12, ...    |
| 255.255.255.254   | 11111110       | 128                 | 0                        | ninguna posible            |
| 255.255.255.255   | 11111111       | 256                 | 0                        | ninguna posible            |

# Protocolo IP

El protocolo IP es el principal de la capa de red, encargado de la transferencia de datos entre el origen y el destino a través de una red de redes. Características principales:
- **No orientado a conexión**: Cada paquete puede seguir rutas distintas.
- **No fiable**: Los paquetes pueden perderse, duplicarse, dañarse o llegar desordenados.

# Formato del Datagrama IP

Un datagrama IP es la unidad básica de transferencia de datos entre el origen y el destino, que se transporta en el campo de datos de las tramas físicas de las distintas redes.

<img src="https://personales.upv.es/rmartin/tcpip/imagenes/formato-ip.gif">

## Campos del Datagrama IP

- **VERS (4 bits)**: Versión del protocolo IP.
- **HLEN (4 bits)**: Longitud de la cabecera en múltiplos de 32 bits.
- **Tipo de servicio (8 bits)**:
  - **Prioridad (3 bits)**
  - **Bit D (Delay)**
  - **Bit T (Throughput)**
  - **Bit R (Reliability)**
- **Longitud total (16 bits)**: Longitud del datagrama en bytes.
- **Identificación (16 bits)**: Número de secuencia del datagrama.
- **Banderas (3 bits)**:
  - **MF (Más fragmentos)**
  - **DF (No fragmentar)**
- **Desplazamiento de fragmentación (13 bits)**: Lugar del fragmento en el datagrama completo.
- **TTL (8 bits)**: Tiempo de vida en segundos.
- **Protocolo (8 bits)**: Protocolo utilizado en el campo de datos.
- **CRC cabecera (16 bits)**: Suma de comprobación de errores de la cabecera.
- **Dirección origen (32 bits)**: Dirección IP del origen.
- **Dirección destino (32 bits)**: Dirección IP del destino.
- **Opciones IP**: Opcional, especifica opciones del usuario.
- **Relleno**: Completa las opciones hasta un múltiplo de 32 bits.

# Fragmentación

La fragmentación se produce cuando el tamaño de un datagrama excede el MTU de una red. Los routers fragmentan los datagramas y el host destino reensambla los fragmentos.

## Ejemplo de Fragmentación

Un datagrama de 1420 bytes atraviesa una red con MTU de 620 bytes:
- **Fragmento 1**: 620 bytes, Desplazamiento 0, MF=1
- **Fragmento 2**: 620 bytes, Desplazamiento 600, MF=1
- **Fragmento 3**: 220 bytes, Desplazamiento 1200, MF=0

El router R1 fragmenta y el host B reensambla los fragmentos. Si el bit DF está a 1, el datagrama se descarta si no puede fragmentarse.


![alt text](image.png)

# Protocolo ARP

El **protocolo ARP (Address Resolution Protocol)** permite obtener la dirección física de una máquina a partir de su dirección IP. Esencial para la comunicación en redes locales donde las máquinas se envían tramas físicas.

## Formato de una trama Ethernet

Una trama Ethernet contiene los siguientes campos:
8 bytes 6 bytes 6 bytes 2 bytes 64-1500 bytes 4 bytes
Preámbulo Dirección física destino Dirección física origen Tipo de trama Datos de la trama CRC


## Funcionamiento del Protocolo ARP

1. **ARP Request**: La máquina origen envía una petición ARP a todas las máquinas de su red preguntando por la dirección física correspondiente a una dirección IP.
2. **ARP Reply**: La máquina con la dirección IP consultada responde con su dirección física.

### Ejemplo

- **Host A**: IP: 192.168.0.10, MAC: 00-60-52-0B-B7-7D
- **Router R1**: IP: 192.168.0.1, MAC: 00-E0-4C-AB-9A-FF
- **Host B**: IP: 10.10.0.7, MAC: 00-E0-4C-33-79-AF

Cuando **A** quiere enviar un datagrama a **B**:
1. **A** envía un ARP request para la IP 192.168.0.1 (R1).
2. **R1** responde con su dirección física 00-E0-4C-AB-9A-FF.
3. **A** envía la trama a **R1**.
4. **R1** repite el proceso en la red de destino.

### Difusión y Cache ARP

- **Difusión**: Las peticiones ARP son enviadas a todas las máquinas de la red.
- **Cache ARP**: Cada ordenador guarda una tabla con direcciones IP y MAC para evitar futuras peticiones ARP.

## Tabla ARP (Cache ARP)

- **Entrada**: Dirección IP y dirección física.
- **Tiempo de vida**: Cada entrada tiene un tiempo de vida para evitar incongruencias.

### Mejora del rendimiento

- Todas las estaciones pueden actualizar sus tablas ARP al escuchar una petición ARP, lo que reduce el tráfico en la red.

# Protocolo ICMP

El **protocolo ICMP (Internet Control Message Protocol)** informa sobre errores y controla mensajes en la red.

## Formato del Datagrama ICMP

- **Encabezado del datagrama**
- **Datos del datagrama IP**

### Tipos de Mensajes ICMP

| Tipo | Mensaje                            |
|------|------------------------------------|
| 0    | Respuesta de eco (Echo Reply)      |
| 3    | Destino inaccesible (Destination Unreachable) |
| 4    | Disminución de tráfico (Source Quench) |
| 5    | Redireccionar (Redirect)           |
| 8    | Solicitud de eco (Echo)            |
| 11   | Tiempo excedido (Time Exceeded)    |
| 12   | Problema de Parámetros (Parameter Problem) |
| 13   | Solicitud de marca de tiempo (Timestamp) |
| 14   | Respuesta de marca de tiempo (Timestamp Reply) |
| 17   | Solicitud de máscara (Addressmask) |
| 18   | Respuesta de máscara (Addressmask Reply) |

### Solicitud y Respuesta de Eco

- **Ping**: Envía mensajes de solicitud de eco (tipo 8) para verificar la comunicación.
- **Funcionamiento**:
  1. A envía un mensaje ICMP de tipo 8 a B.
  2. B responde con un mensaje ICMP de tipo 0 a A.
  3. A muestra el resultado.

### Mensajes ICMP de Tiempo Excedido

- **TTL (Time To Live)**: Impide que los mensajes den vueltas indefinidamente.
- **TRACERT**: Realiza una traza del camino de los datagramas hasta su destino enviando mensajes ICMP con diferentes TTL.

### Ejemplo de PING y TRACERT

- **Ping**: Diagnostica errores de comunicación.
- **Tracert**: Identifica el punto de fallo en la ruta de comunicación.

# Encaminamiento

- **Routers**: Encaminan mensajes seleccionando las mejores rutas.
- **Tablas de Encaminamiento**: Almacenan la estructura de la red, utilizando prefijos de direcciones IP para determinar rutas.


## COMANDOS

### GNU/Linux:

ifconfig
ifconfig interfaz down
ifconfig interfaz hw ether XX:XX:XX:XX:XX:XX
ifconfig interfaz up

ifconfig interfaz promisc
ifconfig interfaz -promisc

ip
ip a
ip link show interfaz

ip link set dev interfaz down
ip link set dev interfaz address XX:XX:XX:XX:XX:XX
ip link set dev interfaz up

ethtool
ping (-t, ...)
route (-n, ...)
tracepath (traceroute y tracert)
arp (-n, ...)
nslookup
whois

### MS Windows:
#### CMD:
ipconfig
getmac -v
netsh
 
#### PowerShell:
Get-NetIPAddress | select InterfaceAlias, ipv4address
Get-NetAdapter | select name, macaddress
Set-NetAdapter -name "Interfaz" -MacAddress "XX-XX-XX-XX-XX-XX"
Set-NetAdapterAdvancedProperty -Name "Interfaz" -RegistryKeyword "NetworkAddress" -RegistryValue "XXXXXXXXXXXX"