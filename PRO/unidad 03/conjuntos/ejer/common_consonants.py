# *******************
# CONSONANTES COMUNES
# *******************


def run(text1: str, text2: str) -> str:
    text1 = text1.lower()
    text2 = text2.lower()

    # Extraer consonantes de cada cadena
    text1_consonants = {c for c in text1 if c.isalpha() and c not in 'aeiou'}
    text2_consonants = {c for c in text2 if c.isalpha() and c not in 'aeiou'}

    # Encontrar consonantes repetidas en ambas cadenas
    repeated_consonants = sorted(text1_consonants & text2_consonants)

    # Unir las consonantes repetidas ordenadas en una sola cadena
    cconst = ''.join(repeated_consonants)

    return cconst


if __name__ == '__main__':
    run('Flat is bEtter than nested', 'Readability counts')
    
