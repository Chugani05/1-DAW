# *********************
# PALABRAS CON LONGITUD
# *********************


def run(text: str) -> list:
    words_length = [f'{word} {str(len(word))}' for word in text.split(' ')]

    return words_length


if __name__ == '__main__':
    run('todo se transforma')
