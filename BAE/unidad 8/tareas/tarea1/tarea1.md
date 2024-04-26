# Tarea 1
# Tarea Procedimientos

<div align="center">
<img src="https://danielme.com/wp-content/uploads/2023/08/image-16.png" width="300">
</div>

En este ejercicio, vamos a trabajar en la creación de una base de datos simple utilizando MySQL. Esta base de datos estará diseñada para __administrar información de usuarios y productos__. Una vez que hayamos creado la base de datos y las tablas necesarias, vamos a implementar procedimientos almacenados y funciones para realizar operaciones comunes sobre estos datos.

## Pasos:
### Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos._
  ```sql
  CREATE DATABASE IF NOT EXISTS SimpleDB;

  USE SimpleDB;

  CREATE TABLE IF NOT EXISTS Users (
      UserID INT AUTO_INCREMENT PRIMARY KEY,
      UserName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) NOT NULL
  );

  CREATE TABLE IF NOT EXISTS Products (
      ProductID INT AUTO_INCREMENT PRIMARY KEY,
      ProductName VARCHAR(100) NOT NULL,
      Price DECIMAL(10, 2) NOT NULL
  );
  ```

### Realiza la inserción de algunos datos de prueba. Realizar la inserción de al menos 3 elementos más en cada tabla.
  ```sql
  INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Ana', 'ana@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Lola', 'lola@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Oliver', 'oliver@example.com');

  INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 4', 20.95);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 5', 50.25);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 6', 9.80);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 7', 11.20);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 8', 25.65);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 9', 34.99);
  ```
  Hacemos la llamada mediante:
```sql
select * from Users;
```
| UserID | UserName | Email              |
|--------|----------|--------------------|
|      1 | Juan     | juan@example.com   |
|      2 | María    | maria@example.com  |
|      3 | Pedro    | pedro@example.com  |
|      4 | Ana      | ana@example.com    |
|      5 | Lola     | lola@example.com   |
|      6 | Oliver   | oliver@example.com |


### Crea __procedimientos almacenados__ para realizar operaciones como __insertar un nuevo usuario, actualizar el nombre de un usuario__, etc. Realiza la invocación y la verificación de que ha funcionado correctamente.
#### Procedimiento para insertar un nuevo usuario.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS Create_User;
CREATE PROCEDURE Create_User(IN Name VARCHAR(100), IN Mail VARCHAR(50))
BEGIN
  INSERT INTO User (UserName, Email) VALUES (Name, Mail);
END //
DELIMITER ;
```

Añadimos un nuevo usuario mediante:
```sql
call Create_User('Rashi', 'rashi@example.com');
```

Hacemos la llamada mediante:
```sql
select * from Users;
```
| UserID | UserName | Email              |
|--------|----------|--------------------|
|      1 | Juan     | juan@example.com   |
|      2 | María    | maria@example.com  |
|      3 | Pedro    | pedro@example.com  |
|      4 | Ana      | ana@example.com    |
|      5 | Lola     | lola@example.com   |
|      6 | Oliver   | oliver@example.com |
|      7 | Rashi    | rashi@example.com  |


#### Procedimiento para actualizar el nombre de un usuario. 
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS Modify_User;
CREATE PROCEDURE Modify_User(IN Id INTEGER, IN Name VARCHAR(50), IN Mail VARCHAR(50)) 
BEGIN 
    UPDATE Users set UserName=Name, Email=Mail WHERE UserID=Id; 
END //
DELIMITER ;
```

Cambiamos el nombre y el email de uno de los usuarios mediante:
```sql
call Modify_User(4, 'Inés', 'ines@example.com');
```

Hacemos la llamada mediante:
```sql
select * from Users;
```
| UserID | UserName | Email              |
|--------|----------|--------------------|
|      1 | Juan     | juan@example.com   |
|      2 | María    | maria@example.com  |
|      3 | Pedro    | pedro@example.com  |
|      4 | Inés     | ines@example.com   |
|      5 | Lola     | lola@example.com   |
|      6 | Oliver   | oliver@example.com |
|      7 | Rashi    | rashi              |


### Implementa funciones para realizar cálculos o consultas:
#### Función para calcular el precio total de un conjunto de productos.
```sql
DELIMITER //
DROP FUNCTION IF EXISTS Get_Total_Price;
CREATE FUNCTION Get_Total_Price()
RETURNS float deterministic
BEGIN 
    DECLARE result float;
    SELECT sum(Price) FROM Products INTO result;
    RETURN result;
END //
DELIMITER ;
```

Comprobamos que la funcion funcione mediante:
```sql
select Get_Total_Price();
```
| Get_Total_Price() |
|-------------------|
|            200.08 |

Para comprobar que da el mismo resultado:
```sql
select sum(Price) from Products;
```
| sum(Price) |
|------------|
|     200.08 |


#### Función para contar el número de usuarios.
```sql
DELIMITER //
DROP FUNCTION IF EXISTS User_Counter;
CREATE FUNCTION User_Counter()
RETURNS integer deterministic
BEGIN 
    DECLARE result integer;
    SELECT  count(*) From Users INTO result;
    RETURN result;
END //
DELIMITER ;
```

Comprobamos que la funcion funcione mediante:
```sql
select User_Counter();
```
| User_Counter() |
|----------------|
|              7 |

Para comprobar que da el mismo resultado:
```sql
select count(UserID) from Users;
```
| count(UserID) |
|---------------|
|             7 |
