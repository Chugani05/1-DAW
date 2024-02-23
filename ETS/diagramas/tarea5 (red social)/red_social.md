# Red social
En este ejercicio procederemos a analizar el diagrama de comportamiento de la siguiente imagen: 

![Diagrama de comportamiento](red_social.png)

## Actores
| Actor  | Usuario  |
|---|---|
| Descripción  | Usuario registrado en la aplicación de red social. Puede interactuar con la plataforma para publicar mensajes, conectar con amigos y realizar otras acciones sociales.  |
| Características  | - Puede publicar mensajes. <br> - Puede conectar con amigos. <br> - Puede ver su actividad y la de sus amigos.  |
| Relaciones  | - Realiza acciones similares a otros usuarios. <br> - Interactúa con casos de uso como "Publicar Mensaje", "Conectar con Amigos" y "Ver Actividad".  |
| Referencias  | - Participa en casos de uso relacionados con interacción social.  |
| Notas  | - Puede tener atributos adicionales, como "Número de Amigos" o "Número de Seguidores".  |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Actor  | Administrador  |
|---|---|
| Descripción  | Usuario con privilegios especiales encargado de gestionar y moderar la plataforma de la red social. |
| Características  | - Puede gestionar usuarios. <br> - Puede eliminar publicaciones. <br> - Puede moderar contenido. |
| Relaciones  | - Realiza acciones específicas de administración y moderación. <br> - Interactúa con casos de uso como "Gestionar Usuarios", "Eliminar Publicación" y "Moderar Contenido". |
| Referencias  | - Participa en casos de uso relacionados con la administración del sistema. |
| Notas  | - Debe tener acceso a funciones y datos privilegiados. |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

## Casos de Uso
| Caso de Uso CU  | Publicar Mensaje  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Usuario  |
| Descripción  | Permite al usuario publicar un mensaje en su perfil o en el de sus amigos. |
| Flujo Básico  | 1. El usuario inicia sesión en la aplicación. <br> 2. Accede a la sección de publicación. <br> 3. Redacta el mensaje. <br> 4. Publica el mensaje en su perfil o en el de un amigo. |
| Pre-condiciones  | El usuario ha iniciado sesión en la aplicación. |
| Post-condiciones  | El mensaje se publica en el perfil seleccionado. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Se pueden agregar opciones como adjuntar imágenes o etiquetar amigos. |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Caso de Uso CU    | Conectar con Amigos  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Usuario  |
| Descripción  | Permite al usuario conectar con otros usuarios, estableciendo una relación de amistad. |
| Flujo Básico  | 1. El usuario busca a un amigo. <br> 2. Envía una solicitud de amistad. <br> 3. El otro usuario acepta la solicitud. |
| Pre-condiciones  | Ambos usuarios han iniciado sesión en la aplicación. |
| Post-condiciones  | Se establece una conexión de amistad entre los usuarios. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Puede haber un proceso de confirmación de amistad. |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Caso de Uso CU    | Enviar Solicitud de Amistad  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Usuario                                     |
| Descripción  | Permite al usuario enviar una solicitud de amistad a otro usuario en la plataforma. |
| Flujo Básico  | 1. El usuario inicia sesión en la aplicación. <br> 2. Busca al usuario deseado. <br> 3. Selecciona la opción de enviar solicitud de amistad. <br> 4. El sistema envía una notificación al usuario destinatario. |
| Pre-condiciones  | El usuario ha iniciado sesión en la aplicación. |
| Post-condiciones  | Se envía una solicitud de amistad al usuario destinatario. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Puede haber un límite en el número de solicitudes de amistad enviadas. |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Caso de Uso CU    | Eliminar Publicación  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Administrador  |
| Descripción  | Permite al administrador eliminar publicaciones de usuarios que infringen las normas de la plataforma. |
| Flujo Básico  | 1. El administrador inicia sesión en la plataforma. <br> 2. Accede a la sección de moderación. <br> 3. Busca y selecciona la publicación a eliminar. <br> 4. Confirma la eliminación. |
| Pre-condiciones  | El administrador ha iniciado sesión y tiene permisos de moderación. |
| Post-condiciones  | La publicación seleccionada es eliminada del sistema. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Debe haber mecanismos para reportar publicaciones. |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Caso de Uso CU  | Ver Actividad  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Usuario  |
| Descripción  | Permite al usuario ver la actividad reciente en su red, incluyendo publicaciones de amigos y eventos. |
| Flujo Básico  | 1. El usuario inicia sesión en la aplicación. <br> 2. Accede a la sección de actividad. <br> 3. Visualiza las publicaciones de amigos y eventos recientes. |
| Pre-condiciones  | El usuario ha iniciado sesión en la aplicación. |
| Post-condiciones  | El usuario visualiza la actividad más reciente en su red. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Puede haber opciones de filtrado de contenido. |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Caso de Uso CU    | Gestionar Usuario  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Administrador  |
| Descripción  | Permite al administrador gestionar usuarios, incluyendo la capacidad de ver, editar y eliminar cuentas.  |
| Flujo Básico  | 1. El administrador inicia sesión en la plataforma. <br> 2. Accede a la sección de gestión de usuarios. <br> 3. Busca y selecciona un usuario. 4. Visualiza, edita o elimina la cuenta según sea necesario.  |
| Pre-condiciones  | El administrador ha iniciado sesión y tiene permisos de gestión.  |
| Post-condiciones  | Se realiza la acción seleccionada sobre la cuenta de usuario.  |
| Requerimientos  | Conexión a Internet para acceder a la plataforma.  |
| Notas  | - Se deben establecer protocolos de seguridad para estas acciones.  |
| Autor | Rashi Chugani Narwanni  |
| Fecha | 20/01/2024  |

