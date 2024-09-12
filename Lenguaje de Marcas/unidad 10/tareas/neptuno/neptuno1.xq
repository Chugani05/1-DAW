<html>
  <head><table>primera consulta</table></head>
  <body>
  <table border="15">
  <tr>
  <td>Referencia de articulo</td>
  <td>Referencia de proveedor</td>
  <td>Nombre de articulo</td>
  </tr>
  {for $art in doc("neptuno.xml") //articulos
return
  <tr>
  <td>{data($art/RefArticulo)}</td>
  <td>{data($art/ReferenciaProveedor)}</td>
  <td>{data($art/NombreArticulo)}</td>
  </tr>
}
  </table>
  </body>
</html>