# **************
# SUMA INVERTIDA
# **************


def run(numbers: list) -> int:
    add_inv = 0
    for num in numbers:
        add_inv += -num

    return add_inv


if __name__ == '__main__':
    run([1, 2, 3, 4, 5])
