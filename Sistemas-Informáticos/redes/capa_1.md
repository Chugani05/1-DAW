# Conceptos de Capa Física
## Medios de Transmisión
En un sistema de transmisión, el medio de transmisión es el canal físico a través del cual se establece la comunicación entre el emisor y el receptor. Estos medios pueden ser guiados o no guiados, ambos basados en la transmisión de ondas electromagnéticas.

### Medios Guiados
En los medios guiados, como el cable coaxial, el par trenzado y la fibra óptica, las ondas electromagnéticas viajan a través de cables. Tres elementos clave caracterizan estos medios:

- Velocidad de transmisión: Las velocidades varían entre los tipos de cables, siendo la fibra óptica la más rápida.

- Alcance de la señal: Determinado por la atenuación, que aumenta con la distancia recorrida, limitando la longitud de cable sin necesidad de regeneración de la señal.

- Calidad de la señal: Problemas como la interferencia electromagnética pueden afectar la calidad de la transmisión, especialmente en cables eléctricos.

### Medios No Guiados
En los medios no guiados, como la radiofrecuencia, el wifi, el bluetooth, etc., las ondas electromagnéticas se propagan sin un medio físico específico. Estos medios proporcionan flexibilidad pero pueden ser más susceptibles a interferencias y pérdidas de señal.

### Elementos de Conexión
Estos son los dispositivos físicos que facilitan la conectividad con la red. Un adaptador de red o interfaz de red, comúnmente conocido como tarjeta de red, permite la conexión a la red al interpretar la información transmitida a través de los medios de transmisión en forma de bits.

### Conectores
Los conectores son elementos donde finaliza la conexión con el cable. Varían dependiendo del tipo de cable utilizado y requieren una tarjeta de red compatible.

### Antenas
Las antenas se utilizan en redes inalámbricas y eliminan la necesidad de conectores físicos. Pueden ser omnidireccionales (emiten en todas direcciones) o direccionales (emiten en una dirección específica). Convierten señales eléctricas en ondas electromagnéticas para transmitir la señal sin cables.

### Transmisiones Inalámbricas y Parámetros
Las transmisiones inalámbricas utilizan ondas electromagnéticas, caracterizadas por la frecuencia, la amplitud y la fase. La elección de la frecuencia afecta la distancia y la cantidad de información transmitida. Se regulan en bandas de frecuencia para evitar interferencias.

### Modulación
La modulación permite transportar información sobre una señal portadora, mejorando el aprovechamiento del canal y la resistencia a interferencias. Se pueden modificar la amplitud, la frecuencia o la fase de la portadora. Hay técnicas analógicas y digitales, como AM, FM y QAM, cada una con sus ventajas y aplicaciones específicas.

### Par Trenzado
#### Descripción
El cable de par trenzado consiste en dos alambres de cobre aislados, que se trenzan de forma helicoidal similar a una molécula de ADN. Esta trenza forma un circuito que puede transmitir datos. La trenza se realiza porque dos alambres paralelos actúan como una antena simple. Al trenzar los alambres, las ondas de diferentes vueltas se cancelan, reduciendo la interferencia eléctrica externa y entre pares cercanos.

#### Estructura
Un cable de par trenzado está formado por varios pares trenzados, normalmente cuatro, cubiertos por un material aislante. Cada par se identifica por colores:
- Par 1: Blanco-Azul / Azul
- Par 2: Blanco-Naranja / Naranja
- Par 3: Blanco-Verde / Verde
- Par 4: Blanco-Marrón / Marrón

#### Tipos de Cables
Dependiendo del apantallamiento, existen varios tipos de cables de par trenzado:
1. **UTP (Unshielded Twisted Pair)**: No apantallados, son los más simples y sensibles a interferencias. 
2. **STP (Shielded Twisted Pair)**: Apantallados individualmente, con alta inmunidad al ruido pero muy rígidos.
3. **FTP (Foiled Twisted Pair)**: Con una malla conductora global trenzada, ofrecen una protección intermedia.
   
<img src="https://www.tdtprofesional.com/blog/wp-content/uploads/cables.jpg" width="400px">

