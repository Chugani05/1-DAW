(:Mostrar en la sala 1, que pague en euros y sea menos de 35:)

for $baile in doc ("bailes.xml") //bailes/baile
where $baile/precio/@moneda ='euro' and $baile/number(precio)>35 and $baile/sala='1'
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>