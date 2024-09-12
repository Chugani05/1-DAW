# ********************
# ORDENANDO POR EDADES
# ********************


def run(people: list) -> list:
    """
    Function that orders a list by a key, in this case the age.

    :param people: list of names and ages of players.
    :type n: list

    :return: same list but ordered by age.
    :rtype: list
    """
    speople = sorted(people, key=lambda p: p['age'])

    return speople


if __name__ == '__main__':
    run(
        [
            {'name': 'DeRozan', 'age': 33},
            {'name': 'Lonzo', 'age': 25},
            {'name': 'Beverly', 'age': 34},
            {'name': 'Dragic', 'age': 36},
            {'name': 'Williams', 'age': 21},
        ]
    )
