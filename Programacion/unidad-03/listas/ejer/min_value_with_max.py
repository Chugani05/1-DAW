# ************
# VALOR MÁXIMO
# ************


def run(values: list) -> int:
    min_value = -max([-num for num in values])

    return min_value


if __name__ == '__main__':
    run([-11, 10, -6, 15, -1])
