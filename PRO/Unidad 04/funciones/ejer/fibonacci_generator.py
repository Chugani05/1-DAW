# *******************
# FIBONACCI GENERADOR
# *******************


def fibonacci(n: int):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b


def run(n: int) -> list:
    return list(fibonacci(n))
