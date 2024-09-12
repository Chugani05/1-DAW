num = int(input('Inserte a number: '))

for value in range(2, num // 2):
    if num % value == 0:
        print('Its not a prime number')
        break
else:
    print('Its a prime number')