# ********************
# CLAVES DESDE VALORES
# ********************


def run(items: dict, target_value: int) -> tuple:
    source_keys = []
    for key, value in items.items():
        if value == target_value:
            source_keys.append(key)

    return tuple(source_keys)


if __name__ == '__main__':
    run({'A': 1, 'B': 2, 'C': 3, 'D': 3, 'E': 4}, 3)
