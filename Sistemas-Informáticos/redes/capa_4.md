# Resumen Comprensible de la Capa de Transporte del Modelo OSI

## Introducción del Capítulo

La capa de Transporte del modelo OSI es fundamental para asegurar la comunicación confiable y continua entre dispositivos a través de la red. Proporciona una transferencia de datos eficiente y sin errores entre las aplicaciones en diferentes dispositivos. En este capítulo, aprenderás cómo la capa de Transporte maneja y garantiza la entrega correcta de datos de aplicación.

## Funciones de la Capa de Transporte

### Propósito de la Capa de Transporte

La capa de Transporte gestiona la segmentación de datos y asegura el reensamblaje correcto. Sus principales responsabilidades incluyen:
- **Seguimiento de comunicaciones**: Mantiene múltiples streams de comunicación entre aplicaciones en diferentes dispositivos.
- **Segmentación de datos**: Divide los datos en partes manejables para su transmisión.
- **Reensamblaje de segmentos**: Reconstruye los datos segmentados en el destino.
- **Identificación de aplicaciones**: Usa números de puerto para identificar y dirigir los datos a la aplicación correcta.

### Seguimiento de Conversaciones Individuales

Imagina que tienes varias aplicaciones abiertas en tu computadora (correo electrónico, navegador web, mensajería instantánea) y todas se comunican simultáneamente. La capa de Transporte se asegura de que los datos de cada aplicación lleguen a la correcta en el dispositivo destino, manteniendo las conversaciones separadas y organizadas.

### Segmentación de Datos

Piensa en enviar una carta larga que no cabe en un solo sobre. La dividirías en varias partes, las pondrías en sobres diferentes y las enviarías. De manera similar, la capa de Transporte divide los datos grandes en segmentos pequeños para su envío.

### Reensamblaje de Segmentos

Al recibir los sobres con partes de tu carta, los abrirías y juntarías las partes para leer la carta completa. La capa de Transporte hace lo mismo con los segmentos de datos, reensamblándolos en el orden correcto para la aplicación de destino.

### Identificación de Aplicaciones

Cada aplicación que se comunica a través de la red tiene un número de puerto único. Este número permite a la capa de Transporte saber a qué aplicación debe enviar cada segmento de datos.

## Protocolo TCP y UDP

### TCP (Transmission Control Protocol)
- **Confiable**: Asegura que todos los datos lleguen correctamente y en orden.
- **Orientado a la conexión**: Establece una conexión antes de transmitir datos.
- **Ejemplo de uso**: Correo electrónico, transferencia de archivos.

### UDP (User Datagram Protocol)
- **No confiable**: No garantiza la entrega ni el orden de los datos.
- **Sin conexión**: No establece una conexión antes de enviar datos.
- **Ejemplo de uso**: Streaming de video, juegos en línea.

### Cuando Usar TCP o UDP

- **TCP**: Úsalo cuando necesitas confiabilidad, como en transferencias de archivos o correos electrónicos.
- **UDP**: Úsalo cuando la velocidad es más importante que la confiabilidad, como en streaming de video o juegos en línea.

## Control de las Conversaciones

### Establecimiento de una Sesión

Para aplicaciones que requieren una conexión establecida antes de la transmisión de datos, la capa de Transporte puede crear una sesión. Esto asegura que ambas aplicaciones estén listas para comunicarse.

### Entrega Confiable

En caso de que algún segmento de datos se pierda o corrompa, la capa de Transporte puede solicitar la retransmisión, asegurando que todos los datos lleguen correctamente.

### Entrega en el Mismo Orden

Numerando los segmentos, la capa de Transporte puede asegurar que los datos lleguen en el orden correcto, incluso si toman rutas diferentes en la red.

### Control del Flujo

Para evitar la sobrecarga de recursos (como la memoria y el ancho de banda), la capa de Transporte puede regular la cantidad de datos enviados, asegurando una transmisión eficiente y evitando pérdidas.

## Analogías para Entender Mejor

- **Correo**: La segmentación de datos es como dividir una carta larga en varios sobres. El reensamblaje es como juntar las partes de la carta al recibirla.
- **Oficina de Correos**: Los números de puerto son como departamentos en una oficina, asegurando que cada carta (segmento de datos) llegue a la persona correcta (aplicación).
- **Teléfono**: TCP es como una llamada telefónica donde ambas partes se saludan primero (establecen una conexión) antes de hablar (transmitir datos). UDP es como enviar mensajes de texto sin esperar confirmación.

