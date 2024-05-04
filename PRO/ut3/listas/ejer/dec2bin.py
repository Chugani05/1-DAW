# *****************
# DECIMAL A BINARIO
# *****************


def run(num: int) -> str:
    result = []
    while num > 0:
        result.append(str(num % 2))
        num //= 2
    to_bin = "".join(result[::-1])

    return to_bin


if __name__ == '__main__':
    run(1)
