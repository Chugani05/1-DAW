# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************


VOWELS = "aeiou"


def count_vowels(text: str) -> int:

    if len(text) == 0:  # condición de parada
        return 0
    elif text[0] in VOWELS:
        return 1 + count_vowels(text[1:])
    else:
        return count_vowels(text[1:])


# Otra forma
def count_vowels(text: str) -> int:
    if len(text) == 0:  # condición de parada
        return 0
    return (text[0] in VOWELS) + count_vowels(text[1:])
