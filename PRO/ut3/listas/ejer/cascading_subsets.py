# ***********************
# SUBCONJUNTOS EN CASCADA
# ***********************


def run(values: list, size: int) -> list:
    cascading = []
    for num in range(len(values) - size + 1):
        sublist = values[num : num + size]
        cascading.append(sublist)

    return cascading


if __name__ == '__main__':
    run([1, 2, 3, 4], 3)
