5. Referencia de los artículo, nombre de los artículo, referencia del proveedor y nombre del proveedor de todos los productos que sean de la categoría bebidas

<html>
  <head><table>quinta consulta</table></head>
  <body>
  <table border="15">
    <tr>
      <td>Referencia del articulo</td>
      <td>Nombre del articuloe</td>
      <td>Referencia del proveedor</td>
      <td>Nombre del proveedor</td>
    </tr>
  {    
    for $articulo in doc("examen.xml") /neptuno/articulos/articulo
    for $proveedor in doc("examen.xml") /neptuno/proveedores/proveedor
    where $articulo/NombreCategoria = "Bebidas"
    and $articulo/ReferenciaProveedor = $proveedor/ReferenciaProveedor
    return
      <tr>
        <td>{data($articulo/RefArticulo)}</td>
        <td>{data($articulo/NombreArticulo)}</td>
        <td>{data($proveedor/ReferenciaProveedor)}</td>
        <td>{data($proveedor/NombreProveedor)}</td>
      </tr>
}
  </table>
  </body>
</html>