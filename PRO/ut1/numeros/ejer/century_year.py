# **************************
# BUSCANDO EL SIGLO ADECUADO
# **************************


def run(year: int) -> int:
    century = int(year - 1) // 100 + 1

    return century


if __name__ == '__main__':
    run(1705)