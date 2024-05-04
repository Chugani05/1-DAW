# **************
# EL LOBO ACECHA
# **************


def run(farm: list) -> str:
    if (sheep_in_danger_position := len(farm) - farm.index('lobo') - 1) == 0:
        msg = 'No te quiero ver más por aquí, lobo'
    else:
        msg = f'Cuidado oveja {sheep_in_danger_position}, el lobo te va a comer'

    return msg


if __name__ == '__main__':
    run(['oveja', 'oveja', 'lobo', 'oveja'])
