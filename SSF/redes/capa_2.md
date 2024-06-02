# Concepto de Capa de Enlace de Datos

## Función Principal
La capa de enlace de datos gestiona la transmisión de datos a través de un enlace físico determinado, proporcionando mayor fiabilidad y otros servicios esenciales.

## Dispositivos de Red
- **Nodos**: Dispositivos direccionables a nivel de capa de red con una dirección de red asociada.
- **Dispositivos de acceso al medio**: Operan únicamente a nivel de las capas de enlace y/o física, ofreciendo un punto de acceso a un medio de transmisión.

## Enlace
El enlace es el canal de transmisión que une varios nodos adyacentes. Existen dos tipos:
- **Enlaces punto a punto**: Canal exclusivo para dos nodos.
- **Enlaces de difusión**: Canal compartido por más de dos nodos (ej. redes inalámbricas, dispositivos conectados a un hub).

## Enlace Lógico
Es un enlace virtual que se establece mediante elementos lógicos (información almacenada en la memoria del nodo, en la cabecera de una trama, etc.), gestionando las transmisiones entre los nodos a través del enlace físico.

## Trama o Frame
Unidad de datos de los protocolos del nivel de enlace.

## Servicios Típicos de la Capa de Enlace de Datos
- **Entramado**: Encapsula los datos de la capa de red en una trama, que incluye una cabecera y, en algunos casos, una cola.
- **Métodos de acceso al medio**: Controlan y regulan el acceso al enlace, desde métodos simples para enlaces punto a punto hasta complejos para enlaces de difusión.
- **Sincronismo**: Sincroniza el reloj del receptor con el del emisor para reconocer los bits transmitidos.
- **Direccionamiento físico**: Identifica de manera unívoca cada nodo en medios compartidos mediante una dirección MAC.
- **Control de flujo**: Ajusta la velocidad de envío de tramas a la capacidad de procesamiento del nodo receptor.
- **Detección y corrección de errores**: Proporciona mecanismos para detectar y corregir errores en las tramas.
- **Entrega fiable**: Garantiza la entrega de datos mediante identificación de tramas y retransmisión de datos dañados.
- **Multiplexación de protocolos**: Etiqueta la trama para indicar el protocolo encapsulado, permitiendo un tratamiento adecuado.

## Implementación
La capa de enlace se implementa principalmente en un componente llamado adaptador de red, donde el hardware y el software se encuentran.

## Subcapas de la Capa de Enlace
- **MAC (Control de Acceso al Medio)**: Gestiona el direccionamiento físico, el acceso al medio, la sincronización, el cálculo de secuencias de control de errores, entre otros.
- **LLC (Control del Enlace Lógico)**: Gestiona la multiplexación de protocolos, el control de flujo y la retransmisión de tramas en caso de error. No todos los protocolos de enlace implementan esta subcapa.

## Direccionamiento Físico
Cada protocolo de enlace define su tipo de dirección física. Los principales protocolos son Ethernet (redes cableadas) y IEEE 802.11 (redes inalámbricas), que utilizan un direccionamiento MAC de 48 bits.

### Direccionamiento MAC de 48 Bits
- **Estructura**: Número binario de 48 bits, representado en formato hexadecimal.
- **Unicidad**: Cada adaptador de red recibe una dirección MAC única de fábrica.
- **Control**: El IEEE asigna los primeros 24 bits como Identificador Único de la Organización (OUI) y los últimos 24 bits son asignados por el fabricante.

## Direcciones MAC Especiales
- **Difusión o Broadcast**: Todos los bits a 1.
- **Multidifusión o Multicast**: Último bit del primer byte a 1.
- **Localmente administradas**: Penúltimo bit del primer byte a 1.

## Modo Promiscuo
Un adaptador de red configurado en este modo acepta todas las tramas que recibe, útiles para analizar el tráfico en un punto de la red.

## Consultar la Dirección MAC
- **Windows (Consola)**: `ipconfig /all`
- **Windows (Gráfico)**: Estado de conexión en el Panel de control > Centro de redes y recursos compartidos.
- **Linux (Consola)**: `ifconfig`

