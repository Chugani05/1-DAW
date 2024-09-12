# *************************
# PRIMER ELEMENTO DUPLICADO
# *************************


def run(numbers: list) -> int:
    fdup = set()
    for number in numbers:
        if number in fdup:
            return number
        fdup.add(number)
    else:
        return -1


if __name__ == '__main__':
    run([2, 3, 5, 3, 2])
