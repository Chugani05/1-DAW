def get_dividers(n: int):
    for i in range(1, n // 2 + 1):
        if n % i == 0:
            yield i


for divider in get_dividers(20):
    print(divider)
