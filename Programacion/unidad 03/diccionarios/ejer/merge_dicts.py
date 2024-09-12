# **********************
# MEZCLANDO DICCIONARIOS
# **********************


def run(d1: dict, d2: dict) -> dict:
    merged = {}

    for key, value in d1.items():
        merged[key] = value

    for key, value in d2.items():
        merged[key] = value

    return merged


if __name__ == '__main__':
    run({'a': 1, 'b': 2}, {'a': 3, 'c': 4})
