# ************************
# INTERCAMBIANDO TU NOMBRE
# ************************


def run(name: str, surname: str) -> str:
    value1 = ', '
    fullname = f'{surname + value1 + name}'

    return fullname


if __name__ == '__main__':
    run('Sergio', 'Delgado Quintero')