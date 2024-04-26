# ************
# VALOR MÍNIMO
# ************


def run(values: list) -> int:
    min_value = values[0]
    for value in values[1:]:
        if value < min_value:
            min_value = value

    return min_value


if __name__ == '__main__':
    run([-11, 10, -6, 15, -1])
