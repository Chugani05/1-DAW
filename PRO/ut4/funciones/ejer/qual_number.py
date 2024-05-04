# ********************
# CUALIFICANDO NÚMEROS
# ********************


def get_qual_number(num: int) -> str:
    """
    Function that given a number returns it with the corresponding commas.

    :param n: given number.
    :type n: int

    :return: number separeted by commas.
    :rtype: str
    """

    num = str(num)[::-1]
    qnumber = []

    for counter in range(len(num)):
        if counter % 3 == 0 and counter != 0:
            qnumber.append(',')
        qnumber.append(num[counter])

    return ''.join(qnumber)[::-1]


def run(number: int) -> str:
    return get_qual_number(number)


if __name__ == '__main__':
    run(1)
