(:Mostrar en la sala 1, que pague en euros y sea menos de 35:)

for $baile in doc ("bailes.xml") //bailes/baile
where $baile/precio/@moneda ="euro"
return 
$baile/nombre/text()