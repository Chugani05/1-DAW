# ************
# VALOR MÁXIMO
# ************


def run(values: list) -> int:
    max_value = -min(-num for num in values)

    return max_value


if __name__ == '__main__':
    run([-11, 10, -6, 15, -1])
