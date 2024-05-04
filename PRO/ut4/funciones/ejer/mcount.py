# *******************
# CONTANDO SIN CONTAR
# *******************


def mcount(items: tuple[int], target: int = 1) -> int:
    """
    Function that counts the number of times a certain value appears in a tuple.

    :param items: tuple that contains intenger numbers.
    :type items: tuple[int]

    :param target: the number we are going to count, by default it is 1.
    :type target: int

    :return: count
    :rtype: int
    """

    count = 0
    for item in items:
        if item == target:
            count += 1
    return count
