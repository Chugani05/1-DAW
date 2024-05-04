# **********************
# PIEDRA, PAPEL O TIJERA
# **********************


def run(choice1: str, choice2: str) -> int:
    choice1_all = choice1.lower()
    choice2_all = choice2.lower()

    if (
        (choice1_all == 'piedra' and choice2_all == 'tijera')
        or (choice1_all == 'papel' and choice2_all == 'piedra')
        or (choice1_all == 'tijera' and choice2_all == 'papel')
    ):
        winner = 1
    else:
        winner = 2

    if choice1_all == choice2_all:
        winner = 0

    return winner


if __name__ == '__main__':
    run('piedra', 'PAPEL')