## Soporte de Comunicación Confiable

### Introducción a la Confiabilidad en la Capa de Transporte

La función principal de la capa de Transporte es administrar los datos de las aplicaciones para las conversaciones entre hosts. Dado que las diferentes aplicaciones tienen distintos requerimientos de datos, se han desarrollado varios protocolos de Transporte para satisfacer estas necesidades.

### Operaciones Básicas de Confiabilidad

Un protocolo de la capa de Transporte puede implementar métodos para asegurar la entrega confiable de los datos. La confiabilidad en redes significa asegurar que cada sección de datos enviada desde el origen llegue al destino. Las tres operaciones básicas de confiabilidad en la capa de Transporte son:

1. **Seguimiento de datos transmitidos**.
2. **Acuse de recibo de los datos recibidos**.
3. **Retransmisión de cualquier dato no confirmado**.

Esto implica que los procesos de la capa de Transporte en el origen deben mantener el seguimiento de todas las porciones de datos de cada conversación y retransmitir los datos que no se han confirmado como recibidos. Asimismo, la capa de Transporte del host receptor debe rastrear los datos a medida que se reciben y reconocer su recepción.

### Costos y Beneficios de la Confiabilidad

Estas operaciones de confiabilidad requieren el uso adicional de los recursos de la red debido al reconocimiento, rastreo y retransmisión de datos. Para admitir estas operaciones, se intercambian más datos de control entre los hosts emisores y receptores, y esta información de control se encuentra en el encabezado de la Capa 4.

Esto crea un equilibrio entre el valor de la confiabilidad y la carga que representa para la red. Los desarrolladores de aplicaciones deben elegir el protocolo de transporte adecuado según los requisitos de sus aplicaciones. En la capa de Transporte, existen protocolos que especifican métodos para la entrega confiable, garantizada o de máximo esfuerzo. La entrega de máximo esfuerzo, en el contexto de redes, se considera no confiable, ya que no hay acuse de recibo de que los datos hayan llegado al destino.

### Determinación de la Necesidad de Confiabilidad

Las aplicaciones como bases de datos, páginas web y correos electrónicos requieren que todos los datos enviados lleguen al destino en su condición original para ser útiles. La pérdida de datos puede corromper la comunicación y dejarla incompleta o ilegible. Por lo tanto, estas aplicaciones están diseñadas para utilizar un protocolo de capa de Transporte que implemente la confiabilidad, considerando necesario el uso adicional de recursos de red.

Por otro lado, algunas aplicaciones son más tolerantes a la pérdida de pequeñas cantidades de datos. Por ejemplo, en un stream de video, la pérdida de uno o dos segmentos puede causar una interrupción momentánea que tal vez ni se note. Imponer la confiabilidad en estas aplicaciones puede reducir su utilidad, ya que la imagen se degradaría si el dispositivo receptor tuviera que esperar los datos perdidos. Es preferible proporcionar la mejor imagen posible con los segmentos que llegan.

Sin embargo, si por algún motivo se requiere confiabilidad, estas aplicaciones pueden proporcionar verificación de errores y solicitudes de retransmisión.

## Protocolos TCP y UDP

### Protocolo de Control de Transmisión (TCP)

TCP es un protocolo orientado a la conexión, descrito en la RFC 793. Utiliza recursos adicionales para agregar funciones como:

- **Entrega en el mismo orden**.
- **Entrega confiable**.
- **Control de flujo**.

Cada segmento de TCP posee 20 bytes de carga en el encabezado que encapsulan los datos de la capa de Aplicación. Las aplicaciones que utilizan TCP incluyen:

- Navegadores web.
- Correo electrónico.
- Transferencia de archivos.

### Protocolo de Datagramas de Usuario (UDP)

UDP es un protocolo simple y sin conexión, descrito en la RFC 768. Proporciona entrega de datos sin utilizar muchos recursos y envía datagramas como "mejor intento". Las aplicaciones que utilizan UDP incluyen:

- Sistema de nombres de dominios (DNS).
- Streaming de video.
- Voz sobre IP (VoIP).

## Direccionamiento de Puertos

### Identificación de Conversaciones

Para diferenciar los segmentos y datagramas de cada aplicación, TCP y UDP usan números de puerto únicos en sus encabezados. Estos puertos ayudan a identificar las aplicaciones de origen y destino en una comunicación. Los números de puerto se asignan de manera estática o dinámica según el tipo de aplicación y el rol (cliente o servidor).

