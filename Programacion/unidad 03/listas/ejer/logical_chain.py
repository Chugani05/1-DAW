# ******************
# CALCULADORA LÓGICA
# ******************


def run(values: list, oper: str) -> bool:
    match oper:
        case 'and':
            result = True
            for value in values:
                result = result and value
        case 'or':
            result = False
            for value in values:
                result = result or value

    return result


if __name__ == '__main__':
    run([True, True, False], 'and')
