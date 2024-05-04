# Tarea 5
## Creación de fichero base-datos-libros.sql.
Creamos un fichero nano en el que insertamos la información proporcionada en el archivo adjunto en la carpeta tarea5 con el siguente comando:
```sql
nano base-datos-libros.sql
```

## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea5.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read base-datos-libros.sql
```

## Realización de consultas
### Selección de libros cuyo título comienza con "H".
```sql
select * from libro where titulo regexp '^H';
```
-- La consulta se devuelve vacía

### Libros escritos por autores cuyos nombres terminan con "ing".
```sql
select titulo from libro as l, autor as a where a.id=l.autor_id and nombre regexp 'ing$';
```
-- La consulta se devuelve vacía

### Libros con títulos que contienen la palabra "and" en cualquier posición.
```sql
select titulo from libro where titulo regexp 'and';
```
|              titulo              |
|----------------------------------|
| The Old Man and the Sea          |
| Alice's Adventures in Wonderland |
| War and Peace                    |
| Crime and Punishment             |

### Libros cuyo título comienza con una vocal.
```sql
select * from libro where titulo regexp '^[AEIOU]';

```
| codigo |              titulo              | autor_id |       editorial       | precio |
|--------|----------------------------------|----------|-----------------------|--------|
| 4      | One Hundred Years of Solitude    | 9        | Harper & Row          | 22.5   |
| 20     | Alice's Adventures in Wonderland | 22       | Macmillan             | 11.5   |
| 24     | Anna Karenina                    | 26       | The Russian Messenger | 23.99  |

### Libros cuyo autor tiene al menos una vocal repetida.
```sql
select * from libro as l, autor as a where a.id=l.autor_id and a.nombre REGEXP '[aeiouAEIOU]{2}';
```
| codigo |     titulo      | autor_id |    editorial    | precio | id |    nombre     |
|--------|-----------------|----------|-----------------|--------|----|---------------|
| 5      | Brave New World | 3        | Chatto & Windus | 17.99  | 3  | George Orwell |

### Libros con precios que tienen dos dígitos decimales exactos.
```sql
select * from libro where precio REGEXP '\.[0-9]{2}$';
```
| codigo |              titulo               | autor_id |                  editorial                  | precio |
|--------|-----------------------------------|----------|---------------------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |

### Libros cuyos títulos tienen al menos tres palabras.
```sql
select * from libro where titulo regexp '^[a-zA-Z]+ [a-zA-Z]+ [a-zA-Z]';
```
| codigo |              titulo               | autor_id |         editorial         | precio |
|--------|-----------------------------------|----------|---------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.     | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row              | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus           | 17.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger     | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger     | 19.99  |

### Obtener todos los autores cuyo nombre empieza con la letra "A":
```sql
select * from autor where nombre regexp '^A';
```
| id |     nombre      |
|----|-----------------|
| 5  | Agatha Christie |

### Seleccionar los libros cuyo título contiene la palabra "SQL":
```sql
select * from libro where titulo regexp 'SQL';
```
-- La consulta se devuelve vacía

### Obtener todos los autores cuyo nombre termina con "ez":
```sql
select * from autor where nombre regexp 'ez$';
```
-- La consulta se devuelve vacía

### Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:
```sql
select * from autor where nombre regexp '.....';
```
| id |     nombre      |
|----|-----------------|
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |

### Seleccionar los libros cuya editorial es diferente de "EditorialX":
```sql
select * from libros where editorial not regexp 'EditorialX';
```
| codigo |              titulo               | autor_id |                  editorial                  | precio |
|--------|-----------------------------------|----------|---------------------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |

### Obtener todos los autores cuyo nombre contiene al menos una vocal:
```sql
select * from autor where nombre regexp '[aeiouAEIOU]';
```
| id |     nombre      |
|----|-----------------|
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |

### Seleccionar los libros cuyo título comienza con una letra mayúscula:
```sql
select * from libro where titulo regexp '[A-Z]';
```
| codigo |              titulo               | autor_id |                  editorial                  | precio |
|--------|-----------------------------------|----------|---------------------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |

### Obtener todos los autores cuyo nombre no contiene la letra "r":
```sql
select * from autor where nombre not regexp 'r';
```
| id |    nombre    |
|----|--------------|
| 1  | J.K. Rowling |
| 2  | Stephen King |
| 4  | Jane Austen  |

### Seleccionar los libros cuya editorial empieza con la letra "P":
```sql
select * from libro where editorial regexp '^P';
```
| codigo |          titulo           | autor_id | editorial | precio |
|--------|---------------------------|----------|-----------|--------|
| 16     | The Count of Monte Cristo | 18       | Pétion    | 27.99  |

### Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:
```sql
select * from autor where nombre regexp '^......$';
```
-- La consulta se devuelve vacía

### Seleccionar los libros cuyo título contiene al menos un número:
```sql
select * from libro where titulo regexp '\\d';
```
-- La consulta se devuelve vacía

### Obtener todos los autores cuyo nombre inicia con una vocal:
```sql
select * from autor where nombre regexp '^[AEIOU]';
```
| id |     nombre      |
|----|-----------------|
| 5  | Agatha Christie |

### Obtener todos los autores cuyo nombre no contiene espacios en blanco:
```sql
select * from autor where nombre not regexp '\s';
```
-- La consulta se devuelve vacía

### Seleccionar los libros cuyo título termina con una vocal:
```sql
select * from libro where titulo regexp '[aeiou]$';
```
| codigo |            titulo             | autor_id |         editorial         | precio |
|--------|-------------------------------|----------|---------------------------|--------|
| 3      | The Catcher in the Rye        | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude | 9        | Harper & Row              | 22.5   |
| 8      | The Chronicles of Narnia      | 11       | Geoffrey Bles             | 28.99  |
| 15     | The Old Man and the Sea       | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo     | 18       | Pétion                    | 27.99  |
| 21     | The Prince                    | 23       | Niccolò Machiavelli       | 10.99  |
| 22     | Don Quixote                   | 24       | Francisco de Robles       | 26.75  |
| 24     | Anna Karenina                 | 26       | The Russian Messenger     | 23.99  |
| 28     | War and Peace                 | 26       | The Russian Messenger     | 33.25  |

### Obtener todos los autores cuyo nombre contiene la secuencia "er":
```sql
select * from autor where nombre regexp 'er';
```
-- La consulta se devuelve vacía

### Seleccionar los libros cuyo título empieza con la palabra "The":
```sql
select * from libro where titulo regexp '^The';
```
| codigo |              titulo               | autor_id |         editorial         | precio |
|--------|-----------------------------------|----------|---------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin      | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                     | 14.95  |
| 10     | The Iliad                         | 12       | Homer                     | 14.95  |
| 12     | The Road                          | 14       | Alfred A. Knopf           | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli       | 10.99  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |

### Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:
```sql
select * from autor where nombre regexp '[A-Z]';
```
| id |     nombre      |
|----|-----------------|
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |

### Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:
```sql
select * from libro where precio REGEXP '\.[0-9]{2}$';
```
| codigo |              titulo               | autor_id |                  editorial                  | precio |
|--------|-----------------------------------|----------|---------------------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |

### Obtener todos los autores cuyo nombre no contiene números:
```sql
select * from autor where nombre not regexp '[0-9]';
```
| id |     nombre      |
|----|-----------------|
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |

### Seleccionar los libros cuyo título contiene al menos tres vocales:
```sql
select * from libro where titulo regexp '[aeiou]*[aeiou]*[aeiou]';
```
| codigo |              titulo               | autor_id |                  editorial                  | precio |
|--------|-----------------------------------|----------|---------------------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |

### Obtener todos los autores cuyo nombre inicia con una consonante:
```sql
select * from autor where nombre not regexp '^[AEIOU]';
```
| id |    nombre     |
|----|---------------|
| 1  | J.K. Rowling  |
| 2  | Stephen King  |
| 3  | George Orwell |
| 4  | Jane Austen   |

### Seleccionar los libros cuyo título no contiene la palabra "Science":
```sql
select * from libro where titulo not regexp 'Science';
```
| codigo |              titulo               | autor_id |                  editorial                  | precio |
|--------|-----------------------------------|----------|---------------------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |

### Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:
```sql
select * from autor where nombre regexp '(.)\\1+';
```
| id |     nombre      |
|----|-----------------|
| 3  | George Orwell   |

### Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":
```sql
select * from autor where nombre regexp '^M|n$';
```
-- La consulta se devuelve vacía

### Obtener todos los autores cuyo nombre no contiene caracteres especiales:
```sql
select * from libro where titulo not regexp '^[a-zA-Z0-9]+$';
```
| codigo |              titulo               | autor_id |            editorial             | precio |
|--------|-----------------------------------|----------|----------------------------------|--------|
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons          | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.            | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company        | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                     | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                  | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin             | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin             | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                    | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                            | 14.95  |
| 10     | The Iliad                         | 12       | Homer                            | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                  | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                 | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                     | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons          | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                           | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company          | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                    | 16.99  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                        | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli              | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles              | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                  | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger            | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie. | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers             | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                    | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger            | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger            | 19.99  |