# *****************
# ALFABETO CIRCULAR
# *****************


ALPHABET = "abcdefghijklmnopqrstuvwxyz"


def len_gen(n):
    pos = 0
    limit = len(ALPHABET)
    while True:
        yield ALPHABET[pos % limit]
        pos += 1


def run(max_letters: int) -> str:
    return ''.join(len_gen(max_letters))


if __name__ == '__main__':
    run(0)
