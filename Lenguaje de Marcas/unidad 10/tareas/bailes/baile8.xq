(:Mostrar total de suma de preciosl:)

for $baile in doc ("bailes.xml") //bailes/baile
where $baile/sala[text()=1 and ../precio/@moneda="Euro" and ../number(precio)<35]
return $baile