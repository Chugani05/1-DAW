# *********************
# VALOR MÁXIMO Y MÍNIMO
# *********************


def run(values: list) -> tuple:
    # TU CÓDIGO AQUÍ
    max_value = values[0]
    min_value = values[0]
    for value in values[1:]:
        if value < min_value:
            min_value = value
        elif value > max_value:
            max_value = value

    return max_value, min_value


if __name__ == '__main__':
    run([4, 6, 2, 1, 9, 63, -134, 566])
