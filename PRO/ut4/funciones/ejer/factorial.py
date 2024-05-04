# ************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO
# ************************************


def factorial(value):
    if isinstance(value, int):
        if value < 0:
            return None
        fact = 1
        for number in range(1, value + 1):
            fact *= number
        return fact