### Tipos de Números de Puerto

- **Puertos bien conocidos (0-1023)**: Reservados para servicios y aplicaciones comunes como HTTP, SMTP y Telnet.
- **Puertos registrados (1024-49151)**: Asignados a aplicaciones de usuario y procesos individuales.
- **Puertos dinámicos o privados (49152-65535)**: Asignados dinámicamente a aplicaciones de cliente al iniciar una conexión.

## Utilización de TCP y UDP

Algunas aplicaciones, como DNS, pueden usar tanto TCP como UDP dependiendo de la situación. UDP se utiliza para responder rápidamente a múltiples solicitudes de clientes, mientras que TCP se utiliza cuando se requiere confiabilidad en la entrega de la información solicitada.

## Herramientas de Red

La utilidad `netstat` es importante para verificar las conexiones TCP activas en un host. `netstat` muestra el protocolo en uso, la dirección y número de puerto locales, la dirección y número de puerto remotos y el estado de la conexión. Esto es útil para identificar posibles amenazas de seguridad y gestionar los recursos del sistema.

## Segmentación y Reensamblaje

### Dividir y Vencerás

La segmentación de datos en la capa de Transporte asegura que los datos se transmitan dentro de los límites del medio y permite la multiplexación de datos de diferentes aplicaciones. TCP y UDP gestionan la segmentación de manera diferente:

- **TCP**: Usa números de secuencia en los encabezados de segmentos para reensamblar los datos en el orden correcto.
- **UDP**: No usa números de secuencia, lo que permite una transferencia de datos más rápida pero sin garantizar el orden de llegada.

La aplicación que utiliza UDP debe tolerar la posibilidad de que los datos lleguen en un orden diferente al enviado, ya que los paquetes pueden tomar rutas distintas en la red.


# TCP: Cómo generar conversaciones confiables

## Confiabilidad de TCP

### Establecimiento de conexión

- **Sesiones orientadas a la conexión**: TCP crea una conexión antes de enviar datos, lo que permite rastrear la comunicación entre hosts.
- **Proceso de tres pasos (handshake)**:
  1. **Cliente envía SYN**: Solicita inicio de la sesión con un valor de secuencia inicial.
  2. **Servidor responde con SYN-ACK**: Reconoce la solicitud y envía su propio valor de secuencia.
  3. **Cliente responde con ACK**: Completa el establecimiento de la conexión.
- **Retransmisión de datos**: Si no se recibe un acuse de recibo (ACK), TCP retransmite los datos no reconocidos.

### Analogía

Piensa en TCP como una conversación telefónica:
1. **Llamada inicial (SYN)**: El cliente marca el número del servidor.
2. **Respuesta del servidor (SYN-ACK)**: El servidor contesta y ambos verifican que están listos para hablar.
3. **Confirmación del cliente (ACK)**: El cliente dice "Hola", confirmando que la llamada está establecida.

Durante la llamada:
- **Acuses de recibo (ACKs)**: Ambos dicen "sí" o "entiendo" para confirmar que han escuchado al otro.
- **Retransmisión**: Si alguien no escucha algo, pide que se repita.

### Procesos del servidor TCP

- **Números de puerto**: Cada servicio en un servidor usa un número de puerto específico.
- **Puertos abiertos**: Un puerto configurado para un servicio se considera "abierto" y acepta segmentos dirigidos a él.

### Terminación de la conexión

- **Proceso de cuatro pasos**:
  1. **Cliente envía FIN**: Indica que no tiene más datos para enviar.
  2. **Servidor responde con ACK**: Reconoce la finalización.
  3. **Servidor envía FIN**: Indica que también ha terminado.
  4. **Cliente responde con ACK**: Confirma la terminación completa.

### Reensamblaje y control de flujo

- **Reensamblaje**: Los segmentos desordenados se reensamblan en el orden correcto utilizando números de secuencia.
- **Control de flujo**: Ajusta la tasa de transmisión de datos para evitar congestión y asegurar que los datos lleguen correctamente.

### Retransmisión y control de congestión

- **Retransmisión**: Si no se recibe un ACK en un tiempo predeterminado, se retransmiten los segmentos.
- **Control de congestión**: TCP ajusta el tamaño de la ventana y la tasa de transmisión según la capacidad de la red y el dispositivo de destino.

## UDP: Comunicación con baja sobrecarga

