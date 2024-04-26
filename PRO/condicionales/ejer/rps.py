person_1 = input('¿piedra, papel o tijera?: ')
person_2 = input('¿piedra, papel o tijera?: ')

if person_1 == 'piedra' and person_2 == 'papel':
    winner = 2
    msg = 'papel envuelve piedra'
elif person_1 == 'papel' and person_2 == 'tijera':
    winner = 2
    msg = 'tijera corta papel'
elif person_1 == 'tijera' and person_2 == 'piedra':
    winner = 2
    msg = 'piedra aplasta tijera'
elif person_1 == 'papel' and person_2 == 'piedra':
    winner = 1
    msg = 'papel envuelve piedra'
elif person_1 == 'tijera' and person_2 == 'papel':
    winner = 1
    msg = 'tijera corta papel'
elif person_1 == 'piedra' and person_2 == 'tijera':
    winner = 1
    msg = 'piedra aplasta tijera'

if person_1 == person_2:
    winner = 0
    msg = 'empate'
else:
    msg = f'gana persona {winner}, {msg}'

print(msg)