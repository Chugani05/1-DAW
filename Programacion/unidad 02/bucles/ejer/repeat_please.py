name = input('Por favor introduzca su nombre y apellidos: ')

while name != name.title():
    print('Error, vuelva a introducir el nombre')
    name = input('Por favor introduzca su nombre y apellidos: ')
    break

else:
    print('Nombre introducido correctamente')