# *************************
# LA MULTIPLICACIÓN DE JACK
# *************************


def run(n: int) -> int:
    num_digits = len(str(abs(n)))
    powe_five = 5**num_digits
    result = n * power_five

    return result


if __name__ == '__main__':
    run(3)
