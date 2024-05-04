secret_num = int(78)

print('Bienvenido al juego de adivinar el número.')
print('Tienes 8 intentos para adivinar el número secreto que está entre 1 y 100.')

for attempt in range(1, 9):
    user_num = int(input(f'Intento {attempt}: Adivina el número: '))
    if user_num == user_num:
        print(f'¡Felicidades! Has adivinado el número en el intento {attempt}')
        break
    elif user_num < secret_num:
        print('El número que buscas es mayor')
    else:
        print('El número que buscas es menor')

if user_num != secret_num:
    print(f'Lo siento, no has adivinado el número. El número correcto era {user_num}.')
