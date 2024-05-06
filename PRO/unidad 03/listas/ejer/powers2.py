# **************
# POTENCIAS DE 2
# **************


def run(num_powers: int) -> list:
    powers2 = [2**num_powers for num_powers in range(num_powers + 1)]

    return powers2


if __name__ == '__main__':
    run(0)
