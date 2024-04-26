MAX_DOMINO = 6

for token1 in range(0, MAX_DOMINO + 1):
    for token2 in range(token1, MAX_DOMINO + 1):
        domino = f'{token1}|{token2}'
        print(domino, end=' ')
    print()