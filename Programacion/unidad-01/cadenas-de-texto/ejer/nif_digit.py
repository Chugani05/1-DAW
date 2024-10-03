# *************************
# DÍGITO DE CONTROL DEL NIF
# *************************


def run(nif: str) -> str:
    letters = 'TRMAGMYFPDXBNJZSQVHLCKE'
    numbers_nif = letters[int(nif) % 23]
    wnif = nif + numbers_nif

    return wnif


if __name__ == '__main__':
    run('78654355')