# ***************************
# BUSCANDO LA MAYOR DISTANCIA
# ***************************


def run(values: list, target: int) -> int:
    max_diff = -1
    for value in values:
        diff = abs(target - value)
        if diff > max_diff:
            max_diff = diff

    # Con operador morsa
    max_diff = -1
    for value in values:
        if (diff := abs(target - value)) < max_diff:
            max_diff = diff

    return max_diff


if __name__ == '__main__':
    run([7, 3, 1, 12, 21, 4], 8)
