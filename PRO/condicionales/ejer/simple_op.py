# ********************************
# RESOLVIENDO UNA OPERACIÓN SIMPLE
# ********************************


def run(num1: int, num2: int, op: str) -> float:
    match op:
        case '+':
            result = num1 + num2
        case '-':
            result = num1 - num2
        case '*':
            result = num1 * num2
        case '/':
            result = num1 / num2
        case _:
            result = None

    return result


if __name__ == '__main__':
    run(5, 2, '+')