## Cambiar la Dirección MAC
- **Windows 7**: Administrador de dispositivos > Propiedades del adaptador > Opciones avanzadas.
- **Linux**: 
  ```bash
  ifconfig eth0 down
  ifconfig eth0 hw ether 02:AA:B2:C3:D4:E5
  ifconfig eth0 up


# Métodos de Acceso al Medio

## Objetivo
Regular el acceso a un medio compartido para impedir o reducir al máximo las colisiones entre tramas.

## Métodos Basados en el Particionado del Canal
### 1. Particionado del Tiempo de Uso del Canal (TDM)
- **Descripción**: Divide el tiempo de uso del canal en pequeñas fracciones y asigna a cada nodo un turno específico para emitir.
- **Analogía**: Imagina una sala de reuniones con un único micrófono que pasa de persona a persona según un horario establecido. Si alguien no tiene nada que decir cuando es su turno, se pierde el tiempo.

### 2. Particionado del Ancho de Banda del Canal (FDM)
- **Descripción**: Divide el ancho de banda del canal en diferentes rangos de frecuencia, asignando a cada nodo un rango específico.
- **Analogía**: Es como tener varias estaciones de radio en diferentes frecuencias. Cada emisora transmite en su propia frecuencia sin interferir con las demás.

### 3. Acceso Múltiple por División de Código (CDMA)
- **Descripción**: Asigna a cada nodo un código único para codificar su información, permitiendo que las tramas no interfieran entre sí.
- **Analogía**: Como tener varias conversaciones en una habitación donde cada persona usa un idioma diferente, evitando que las conversaciones se mezclen.

## Métodos Basados en la Toma de Turnos
### 1. Protocolo de Sondeo (Polling)
- **Descripción**: Un nodo maestro dirige los turnos, permitiendo a cada nodo emitir un número determinado de tramas.
- **Analogía**: Un moderador en una reunión da la palabra a cada participante en orden.

### 2. Protocolo de Paso de Testigo (Token Passing)
- **Descripción**: Utiliza una trama especial llamada token que se pasa entre los nodos en un orden preestablecido.
- **Analogía**: Como un bastón de mando que se pasa de mano en mano en una carrera de relevos. Solo quien tiene el bastón puede correr (emitir).

## Métodos Basados en el Acceso Aleatorio
### 1. Aloha
- **Descripción**: Un dispositivo emite directamente cuando lo necesita y espera una confirmación del receptor. Si no recibe la confirmación, reintenta después de un tiempo aleatorio.
- **Analogía**: Como enviar un mensaje en una botella al mar y esperar una respuesta. Si no hay respuesta, se intenta nuevamente después de un tiempo.

### 2. CSMA (Carrier Sense Multiple Access)
- **Descripción**: Un dispositivo sondea el medio para ver si está libre antes de emitir. Si está ocupado, espera un tiempo aleatorio antes de volver a intentarlo.
- **Analogía**: Es como escuchar antes de hablar en una conversación grupal. Si alguien más está hablando, esperas un momento antes de intentar hablar.

### 3. CSMA/CD (Collision Detection)
- **Descripción**: Similar al CSMA, pero con detección de colisiones. Si se detecta una colisión durante la transmisión, el emisor detiene la transmisión y reintenta después de un tiempo aleatorio.
- **Analogía**: Como si dos personas empiezan a hablar al mismo tiempo, ambos se detienen y esperan un momento aleatorio antes de intentar hablar de nuevo.

### 4. CSMA/CA (Collision Avoidance)
- **Descripción**: Evita colisiones utilizando técnicas para preverlas. Se utiliza principalmente en redes inalámbricas.
- **Analogía**: Como si cada persona en una reunión levantara la mano antes de hablar para asegurarse de no interrumpir a otros.

## Control de Errores
Detectar los errores que se producen durante la transmisión de una trama a través del enlace.

## Códigos de Detección de Errores
### 1. Bits de Paridad
- **Descripción**: Añade un bit al final de cada byte, que se utiliza para verificar si el número de bits 1 en el byte es par o impar.
- **Analogía**: Es como añadir una suma de control a una fila de números para asegurarse de que la suma sea correcta.

### 2. Paridad Bidimensional
- **Descripción**: Calcula bits de paridad para cada byte y añade bits adicionales para cada conjunto de 8 bytes.
- **Analogía**: Es como tener una suma de control tanto para cada fila como para cada columna en una tabla de números.

### 3. Sumas de Comprobación (Checksum)
- **Descripción**: Agrupa bits en bloques y los suma, utilizando el resultado como código de detección.
- **Analogía**: Es como sumar los precios de los artículos en un carrito de compras y comparar el total con un valor esperado para detectar errores.

### 4. Códigos Polinomiales o de Comprobación de Redundancia Cíclica (CRC)
- **Descripción**: Utiliza operaciones matemáticas complejas para detectar errores.
- **Analogía**: Como utilizar una fórmula matemática avanzada para verificar la exactitud de un conjunto de datos. Muy efectivo para detectar errores, pero no los corrige.

## Corrección de Errores
Un código corrector permite corregir algunos errores (no todos), además de detectarlos.


# Topologías Ethernet y Conmutación de Tramas

## Topologías Ethernet

1. **Bus Coaxial**: Originalmente, Ethernet usaba una topología de bus físico con un cable coaxial donde todos los dispositivos estaban conectados al mismo cable.
   
2. **Estrella con Hubs**: En la década de 1990, se introdujeron los concentradores (hubs), permitiendo una topología física de estrella. Aunque parecía una estrella físicamente, funcionaba lógicamente como un bus.

3. **Estrella con Switches**: Más adelante, se empezaron a usar conmutadores (switches), manteniendo la topología física de estrella pero cambiando a una lógica de conmutación de paquetes.

## Conmutación de Tramas

- **Switches**: Son dispositivos inteligentes que conectan varios dispositivos de una red a través de múltiples puertos. Los switches pueden analizar las tramas para determinar su destino y redirigirlas correctamente.
  
- **Memoria y Tablas MAC**: Los switches almacenan una tabla de direcciones MAC, asociando cada dirección MAC con el puerto correspondiente. También tienen memoria intermedia para evitar colisiones al manejar múltiples tramas simultáneamente.

## Funcionamiento de un Switch

1. **Recepción y Análisis**: Cuando un switch recibe una trama, verifica si la trama tiene errores. Luego, identifica las direcciones MAC de origen y destino.

2. **Actualización de la Tabla MAC**: Si la dirección MAC de origen no está en la tabla, el switch la añade con el puerto por donde llegó la trama.

3. **Reenvío de Tramas**:
   - **Broadcast**: Si la trama es de broadcast, se envía por todos los puertos excepto el de origen.
   - **Multicast**: Dependiendo del switch, las tramas de multicast se pueden enviar a puertos específicos o a todos.
   - **Unicast**: Para tramas unicast, el switch usa la tabla MAC para reenviar la trama al puerto correspondiente. Si la dirección MAC de destino no está en la tabla, la trama se envía por todos los puertos, excepto el de origen, hasta que el destinatario responda.

## Dominios de Colisión y Difusión

- **Dominio de Colisión**: Área de la red donde dos tramas pueden colisionar si se envían al mismo tiempo.

- **Dominio de Difusión**: Área de la red donde una trama de broadcast puede propagarse. Los switches no separan completamente los dominios de difusión, ya que las tramas de broadcast se envían a todos los puertos.

# Protocolos de Enlace en las LAN

## Protocolos Ethernet

1. **Ethernet DIX**: Protocolo original de Ethernet, usaba CSMA/CD para acceder al medio y transmitía a través de un bus coaxial.

2. **IEEE 802.3**: Estándar internacional basado en Ethernet, define servicios para la subcapa MAC y utiliza CSMA/CD con direccionamiento físico de 48 bits.

3. **Ethernet II**: Combina características de IEEE 802.3 y Ethernet DIX-II, permite coexistencia en la misma LAN y define multiplexación de protocolos y control de errores.

## Protocolos en LAN Inalámbricas

1. **IEEE 802.11 (WiFi)**: Utiliza CSMA/CA, direccionamiento MAC de 48 bits y mecanismos de retransmisión de tramas con errores. Compatible con protocolos Ethernet actuales.

2. **Bluetooth (IEEE 802.15)**: Diseñado para conexiones inalámbricas de corto alcance, como periféricos y dispositivos móviles.

## Protocolos Avanzados

1. **IEEE 802.1Q (VLAN)**: Permite la creación de redes locales virtuales (VLAN), segmentando lógicamente dispositivos dentro de una misma LAN, impidiendo cualquier tipo de tráfico entre VLANs.

# Dispositivos de la Capa de Enlace

1. **Puentes (Bridges)**: Conectan diferentes tipos de medios dentro de la misma red, permitiendo el paso de datos entre distintos tipos de enlaces.

2. **Switches**: Varían desde simples conmutadores domésticos hasta avanzados conmutadores para racks, que permiten configuraciones complejas como VLANs y soportan comunicación full-duplex.

3. **Puntos de Acceso Inalámbricos (Access Points)**: Integran dispositivos inalámbricos en una LAN cableada, permitiendo que se conecten como si estuvieran cableados.