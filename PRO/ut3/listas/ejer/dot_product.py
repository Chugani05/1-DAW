# ****************
# PRODUCTO ESCALAR
# ****************


def run(vector1: list, vector2: list) -> float:
    dprod = 0

    if len(vector1) == len(vector2):
        for v1, v2 in zip(vector1, vector2):
            dprod += v1 * v2
    else:
        dprod = None

    return dprod


if __name__ == '__main__':
    run([4, 3, 8, 1], [9, 2, 7, 3])
