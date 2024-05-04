value1 = input('Ingrese el primer número:')
value2 = input('Ingrese el segundo número:')
value1 = int(value1)
value2 = int(value2)

addition = value1 + value2
subtraction = value1 - value2
multiplication = value1 * value2
division = value1 / value2

print(f'\noperaciones entre {value1} y {value2}:')
print(f'{value1}+{value2}={addition}')
print(f'{value1}-{value2}={subtraction}')
print(f'{value1}*{value2}={multiplication}')
print(f'{value1}/{value2}={division}')

