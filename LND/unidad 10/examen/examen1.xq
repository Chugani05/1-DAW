1. Referencia del artículo, referencia del proveedor, Nombre, categoría, precio unidad, y unidades en existencia de todos los artículos que pertenezcan a la categoría bebidas

<html>
  <head><table>primera consulta</table></head>
  <body>
  <table border="15">
    <tr>
      <td>Referencia del articulo</td>
      <td>Referencia del proveedor</td>
      <td>Nombre del articulo</td>
      <td>Categoria del articulo</td>
      <td>Precio por unidad</td>
    </tr>
  {
    for $articulo in doc("examen.xml") /neptuno/articulos/articulo
    for $proveedor in doc("examen.xml") /neptuno/proveedores/proveedor
    where $articulo/NombreCategoria="Bebidas"
     and $articulo/ReferenciaProveedor=$proveedor/ReferenciaProveedor
    return
      <tr>
        <td>{data($articulo/RefArticulo)}</td>
        <td>{data($proveedor/ReferenciaProveedor)}</td>
        <td>{data($articulo/NombreArticulo)}</td>
        <td>{data($articulo/NombreCategoria)}</td>
        <td>{data($articulo/PrecioUnidad)}</td>
      </tr>
}
  </table>
  </body>
</html>