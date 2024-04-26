# ********************
# DESCIFRANDO CIUDADES
# ********************


def run(cinfo: str) -> dict:
    cities = {}

    split_in_par = cinfo.split(';')

    for split_all in split_in_par:
        city, population = split_all.split(':')
        population = int(population.replace('_', ''))

        cities[city] = population

    return cities


if __name__ == '__main__':
    run('Tokyo:38_140_000;Delhi:26_454_000;Shanghai:24_484_000;Mumbai:21_357_000')
