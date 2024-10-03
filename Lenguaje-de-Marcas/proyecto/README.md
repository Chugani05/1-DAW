## Informe sobre la Creación de la Página Web del "Libro de Recetas de Rashi"
<div align="center">
   <img src="../../extras/cafe.gif" alt="animation" width="50%"/>
</div>

## Contenido
- [Introducción](#introducción)
- [Estructura y Contenido](#estructura-y-contenido)
- [Conceptos Utilizados en la Creación](#conceptos-utilizados-en-la-creación)
- [Conclusiones](#conclusiones)


## Introducción
La página web del "Libro de Recetas de Rashi" es una plataforma digital diseñada para proporcionar una colección de recetas culinarias, junto con instrucciones detalladas para preparar cada plato. El objetivo principal de esta página es ofrecer a los usuarios una experiencia interactiva y educativa en el mundo de la cocina, inspirando y facilitando la preparación de diversas delicias gastronómicas.


## Estructura y Contenido
La estructura de la página se divide en varias secciones principales, cada una dedicada a una receta específica del libro. A continuación, se describe la organización y contenido de cada sección:

### 1. `<html>`

- **Propiedades:**
  - **lang="en"**: Indica que el contenido del documento está en inglés.

### 2. `<head>`

- **Etiquetas y Propiedades Importantes:**
  - **`<meta charset="UTF-8">`**: Define la codificación de caracteres como UTF-8.
  - **`<meta name="viewport" content="width=device-width, initial-scale=1.0">`**: Ajusta la escala del documento para mejorar la visualización en dispositivos móviles.
  - **`<title>Recipe Book</title>`**: Define el título de la página que se muestra en la pestaña del navegador.
  - **`<link rel="stylesheet" media="screen and (min-width: 800px)" href="widescreen.css">`**: Enlaza una hoja de estilo CSS específica para pantallas anchas.
  - **`<link rel="stylesheet" media="screen and (max-width: 600px)" href="smallscreen.css">`**: Enlaza una hoja de estilo CSS específica para pantallas pequeñas.

### 3. `<body>`

Contiene todo el contenido visible de la página web. Se divide en varias secciones, comenzando con el `<header>`.


#### 3.1 `<header>`

- **Elementos:**
  - **`<h1>`**: Título principal "Rashi's Recipe Book".
  - **`<nav>`**: Contiene el menú de navegación.
    - **`<h2>`**: Subtítulo "Contents".
    - **`<ul>`**: Lista desordenada de enlaces a las secciones de recetas.
      - **`<li><a href="#1">Chocolate chip cookies</a></li>`**: Enlace a la sección de "Chocolate chip cookies".
      - **`<li><a href="#2">Devil's food cake</a></li>`**: Enlace a la sección de "Devil's food cake".
      - **`<li><a href="#3">Pancakes</a></li>`**: Enlace a la sección de "Pancakes".
      - **`<li><a href="#4">Tiramisu</a></li>`**: Enlace a la sección de "Tiramisu".
      - **`<li><a href="#5">Blueberry muffins</a></li>`**: Enlace a la sección de "Blueberry muffins".


#### 3.2 `<main>`

El contenido principal de la página. Contiene varias secciones de recetas, cada una estructurada con etiquetas `<section>` y `<article>`.

##### Sección de Ejemplo: `<section id="1">`

##### `<article>`

- **División Principal:**
  - **`<div>`**: Agrupa el título y la imagen.
    - **`<h2>Chocolate chip cookies</h2>`**: Título de la receta.
    - **`<img src="url" alt="cookie">`**: Imagen de las cookies.
  - **`<div>`**: Agrupa la información básica y la tabla de ingredientes.
    - **`<ul>`**: Lista desordenada con información básica.
      - **`<li>Time: 35 min</li>`**: Tiempo de preparación.
      - **`<li>Serves: 30</li>`**: Porciones.
    - **`<table border="2">`**: Tabla de ingredientes.
      - **`<thead>`**: Encabezado de la tabla.
        - **`<tr><th>Ingredients</th><th>Quantity</th></tr>`**: Columnas "Ingredients" y "Quantity".
      - **`<tbody>`**: Cuerpo de la tabla con filas de ingredientes y cantidades.
        - **`<tr><td>Salted, softened butter</td><td>150g</td></tr>`**: Ingrediente y cantidad.
        - *(Se repiten filas similares para cada ingrediente)*

  - **`<div>`**: Agrupa los pasos de preparación.
    - **Pasos de Preparación**: Cada paso está marcado con `<strong>` para el título del paso y luego el detalle.
      - **`<strong>Step 1:</strong> Heat the oven to 190C...`**

  - **`<em>Source: <a href="source_url">BBC Good Food</a></em>`**: Fuente de la receta.

#### 3.3 Otras Secciones

Cada sección sigue una estructura similar a la detallada para "Chocolate chip cookies", con ligeras variaciones en los ingredientes, pasos e imágenes.

##### Sección de Suscripción: `<section id="subscribe">`

- **Contenido:**
  - **`<article>`**: Contiene un mensaje invitando a los usuarios a suscribirse al blog.
    - **`<h2>Suscríbete a nuestro blog de recetas en el siguente <a href="formulario_suscripcion.html">enlace</a>.</h2>`**: Mensaje con enlace al formulario de suscripción.


### 4. `<footer>`

- **Contenido:**
  - **`<p>Derechos de autor &copy; 2024 Rashi's Recipe Book. Todos los derechos reservados.</p>`**: Declaración de derechos de autor.


## Conceptos Utilizados en la Creación
La página web del "Libro de Recetas de Rashi" se ha desarrollado utilizando una variedad de conceptos y tecnologías web, que incluyen:

1. **HTML (HyperText Markup Language):**
   - Se utiliza para estructurar y organizar el contenido de la página, dividiéndolo en elementos semánticos como encabezados, párrafos, listas y tablas.

2. **CSS (Cascading Style Sheets):**
   - Se emplea para aplicar estilos visuales a los elementos HTML, como colores, tipografías, márgenes y diseños de página.

3. **Enlaces (a):**
   - Se utilizan para la navegación dentro de la página y para vincular recursos externos, como imágenes y fuentes, proporcionando una experiencia de usuario fluida y coherente.

4. **Formularios (form):**
   - Permiten a los usuarios enviar información al servidor web, en este caso, para suscribirse al blog de recetas y recibir actualizaciones periódicas.

5. **Elementos Semánticos HTML:**
   - Se utilizan para agregar significado y estructura al contenido, mejorando la accesibilidad y la indexación de la página por parte de los motores de búsqueda.

6. **Tablas HTML:**
   - Ayudan a organizar datos de manera tabular, como la lista de ingredientes en cada receta, facilitando la comprensión y la legibilidad del contenido.

7. **Imágenes (img):**
   - Se incorporan para enriquecer visualmente el contenido y proporcionar representaciones visuales de cada receta, aumentando su atractivo y apelación visual.

8. **Listas (ul, li):**
   - Se utilizan para enumerar elementos, como las recetas en la barra de navegación, facilitando la navegación y la selección de contenido por parte de los usuarios.

9. **Metadatos HTML:**
   - Se incluyen en la sección `<head>` para proporcionar información adicional sobre el documento, como el título, la codificación de caracteres y la configuración de la ventana gráfica para dispositivos móviles.


## Conclusiones
La página web del "Libro de Recetas de Rashi" es un ejemplo de cómo combinar eficazmente diferentes tecnologías y conceptos web para crear una experiencia digital atractiva y funcional. Al integrar HTML, CSS y otros elementos interactivos, la página logra ofrecer contenido informativo y útil de manera visualmente atractiva y fácilmente accesible para los usuarios.
