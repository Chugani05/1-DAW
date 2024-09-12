## Protocolos de Capa 2 (Enlace de Datos)
- **IEEE 802.3:** Estándar para redes Ethernet cableadas. Define cómo se transmiten los datos en una red Ethernet.
  - *Analogía:* Es como el sistema de semáforos en una intersección, que regula el flujo de tráfico para evitar colisiones entre vehículos.

- **IEEE 802.11:** Estándar para redes inalámbricas. Define cómo se transmiten los datos en una red Wi-Fi.
  - *Analogía:* Es como una red invisible de conexiones de radio que permiten la comunicación entre dispositivos sin necesidad de cables.

- **PPP (Point-to-Point Protocol):** Protocolo de Punto a Punto. Permite la comunicación directa entre dos dispositivos a través de un enlace de comunicación.
  - *Analogía:* Similar a tener un camino privado entre dos lugares, donde solo los dos lugares pueden comunicarse entre sí sin interferencia externa.

## Protocolos de Capa 3 (Red)
- **IP (Internet Protocol):** Protocolo de Internet. Permite que los datos se envíen entre redes diferentes identificando el origen y el destino de los datos.
  - *Analogía:* Es como el sistema de direcciones postales que asegura que un paquete enviado desde una ciudad pueda llegar a otra ciudad.

- **ICMP (Internet Control Message Protocol):** Protocolo de Mensajes de Control de Internet. Utilizado para enviar mensajes de error y control en una red IP.
  - *Analogía:* Es como un mensajero que entrega notificaciones sobre problemas de entrega de correo o actualizaciones sobre el estado del servicio postal.

- **ARP (Address Resolution Protocol):** Protocolo de Resolución de Direcciones. Permite encontrar la dirección física (MAC) de un dispositivo conocido su dirección IP en una red local.
  - *Analogía:* Similar a preguntar a un grupo de personas quién tiene un determinado número de teléfono y obtener la respuesta con la dirección de esa persona.

- **rARP (Reverse Address Resolution Protocol):** Protocolo de Resolución Inversa de Direcciones. Permite a un dispositivo determinar su propia dirección IP cuando conoce su dirección física (MAC).
  - *Analogía:* Es como un auto que, al conocer su placa de matrícula, puede determinar su dirección de estacionamiento en un estacionamiento grande.

- **NAT (Network Address Translation):** Traducción de Direcciones de Red. Permite que múltiples dispositivos compartan una única dirección IP pública para acceder a Internet.
  - *Analogía:* Es como un edificio de apartamentos donde cada apartamento tiene su propia dirección, pero todos los paquetes de correo se entregan al buzón del edificio.

- **CG-NAT (Carrier Grade Network Address Translation):** Traducción de Direcciones de Red a Nivel Corporativo. Similar a NAT pero a una escala más grande, utilizado por proveedores de servicios de Internet.
  - *Analogía:* Es como una oficina de correo central que gestiona la distribución de correo para varios edificios de apartamentos en una ciudad.

- **IGMP (Internet Group Management Protocol):** Protocolo de Administración de Grupos de Internet. Utilizado por dispositivos para unirse y dejar grupos multicast en una red IP.
  - *Analogía:* Es como un sistema de suscripción a revistas donde los suscriptores pueden unirse o salir de un grupo de interés en cualquier momento.

- **IGP (Interior Gateway Protocol):** Protocolos de Puerta de Enlace Interior (RIP y OSPF). Utilizado para determinar rutas en una red interna.
  - *Analogía:* Es como un mapa de carreteras interno de una ciudad que muestra las diferentes rutas posibles para llegar de un lugar a otro.

- **BGP (Border Gateway Protocol):** Protocolo de Puerta de Enlace Exterior. Utilizado para intercambiar información de enrutamiento entre sistemas autónomos en Internet.
  - *Analogía:* Similar a un sistema de señalización entre diferentes compañías de transporte que permite el flujo de tráfico entre países.

## Protocolos de Capa 4 (Transporte)
- **TCP (Transmission Control Protocol):** Protocolo de Control de Transmisión. Proporciona una entrega confiable de datos entre dispositivos a través de una conexión establecida.
  - *Analogía:* Es como tener una conversación telefónica donde se confirma la recepción de cada mensaje para garantizar que se entienda correctamente.

- **UDP (User Datagram Protocol):** Protocolo de Datagrama de Usuario. Proporciona una entrega rápida de datos entre dispositivos sin garantía de entrega o de orden.
  - *Analogía:* Es como enviar postales donde el remitente no espera confirmación de entrega y no se preocupa si llegan en un orden específico.

## Protocolos de Capa 5 (Sesión)
- **RPC (Remote Procedure Call):** Llamada de Procedimiento Remoto. Permite a un programa ejecutar sus procedimientos en una máquina remota sin preocuparse por los detalles de la implementación de la red.
  - *Analogía:* Es como pedir a un asistente que realice una tarea por ti en una ubicación remota, sin tener que saber cómo se realiza la tarea.

- **SQL (Structured Query Language):** Lenguaje de Consulta Estructurado. Utilizado para gestionar bases de datos relacionales.
  - *Analogía:* Es como hablar con un bibliotecario para buscar y obtener información de un catálogo de libros.

