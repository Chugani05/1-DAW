# *************************
# PALABRAS EN ORDEN INVERSO
# *************************


def run(text: str) -> str:
    reversing = ' '.join(reversed(text.split(' '))).lower()

    return reversing


if __name__ == '__main__':
    run('Hello World')
