# ********************
# DESCUBRIENDO IMPARES
# ********************


def run(values: list) -> list:
    odds = []
    for num in values:
        if num % 2 == 1 and num not in odds:
            odds.append(num)

    return odds


if __name__ == '__main__':
    run([1, 2, 3, 4, 5])
