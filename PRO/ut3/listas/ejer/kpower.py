# *********************************
# COMPROBANDO IGUALDAD DE POTENCIAS
# *********************************


def run(n: int) -> tuple:
    left_side = right_side = sum(k for k in range(1, n + 1)) ** 2

    return left_side, right_side


if __name__ == '__main__':
    run(1)
