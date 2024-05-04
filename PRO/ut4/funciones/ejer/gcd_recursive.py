# ********************
# MÁXIMO COMÚN DIVISOR
# ********************


def gcd(a: int, b: int) -> int:
    if b == 0:
        return a
    r = a % b
    return gcd(b, r)
