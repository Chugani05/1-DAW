(:Muestran todos los bailes con un precio superior a 40 ordenador por nombre:)

for $baile in doc ("bailes.xml") //bailes/baile
order by $baile/nombre 
where $baile/number(precio)>40
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>