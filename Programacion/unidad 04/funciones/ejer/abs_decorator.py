# *******************************
# DECORANDO CON VALORES ABSOLUTOS
# *******************************


def fabs(func):
    def wrapper(a: int, b: int) -> int:
        a = abs(a)
        b = abs(b)
        result = func(a, b)
        return result
    return wrapper


@fabs
def fprod(a: int, b: int) -> int:
    return a * b
