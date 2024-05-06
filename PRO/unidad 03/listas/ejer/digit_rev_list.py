# ************************
# DÍGITOS EN ORDEN INVERSO
# ************************


def run(number: int) -> list:
    rev_digits = []
    str_number = str(number)

    for num in str_number:
        num = int(num)
        rev_digits.append(num)

    rev_digits = list(reversed(rev_digits))

    return rev_digits


if __name__ == '__main__':
    run(35231)
