2. Referencia del proveedor, nombre del proveedor, dirección, código postal, país y teléfono de todos los proveedores que sean de Francia

<html>
  <head><table>segunda consulta</table></head>
  <body>
  <table border="15">
    <tr>
      <td>Referencia del proveedor</td>
      <td>Nombre del proveedor</td>
      <td>Direccion</td>
      <td>Codigo postal</td>
      <td>Pais</td>
      <td>Numero de telefono</td>
    </tr>
  {
    for $proveedor in doc("examen.xml") /neptuno/proveedores/proveedor
    where $proveedor/PaisProveedor="Francia"
    return
      <tr>
        <td>{data($proveedor/ReferenciaProveedor)}</td>
        <td>{data($proveedor/NombreProveedor)}</td>
        <td>{data($proveedor/DireccionProveedor)}</td>
        <td>{data($proveedor/CodigoPostal)}</td>
        <td>{data($proveedor/PaisProveedor)}</td>
        <td>{data($proveedor/TelefonoProveedor)}</td>
      </tr>
}
  </table>
  </body>
</html>