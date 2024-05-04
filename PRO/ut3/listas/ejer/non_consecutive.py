# *******************
# NO ERES CONSECUTIVO
# *******************


def run(values: list) -> int:
    target = None
    if len(values) == 0:
        target = None
    else:
        for index in range(1, len(values)):
            if values[index] != values[index - 1] + 1:
                target = values[index]
                break

    return target


if __name__ == '__main__':
    run([1, 2, 3, 4, 6, 7, 8])
