# *******************
# GENERANDO CUADRADOS
# *******************


def gen_sq(n: int) -> list:
    """
    Function that receives a parameter n and includes an expression generator to calculate the first n integers raised to the square.

    :param n: given number.
    :type n: int

    :return: list of the first n integers raised to the square.
    :rtype: list
    """
    return list(n**2 for n in range(n))
