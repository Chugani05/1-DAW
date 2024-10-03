# *********************************
# APLICANDO FUNCIÓN POR COMPRENSIÓN
# *********************************


def run(xmin: int, xmax: int) -> list:
    values = [3 * x + 2 for x in range(xmin, xmax + 1)]

    return values


if __name__ == '__main__':
    run(0, 10)