- **No orientado a la conexión**: UDP simplemente envía los datos sin establecer una conexión previa.
- **Baja sobrecarga**: Menos tráfico de red y procesamiento, adecuado para aplicaciones que pueden tolerar pérdidas de datos, como juegos en línea y VoIP.

### Diferencias clave entre TCP y UDP

- **TCP**: Confiabilidad, reensamblaje, control de flujo y retransmisión.
- **UDP**: Baja sobrecarga, sin establecimiento de conexión ni control de flujo.

### Analogía

UDP es como enviar postales:
- **Sin conexión**: Simplemente envías la postal, sin verificar si la otra persona la recibió.
- **Menos confiable**: Algunas postales pueden perderse, pero es rápido y eficiente para ciertos usos.

### Ejemplos de uso de UDP

- **DNS**: Reintenta la solicitud si no obtiene respuesta.
- **VoIP y juegos en línea**: Prefieren algunas pérdidas de datos a retrasos largos.

## Código Markdown

# TCP: Cómo generar conversaciones confiables

## Confiabilidad de TCP

### Establecimiento de conexión

- **Sesiones orientadas a la conexión**: TCP crea una conexión antes de enviar datos, lo que permite rastrear la comunicación entre hosts.
- **Proceso de tres pasos (handshake)**:
  1. **Cliente envía SYN**: Solicita inicio de la sesión con un valor de secuencia inicial.
  2. **Servidor responde con SYN-ACK**: Reconoce la solicitud y envía su propio valor de secuencia.
  3. **Cliente responde con ACK**: Completa el establecimiento de la conexión.
- **Retransmisión de datos**: Si no se recibe un acuse de recibo (ACK), TCP retransmite los datos no reconocidos.

### Analogía

Piensa en TCP como una conversación telefónica:
1. **Llamada inicial (SYN)**: El cliente marca el número del servidor.
2. **Respuesta del servidor (SYN-ACK)**: El servidor contesta y ambos verifican que están listos para hablar.
3. **Confirmación del cliente (ACK)**: El cliente dice "Hola", confirmando que la llamada está establecida.

Durante la llamada:
- **Acuses de recibo (ACKs)**: Ambos dicen "sí" o "entiendo" para confirmar que han escuchado al otro.
- **Retransmisión**: Si alguien no escucha algo, pide que se repita.

### Procesos del servidor TCP

- **Números de puerto**: Cada servicio en un servidor usa un número de puerto específico.
- **Puertos abiertos**: Un puerto configurado para un servicio se considera "abierto" y acepta segmentos dirigidos a él.

### Terminación de la conexión

- **Proceso de cuatro pasos**:
  1. **Cliente envía FIN**: Indica que no tiene más datos para enviar.
  2. **Servidor responde con ACK**: Reconoce la finalización.
  3. **Servidor envía FIN**: Indica que también ha terminado.
  4. **Cliente responde con ACK**: Confirma la terminación completa.

### Reensamblaje y control de flujo

- **Reensamblaje**: Los segmentos desordenados se reensamblan en el orden correcto utilizando números de secuencia.
- **Control de flujo**: Ajusta la tasa de transmisión de datos para evitar congestión y asegurar que los datos lleguen correctamente.

### Retransmisión y control de congestión

- **Retransmisión**: Si no se recibe un ACK en un tiempo predeterminado, se retransmiten los segmentos.
- **Control de congestión**: TCP ajusta el tamaño de la ventana y la tasa de transmisión según la capacidad de la red y el dispositivo de destino.

## UDP: Comunicación con baja sobrecarga

- **No orientado a la conexión**: UDP simplemente envía los datos sin establecer una conexión previa.
- **Baja sobrecarga**: Menos tráfico de red y procesamiento, adecuado para aplicaciones que pueden tolerar pérdidas de datos, como juegos en línea y VoIP.

### Diferencias clave entre TCP y UDP

- **TCP**: Confiabilidad, reensamblaje, control de flujo y retransmisión.
- **UDP**: Baja sobrecarga, sin establecimiento de conexión ni control de flujo.

### Analogía

UDP es como enviar postales:
- **Sin conexión**: Simplemente envías la postal, sin verificar si la otra persona la recibió.
- **Menos confiable**: Algunas postales pueden perderse, pero es rápido y eficiente para ciertos usos.

### Ejemplos de uso de UDP

- **DNS**: Reintenta la solicitud si no obtiene respuesta.
- **VoIP y juegos en línea**: Prefieren algunas pérdidas de datos a retrasos largos.