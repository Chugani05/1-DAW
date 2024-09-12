# *****************
# NÚMEROS PERFECTOS
# *****************


def division(n: int) -> list[int]:
    dividers = []
    for i in range(1, n // 2 + 1):
        if n % i == 0:
            dividers.append(i)
    return dividers


def is_perfect(n: int) -> bool:
    sum_dividers = sum(division(n))
    return sum_dividers == n
