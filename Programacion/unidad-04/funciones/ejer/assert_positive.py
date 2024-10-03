# *******************************
# ASEGURANDO ARGUMENTOS POSITIVOS
# *******************************


def assert_positive(func):
    def wrapper(*args, **kwargs):
        for arg in args:
            if isinstance(arg, (int, float)) and arg < 0:
                return 0
        for kwarg in kwargs:
            if isinstance(kwarg, (int, float)) and kwarg < 0:
                return 0
        return func(*args, **kwargs)

    return wrapper


@assert_positive
def factorial(n: int) -> int:
    if n < 0:
        return None
    if n == 0:
        return 1
    return n * factorial(n - 1)
