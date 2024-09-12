size = int(input('Write the size you whant the mosaic to be: '))

for line in range(size):
    for colum in range(size):
        if colum > line:
            symbol = 'U'
        elif colum < line:
            symbol = 'D'
        else:
            symbol = 'X'
        print(symbol, end=' ')
    print()