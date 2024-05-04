def matraca(func):
    def wrapper(*args, **kwargs):
        result = func()
        if result > 0:
            return


@matraca
def mul(a, b):
    return a * b
