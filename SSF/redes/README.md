# Índice

# Introducción a los sistemas en red
## Sistema de comunicación
## Red de computadoras
## Clasificación de las redes locales
## Internet e Intranet
## Topología de la red
## Componentes básicos de una red de ordenadores

# Capa Física (OSI 1)

# Capa de Enlace a Datos (OSI 2)

# Capa de Red (OSI 3)

| Clase | Máscara |	Inicio | Fin | Nº redes | Total | Primera red | Última red | IPs por red |	Total IPs |	Total Equipos (*) |
|-------|---------|--------|-----|----------|-------|-------------|------------|-------------|------------|-------------------|
| A (n.h.h.h) | 255.0.0.0	| 0 |	127 |	128= |	128 |	0.x.x.x | 127.x.x.x |	256*256*256= |	16.777.216 |	16.777.214 |
| B (n.n.h.h) | 255.255.0.0 |	128 | 191 |	64*256= |	16.384 | 128.0.x.x |	191.255.x.x |	256*256= |	65.536 |	65.534 |
| C (n.n.n.h) | 255.255.255.0 |	192 |	223 |	32*256*256= |	2.097.152 |	192.0.0.x |	223.255.255.x |	256 |	256 |	254 |
| D | | 224 | 239 | | | | | | | |
| E | | 240 | 255 | | | | | | | |