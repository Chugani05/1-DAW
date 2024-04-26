# *****************************
# SOMOS IGUALES, PERO DISTINTOS
# *****************************


def run(items: list) -> bool:
    all_same = True
    first_element = items[0]
    for item in items[1:]:
        if item != first_element:
            all_same = False
            break

    return all_same


if __name__ == '__main__':
    run([1, 1, 1, 1, 1, 1])
