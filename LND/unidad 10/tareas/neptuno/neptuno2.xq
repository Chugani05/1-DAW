<html>
  <head><table>segunda consulta</table></head>
  <body>
    <table border="15">
      <tr>
        <td>Referencia de cliente</td>
        <td>Nombre de cliente</td>
        <td>Referencia de articulo</td>
        <td>Nombre de categoria</td>
      </tr>
  {
   for $articulo in doc("neptuno.xml")//articulos/articulo
   for $cliente in doc("neptuno.xml")//clientes
   where $articulo/NombreCategoria="Bebidas"
     and $articulo/RefCliente=$cliente/RefCliente
   return
     <tr>
       <td>{data($cliente/RefCliente)}</td>
       <td>{data($cliente/NombreCliente)}</td>
       <td>{data($articulo/NombreArticulo)}</td>
       <td>{data($articulo/NombreCategoria)}</td>
     </tr>
  }
  </table>
  </body>
</html>