| Caso de Uso CU    | Editar Perfil  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Usuario  |
| Descripción  | Permite al usuario editar la información de su perfil, incluyendo detalles como nombre, foto de perfil, biografía, intereses, etc. |
| Flujo Básico  | 1. El usuario inicia sesión en la aplicación. <br> 2. Accede a la sección de edición de perfil. <br> 3. Realiza las modificaciones deseadas en la información del perfil. <br> 4. Guarda los cambios. |
| Pre-condiciones  | El usuario ha iniciado sesión en la aplicación. |
| Post-condiciones  | La información del perfil del usuario se actualiza con los cambios realizados. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Pueden haber campos específicos para la edición, como la posibilidad de cambiar la foto de perfil o agregar enlaces a redes sociales. |
| Autor | Rashi Chugani Narwanni  |
| Fecha | 20/01/2024  |

| Caso de Uso CU  | Moderar Contenido  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Administrador  |
| Descripción  | Permite al administrador revisar y moderar contenido para asegurar el cumplimiento de las normas de la plataforma.  |
| Flujo Básico  | 1. El administrador inicia sesión en la plataforma. <br> 2. Accede a la sección de moderación. <br> 3. Revisa y evalúa el contenido. <br> 4. Aplica acciones moderadoras según las políticas de la plataforma.  |
| Pre-condiciones  | El administrador ha iniciado sesión y tiene permisos de moderación.  |
| Post-condiciones  | Se aplica la moderación al contenido seleccionado.  |
| Requerimientos  | Conexión a Internet para acceder a la plataforma.  |
| Notas  | - Pueden existir diferentes niveles de moderación.  |
| Autor | Rashi Chugani Narwanni |
| Fecha | 20/01/2024 |

| Caso de Uso CU  | Bloquear Usuario  |
|---|---|
| Fuentes  | Aplicacion de Red Social  |
| Actor  | Usuario  |
| Descripción  | Permite al usuario bloquear a otro usuario en la plataforma, impidiendo así la interacción entre ambos. |
| Flujo Básico  | 1. El usuario inicia sesión en la aplicación. <br> 2. Busca al usuario que desea bloquear. <br> 3. Selecciona la opción de bloquear usuario. <br> 4. Confirma la acción. |
| Pre-condiciones  | El usuario ha iniciado sesión en la aplicación. |
| Post-condiciones  | El usuario seleccionado queda bloqueado y la interacción entre ambos se ve restringida. |
| Requerimientos  | Conexión a Internet para acceder a la plataforma. |
| Notas  | - Puede haber un proceso de confirmación para evitar bloqueos accidentales. |
| Autor | Rashi Chugani Narwanni  |
| Fecha | 20/01/2024  |

