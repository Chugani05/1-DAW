(:Muestran todos los bailes que contengan la letra :)

for $baile in doc ("bailes.xml") //bailes/baile
where contains($baile/nombre, "a")
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>