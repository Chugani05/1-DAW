# ********************************
# PRIMER ELEMENTO REPETIDO N-VECES
# ********************************


def run(numbers: list, nrep: int) -> int:
    target_num = {}
    for number in numbers:
        if number in target_num:
            target_num[number] += 1
        else:
            target_num[number] = 1

    for number, occurrences in target_num.items():
        if occurrences == nrep:
            return number
    else:
        return -1


if __name__ == '__main__':
    run([2, 3, 5, 3, 2, 1, 8, 2], 3)
