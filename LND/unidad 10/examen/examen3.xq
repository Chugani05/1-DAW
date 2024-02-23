3. Referencia del cliente, nombre del cliente, dirección y ciudad de todos los clientes que sean de la ciudad de Madrid.

<html>
  <head><table>tercera consulta</table></head>
  <body>
  <table border="15">
    <tr>
      <td>Referencia del cliente</td>
      <td>Nombre del cliente</td>
      <td>Direccion</td>
      <td>Ciudad</td>
    </tr>
  {
    for $cliente in doc("examen.xml") /neptuno/clientes/cliente
    where $cliente/CiudadCliente="Madrid"
    return
      <tr>
        <td>{data($cliente/RefCliente)}</td>
        <td>{data($cliente/NombreCliente)}</td>
        <td>{data($cliente/DireccionCliente)}</td>
        <td>{data($cliente/CiudadCliente)}</td>
      </tr>
}
  </table>
  </body>
</html>