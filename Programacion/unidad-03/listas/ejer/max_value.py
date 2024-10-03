# ************
# VALOR MÁXIMO
# ************


def run(values: list) -> int:
    max_value = values[0]
    for value in values[1:]:
        if value > max_value:
            max_value = value

    return max_value


if __name__ == '__main__':
    run([-11, 10, -6, 15, -1])