## Protocolos de Capa 7 (Aplicación)
- **SMTP (Simple Mail Transfer Protocol):** Protocolo de Transferencia de Correo Simple. Utilizado para enviar correos electrónicos a través de una red.
  - *Analogía:* Es como colocar una carta en un buzón para que un cartero la entregue al destinatario.

- **POP (Post Office Protocol):** Protocolo de Oficina de Correos. Utilizado para recibir correos electrónicos de un servidor de correo.
  - *Analogía:* Es como recoger el correo de tu casillero en una oficina de correos local.

- **IMAP (Internet Message Access Protocol):** Protocolo de Acceso a Mensajes de Internet. Utilizado para acceder y administrar correos electrónicos almacenados en un servidor de correo.
  - *Analogía:* Es como tener acceso a tu casillero de correo desde cualquier lugar y poder organizar tus cartas según tus necesidades.

- **FTP (File Transfer Protocol):** Protocolo de Transferencia de Archivos. Utilizado para transferir archivos entre un cliente y un servidor en una red.
  - *Analogía:* Es como enviar paquetes por correo postal, donde los archivos son los paquetes y el servidor es la oficina de correos.

- **TFTP (Trivial File Transfer Protocol):** Protocolo de Transferencia de Archivos Trivial. Similar a FTP pero más simple y usado para transferir archivos de forma básica sin autenticación.
  - *Analogía:* Es como dejar un mensaje en un tablón de anuncios público para que cualquiera pueda recogerlo.

- **HTTP (Hypertext Transfer Protocol):** Protocolo de Transferencia de Hipertexto. Utilizado para la transferencia de datos en la World Wide Web.
  - *Analogía:* Es como solicitar un libro específico en una biblioteca utilizando el sistema de clasificación Dewey.

## Modulación
- **ASK (Amplitude Shift Keying):** Modulación por Desplazamiento de Amplitud. Varía la amplitud de una onda portadora para transmitir datos digitales.
  - *Analogía:* Es como encender y apagar una linterna para enviar mensajes en código morse.

- **FSK (Frequency Shift Keying):** Modulación por Desplazamiento de Frecuencia. Varía la frecuencia de una onda portadora para transmitir datos digitales.
  - *Analogía:* Es como cambiar entre dos tonos diferentes en una llamada telefónica para enviar mensajes codificados.

- **PSK (Phase Shift Keying):** Modulación por Desplazamiento de Fase. Varía la fase de una onda portadora para transmitir datos digitales.
  - *Analogía:* Es como rotar una flecha en diferentes ángulos para representar diferentes símbolos en un sistema de comunicación visual.

## Otros
- **ISP (Internet Service Provider):** Proveedor de Servicios de Internet. Una empresa que proporciona acceso a Internet y otros servicios relacionados a los usuarios.
  - *Analogía:* Es como la empresa de servicios públicos que proporciona electricidad o agua a los hogares y empresas.

- **PDU (Protocol Data Units):** Unidad de Datos del Protocolo. Los bloques de datos que se transmiten en una red, cada uno con su propio encabezado y tal vez un tráiler.
  - *Analogía:* Es como una carta en un sobre, donde la carta es el mensaje y el sobre contiene la dirección y otros detalles de entrega.


# Resumen
## Protocolos de Capa 2 (Enlace de Datos)
- **IEEE 802.3:** Estándar para redes Ethernet cableadas.
- **IEEE 802.11:** Estándar para redes inalámbricas.
- **PPP:** Protocolo de Punto a Punto.

## Protocolos de Capa 3 (Red)
- **IP:** Protocolo de Internet.
- **ICMP:** Protocolo de Mensajes de Control de Internet.
- **ARP:** Protocolo de Resolución de Direcciones.
- **rARP:** Protocolo de Resolución Inversa de Direcciones.
- **NAT:** Traducción de Direcciones de Red.
- **CG-NAT:** Traducción de Direcciones de Red a Nivel Corporativo.
- **IGMP:** Protocolo de Administración de Grupos de Internet.
- **IGP:** Protocolos de Gateway Interior (RIP y OSPF).
- **BGP:** Protocolo de Puerta de Enlace Exterior.

## Protocolos de Capa 4 (Transporte)
- **TCP:** Protocolo de Control de Transmisión.
- **UDP:** Protocolo de Datagrama de Usuario.

## Protocolos de Capa 7 (Aplicación)
- **DNS:** Sistema de Nombres de Dominio.
- **DHCP:** Protocolo de Configuración Dinámica de Host.
- **SMTP:** Protocolo de Transferencia de Correo Simple.
- **POP:** Protocolo de Oficina de Correos.
- **IMAP:** Protocolo de Acceso a Mensajes de Internet.
- **FTP:** Protocolo de Transferencia de Archivos.
- **TFTP:** Protocolo de Transferencia de Archivos Trivial.
- **HTTP:** Protocolo de Transferencia de Hipertexto.
- **RPC:** Llamada de Procedimiento Remoto.
- **SQL:** Lenguaje de Consulta Estructurado.

## Otros Términos
- **PDU:** Unidad de Datos del Protocolo.
- **ASK:** Modulación por Desplazamiento de Amplitud.
- **FSK:** Modulación por Desplazamiento de Frecuencia.
- **PSK:** Modulación por Desplazamiento de Fase.
- **ISP:** Proveedor de Servicios de Internet.
