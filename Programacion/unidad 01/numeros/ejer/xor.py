# ***
# XOR
# ***


def run(v1: bool, v2: bool) -> bool:
    xor = (v1 or v2) and not (v1 and v2)

    return xor


if __name__ == '__main__':
    run(False, False)