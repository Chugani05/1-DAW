# **********************
# DESPLEGANDO CARACTERES
# **********************


def run(texts: list) -> list:
    chars = []

    for words in texts:
        for letters in words:
            chars.append(letters)

    return chars


if __name__ == '__main__':
    run(['uno', 'dos', 'tres'])
