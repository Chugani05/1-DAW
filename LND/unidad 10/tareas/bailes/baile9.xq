<html>
  <head><title>Bailes</title></head>
  <body>
  <table border="2" color="blue">
  <tr>
  <td>Nombre</td>
  <td>Precio</td>
  </tr>
  {for $baile in doc("bailes.xml") //bailes/baile
where $baile/number(precio)>40
return
   <tr>
  <td>{$baile/nombre}</td>
  <td>{$baile/string(precio)}</td>
  </tr>
}
  </table>
  </body>
</html>