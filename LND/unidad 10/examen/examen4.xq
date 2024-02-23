4. Referencia de los pedidos, referencia del cliente, referencia del artículo y fecha de los pedidos realizados por el cliente con referencia PICCO

<html>
  <head><table>cuarta consulta</table></head>
  <body>
  <table border="15">
    <tr>
      <td>Referencia de los pedidos</td>
      <td>Referencia del cliente</td>
      <td>Referencia del articulo</td>
      <td>Fecha de los pedidos</td>
    </tr>
  {
    for $cliente in doc("examen.xml") /neptuno/clientes/cliente
    for $articulo in doc("examen.xml") /neptuno/articulos/articulo
    where $cliente/RefCliente="PICCO" 
    and $cliente/RefArticulo=$articulo/RefArticulo
    return
      <tr>
        <td>{data($cliente/RefPedido)}</td>
        <td>{data($cliente/RefCliente)}</td>
        <td>{data($cliente/RefArticulo)}</td>
        <td>{data($cliente/FechaPedido)}</td>
      </tr>
}
  </table>
  </body>
</html>