## Redacciónes de Casos de Uso
| **CU-001**  | **Publicar Mensaje**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)  | |
| **Dependencias** | CU-005 Ver Actividad.  | |
| **Precondición** | El usuario ha iniciado sesión en la aplicación. | |
| **Descripción** | Permite al usuario publicar un mensaje en su perfil o en el de sus amigos. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El usuario inicia sesión en la aplicación. |
| | 2   | Accede a la sección de publicación. |
| | 3   | Redacta el mensaje. |
| | 4   | Publica el mensaje en su perfil. |
| **Postcondición** | El mensaje se publica en el perfil seleccionado. | |
| **Excepciones** | N/A  |
| **Comentarios** | Este caso de uso es fundamental para la interacción y comunicación dentro de la plataforma, permitiendo a los usuarios compartir información y experiencias. | |

| **CU-002**  | **Conectar con Amigos**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)         | |
| **Dependencias** | CU-001 Publicar Mensaje.  | |
| **Precondición** | Ambos usuarios han iniciado sesión en la aplicación. | |
| **Descripción** | Permite al usuario conectar con otros usuarios, estableciendo una relación de amistad. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El usuario busca a un amigo. |
| | 2   | Envía una solicitud de amistad. |
| | 3   | El otro usuario acepta la solicitud. |
| | 4   | Le llega una nitificación de solicitud aceptada al usuario. |
| **Postcondición** | Se establece una conexión de amistad entre los usuarios. | |
| **Excepciones** | **Paso** | **Comentarios** |
| | 3   | El otro usuario no acepta la solicitud de amistad. |
| |     | *E.1* Se anula la solicitud. <br> *E.2* No llega la notificación de aceptación. <br> *E.3* Se cancela el caso de uso. |
| **Comentarios** | Si el otro usuario no acepta la solicitud, se pueden considerar diferentes acciones, como cancelar la solicitud, reenviarla o contactar al usuario directamente. | |

| **CU-003**  | **Enviar Solicitud de Amistad**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)                | |
| **Dependencias** | CU-002 Conectar con Amigos.  | |
| **Precondición** | El usuario ha iniciado sesión en la aplicación. | |
| **Descripción** | Permite al usuario enviar una solicitud de amistad a otro usuario en la plataforma. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El usuario inicia sesión en la aplicación. |
| | 2   | Busca al usuario deseado. |
| | 3   | Selecciona la opción de enviar solicitud de amistad. |
| | 4   | El sistema envía una notificación al usuario destinatario. |
| **Postcondición** | Se envía una solicitud de amistad al usuario destinatario. |
| **Excepciones** | N/A  | |
| **Comentarios** | Esta acción puede generar una expectativa de conexión entre usuarios, por lo que es importante considerar la calidad y el tono del mensaje de solicitud. | |

| **CU-004**  | **Eliminar Publicación**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)         | |
| **Dependencias** | CU-005 Ver Actividad.  | |
| **Precondición** | El administrador ha iniciado sesión y tiene permisos de moderación. | |
| **Descripción** | Permite al administrador eliminar publicaciones de usuarios que infringen las normas de la plataforma. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El administrador inicia sesión en la plataforma. |
| | 2   | Accede a la sección de moderación. |
| | 3   | Busca y selecciona la publicación a eliminar. |
| | 4   | Confirma la eliminación. |
| **Postcondición** | La publicación seleccionada es eliminada del sistema. | |
| **Excepciones** | N/A                   | |
| **Comentarios** | Al eliminar una publicación, es importante notificar al usuario afectado y, si es necesario, proporcionarle información sobre las políticas de la plataforma. | |

| **CU-005**  | **Ver Actividad**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)   | |
| **Dependencias** | CU-004 Eliminar Publicación.  | |
| **Precondición** | El usuario ha iniciado sesión en la aplicación. | |
| **Descripción** | Permite al usuario ver la actividad reciente en su red, incluyendo publicaciones de amigos y eventos. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El usuario inicia sesión en la aplicación. |
| | 2   | Accede a la sección de actividad. |
| | 3   | Visualiza las publicaciones de amigos y eventos recientes. |
| **Postcondición** | El usuario visualiza la actividad más reciente en su red. | |
| **Excepciones** | N/A        | |
| **Comentarios** | Esta funcionalidad puede ayudar al usuario a mantenerse al día con las últimas novedades y eventos dentro de la plataforma. | |

