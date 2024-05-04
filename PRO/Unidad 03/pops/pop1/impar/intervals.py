# ********************
# INTERVALO DESPLEGADO
# ********************


def run(interval: str) -> list:
    start_symbol = interval[0]
    end_symbol = [-1]
    values = interval[1:-1].split(',')
    start_value = int(values[0])
    if start_symbol == '(':
        start_value += 1
    end_value = int(values[1])
    if end_symbol == ']':
        end_value += 1
    irange = list(range(start_value, end_value))

    # Version mejorada
    start_symbol = interval[0]
    end_symbol = [-1]
    values = interval[1:-1].split(',')
    start_value = int(values[0]) + (start_symbol == '(')
    end_value = int(values[1]) + (end_symbol == ']')
    irange = list(range(start_value, end_value))

    return irange


if __name__ == '__main__':
    run('[3,10]')
