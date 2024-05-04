# *********************
# ENCUENTRA LA INTEGRAL
# *********************


def run(symbol: str) -> str:
    # Encontrar la posición de la coma en la cadena
    coma_pos = symbol.find(',')

    # Obtener el coeficiente y el exponente como subcadenas
    coefficient = int(symbol[:coma_pos])
    exponent = int(symbol[coma_pos + 1 :])

    # Calcular la integral
    new_exponent = exponent + 1
    new_coefficient = coefficient // new_exponent

    # Crear la expresión de la integral
    integral = f"{new_coefficient}x^{new_exponent}"

    return integral


if __name__ == '__main__':
    run('3,2')
