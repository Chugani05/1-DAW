# ****************
# NOMBRE VICEVERSA
# ****************


def run(fullname: str) -> str:
    parts = fullname.find(' ')
    name = fullname[:parts]
    surname = fullname[parts + 1 :]
    swapname = f'{surname} {name}'

    return swapname


if __name__ == '__main__':
    run('John McClane')