| **CU-006**  | **Gestionar Usuario**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)      | |
| **Dependencias** | CU-002 Conectar con Amigos. | |
| **Precondición** | El administrador ha iniciado sesión y tiene permisos de gestión. | |
| **Descripción** | Permite al administrador gestionar usuarios, incluyendo la capacidad de ver, editar y eliminar cuentas. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El administrador inicia sesión en la plataforma. |
| | 2   | Accede a la sección de gestión de usuarios. |
| | 3   | Busca y selecciona un usuario. |
| | 4   | Visualiza, edita o elimina la cuenta según sea necesario. |
| **Postcondición** | Se realiza la acción seleccionada sobre la cuenta de usuario. |
| **Excepciones** | N/A          | |
| **Comentarios** | Este caso de uso proporciona al administrador el control necesario para mantener la integridad y seguridad de la plataforma, permitiendo una gestión efectiva de los usuarios y sus cuentas. | |

| **CU-007**  | **Editar Perfil**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)  | |
| **Dependencias** | CU-003 Enviar Solicitud de Amistad.  | |
| **Precondición** | El usuario ha iniciado sesión en la aplicación. | |
| **Descripción** | Permite al usuario editar la información de su perfil, incluyendo detalles como nombre, foto de perfil, biografía, intereses, etc. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El usuario inicia sesión en la aplicación. |
| | 2   | Accede a la sección de edición de perfil. |
| | 3   | Realiza las modificaciones deseadas en la información del perfil. |
| | 4   | Guarda los cambios. |
| **Postcondición** | La información del perfil del usuario se actualiza con los cambios realizados. | |
| **Excepciones** | N/A       | |
| **Comentarios** | Este caso de uso permite a los usuarios mantener su información de perfil actualizada y personalizada según sus preferencias y necesidades. | |

| **CU-008**  | **Moderar Contenido**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)      | |
| **Dependencias** | CU-004 Eliminar Publicación. | |
| **Precondición** | El administrador ha iniciado sesión y tiene permisos de moderación. | |
| **Descripción** | Permite al administrador revisar y moderar contenido para asegurar el cumplimiento de las normas de la plataforma. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El administrador inicia sesión en la plataforma. |
| | 2   | Accede a la sección de moderación. |
| | 3   | Revisa y evalúa el contenido. |
| | 4   | Aplica acciones moderadoras según las políticas de la plataforma. |
| **Postcondición** | Se aplica la moderación al contenido seleccionado. | |
| **Excepciones** | N/A         | |
| **Comentarios** | La moderación de contenido es crucial para mantener un entorno seguro y respetuoso dentro de la plataforma, promoviendo una experiencia positiva para todos los usuarios. | |

| **CU-009**  | **Bloquear Usuario**  | |
|---|---|---|
| **Versión** | 1.0 (27/01/2024)      | |
| **Dependencias** | CU-002 Conectar con Amigos.  | |
| **Precondición** | El usuario ha iniciado sesión en la aplicación. | |
| **Descripción** | Permite al usuario bloquear a otro usuario en la plataforma, impidiendo así la interacción entre ambos. | |
| **Secuencia normal** | **Paso** | **Acción** |
| | 1   | El usuario inicia sesión en la aplicación. |
| | 2   | Busca al usuario que desea bloquear. |
| | 3   | Selecciona la opción de bloquear usuario. |
| | 4   | Confirma la acción. |
| **Postcondición** | El usuario seleccionado queda bloqueado y la interacción entre ambos se ve restringida. | |
| **Excepciones** | **Paso** | **Comentarios** |
| | 3   | El usuario cambia de opinión y decide no bloquearlo. |
| |     | *E.1* Toca el boton de ir hacia atras. <br> *E.2* Se cancela el caso de uso. |
| **Comentarios** | Bloquear a un usuario es una medida extrema y debe ser utilizada con precaución. Es importante que los usuarios comprendan las implicaciones de esta acción. | |

## Tabla de Relaciones de "Include"
| Caso de Uso Principal  | Caso de Uso Incluido  | Descripción  |
|---|---|---|
| Conectar con Amigos  | Enviar Solicitud de Amistad  | Permite al usuario enviar solicitudes de amistad a otros usuarios.  |
| Gestionar Usuarios  | Editar Perfil  | Permite al usuario editar la información de su perfil.  |
| Moderar Contenido  | Bloquear Usuario  | Permite al moderador bloquear a un usuario, restringiendo su acceso.  |
| Moderar Contenido  | Eliminar Publicacion  | Permite al moderador eliminar contenido inapropiado o no permitido.  |

## Diagrama de secuencias
A continuación le proporcionamos el diagrama de secuencias relacionado con el caso de uso principal, "Publicar mensaje":

![Diagrama de secuencias](diagrama_secuencias_red_social.png)