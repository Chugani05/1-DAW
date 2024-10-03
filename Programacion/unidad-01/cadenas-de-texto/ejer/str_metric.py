# ********************************
# UNA MÉTRICA PARA CADENA DE TEXTO
# ********************************


def run(text: str) -> int:
    total_characters = len(text)
    number_total_vocals = (
        text.count('a') + text.count('e') + text.count('i') + text.count('o') + text.count('u')
    )
    metric = total_characters * number_total_vocals

    return metric


if __name__ == '__main__':
    run('ordenador')