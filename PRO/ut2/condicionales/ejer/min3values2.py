# *******************
# MÍNIMO DE 3 VALORES
# *******************


def run(value1: int, value2: int, value3: int) -> int:
    if value1 < value2 < value3:
        min_value = value1
    elif value1 < value3 < value2:
        min_value = value1
    elif value2 < value3 < value1:
        min_value = value2
    elif value2 < value1 < value3:
        min_value = value2
    else:
        min_value = value3

    return min_value


if __name__ == '__main__':
    run(7, 4, 9)