#### Categorías de Cables
Los cables de par trenzado se clasifican en varias categorías según el número de pares, vueltas por metro y materiales utilizados:
- **Categoría 3**: Hasta 10 Mbps, usado en telefonía y redes Ethernet 10BaseT.
- **Categoría 4**: Hasta 16 Mbps, usado en Token Ring.
- **Categoría 5**: Hasta 100 Mbps, usado en Ethernet 100Base-TX.
- **Categoría 5e**: Hasta 622 Mbps, usado en Gigabit Ethernet.
- **Categoría 6**: Hasta 1000 Mbps.

#### Conectores
Los cables de par trenzado usan conectores RJ45, con la siguiente asignación:
- Pinos 1 y 2: Transmisión
- Pinos 3 y 6: Recepción

#### AWG (American Wire Gauge)
El grosor de los hilos se mide en AWG; a mayor grosor, menor es el número AWG. Por ejemplo:
- 22 AWG: Hilo telefónico de referencia.
- 14 AWG: Más grueso.
- 26 AWG: Más delgado.

### Cable Coaxial
#### Descripción
Similar al usado en antenas de televisión, consta de un hilo de cobre central rodeado por una malla metálica y un cilindro de plástico, protegido por una cubierta exterior. Los dos conductores comparten el mismo eje.

#### Tipos
- **Thicknet**: Cable grueso, hasta 500 m, en desuso.
- **Thinnet**: Cable fino, hasta 185 m, más flexible y fácil de instalar.

#### Uso
Menos susceptible a interferencias y ruidos, adecuado para:
- Redes de área local
- Transmisión telefónica de larga distancia
- Distribución de televisión por cable

#### Conectores
Usa la familia BNC:
- **Conector BNC**: Forma de T.
- **Terminador**: Resistencia de 50 ohmios.
- **Conector acoplador**: Para unir cables.

### Fibra Óptica
#### Descripción
Utiliza ondas de luz para transmitir información. Consta de tres componentes:
- **Fuente de luz**: Indica un bit 1 con un pulso de luz.
- **Medio de transmisión**: Fibra de vidrio ultradelgada.
- **Detector**: Genera un impulso eléctrico al recibir luz.
  
<img src="https://www.thefoa.org/ESP/Fibra_optica.fld/image003.png" width="350px">

#### Tipos
- **Monomodo**: Fibra delgada, luz en línea recta, núcleo de 10 μm.
- **Multimodo**: Luz incide internamente como un espejo, núcleo de 100 μm.
- **Multimodo de índice gradual**: Luz refracta gradualmente, mismo diámetro que multimodo.

#### Ventajas
- Alta velocidad de transmisión (hasta 10 Gbps).
- Menor atenuación.
- Inmunidad a interferencias electromagnéticas.

#### Conectores
- **SC (Straight Connection)**: Para fibras monomodo.
- **ST (Straight Tip)**: Similar al SC, usado en Ethernet híbrido.
- **LC (Lucent Connector)**: Pequeño, popular en fibra monomodo y multimodo.

### Tipos de Ethernet
#### Velocidades
- **10 Mbps**: Ethernet
- **100 Mbps**: Fast Ethernet
- **1000 Mbps**: Gigabit Ethernet
- **10 Gbps**: 10 Gigabit Ethernet

#### Estándares Comunes
- **10Base5**: 10 Mbps, coaxial grueso, 500 m.
- **10Base2**: 10 Mbps, coaxial fino, 185 m.
- **10BaseT**: 10 Mbps, UTP Cat3/Cat5, 100 m.
- **100BaseTX**: 100 Mbps, 2 pares STP o UTP Cat5 o mayor, 100 m.
- **1000BaseTX**: 1000 Mbps, 4 pares UTP 5e o 6, 100 m.
- **1000BaseLX**: 1000 Mbps, fibra monomodo, hasta 10 km.

#### Colisiones en Ethernet
Una trama viaja por el bus de la red, alcanzando todas las estaciones conectadas. No puede saltar a otra red, permaneciendo en su dominio de colisión. Los switches y routers separan dominios de colisión y extienden la red.

#### Dispositivos de Interconexión
- **Repetidores**: Regeneran la señal entre segmentos de red.
- **Concentradores (Hubs)**: Punto de conexión central para nodos de red. Pueden ser:
  - Activos: Regeneran la señal.
  - Pasivos: Solo interconectan equipos.