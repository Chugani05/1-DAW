ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
text = input('Escribe una frase: ')

for char in text:
    if char.lower() not in ALPHABET:
        print('Se han encontrado caracteres no alfabéticos')
        break
else:
    print('Todos los caracteres encontrados son alfabéticos')
