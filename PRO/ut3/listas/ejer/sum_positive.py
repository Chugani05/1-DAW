# **********************
# SUMANDO SOLO POSITIVOS
# **********************


def run(numbers: list) -> int:
    sum_positive = 0
    for num in numbers:
        if num > 0:
            sum_positive += num

    return sum_positive


if __name__ == '__main__':
    run([1, -4, 7, 12])
