# ******************
# AGRUPANDO PALABRAS
# ******************


def run(words: list) -> dict:
    group_words = {}

    # Se itera sobre cada palabra en la lista de palabras de entrada
    for word in words:
        initial_letter = word[0].lower()

        # Se verifica si la letra inicial ya está presente como clave en el diccionario
        if initial_letter in group_words:
            # Si la letra inicial ya está presente, se agrega la palabra a la lista asociada a esa letra
            group_words[initial_letter].append(word)
        else:
            # Si la letra inicial no está presente, se crea una nueva entrada en el diccionario con la letra inicial como clave y una lista que contiene solo la palabra como valor
            group_words[initial_letter] = [word]

    return group_words


if __name__ == '__main__':
    run(
        [
            'mesa',
            'móvil',
            'barco',
            'coche',
            'avión',
            'bandeja',
            'casa',
            'monitor',
            'carretera',
            'arco',
        ]
    )
