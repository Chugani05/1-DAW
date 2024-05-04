colum = 5

for code in range(33, 128):
    char = chr(code)
    print(f'{code} {char}', end='\t')

    if (code + 8) % colum == 0:
        print()
print()