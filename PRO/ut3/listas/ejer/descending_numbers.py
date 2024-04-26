# ****************
# CONTEO REGRESIVO
# ****************


def run(n: int) -> list:
    rev_nums = []
    for num in range(n, 0, -1):
        rev_nums.append(num)

    return rev_nums


if __name__ == '__main__':
    run(5)
