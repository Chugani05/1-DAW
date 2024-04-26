# *********************
# ENCONTRANDO ISOGRAMAS
# *********************


def run(text: str) -> bool:
    ALPHABET = 'abcdefghijklmnñopqrstuvwxyz'
    letter_find = []
    text = text.lower()

    is_isogram = True

    for letters in text:
        if letters in ALPHABET:
            if letters in letter_find:
                is_isogram = False
                break
            else:
                letter_find.append(letters)

    return is_isogram


if __name__ == '__main__':
    run('lumberjacks')
