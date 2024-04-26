# *****************
# ORDENANDO NÚMEROS
# *****************


def run(numbers: list) -> list:
    sorted_numbers = numbers.copy()

    length = len(sorted_numbers)
    for i in range(length):
        for j in range(0, length - i - 1):
            if sorted_numbers[j] > sorted_numbers[j + 1]:
                sorted_numbers[j], sorted_numbers[j + 1] = sorted_numbers[j + 1], sorted_numbers[j]

    return sorted_numbers


if __name__ == '__main__':
    run([4, 2, 9, 7, 1, 8])
