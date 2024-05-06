# *******************
# APROXIMANDO EL SENO
# *******************


def run(x: float) -> float:
    term1 = 4 * x * (180 - x)
    term2 = 40500 - x * (180 - x)

    sin = term1 / term2

    return sin


if __name__ == '__main__':
    run(90)