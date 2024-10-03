# ********************
# AQUÍ TIENE SU VUELTA
# ********************


def run(to_give_back: float, available_currencies: list) -> dict:
    money_back = {}

    # Ordenar las monedas/billetes disponibles de mayor a menor
    available_currencies.sort(reverse=True)

    # Iterar sobre las monedas/billetes disponibles
    for currency in available_currencies:
        # Calcular cuántas veces la moneda/billete actual puede ser utilizada para devolver el cambio
        num_notes = int(to_give_back // currency)

        # Si podemos devolver al menos una moneda/billete de este tipo
        if num_notes > 0:
            money_back[currency] = num_notes

            # Restar el valor de las monedas/billetes utilizados del cambio restante
            to_give_back -= num_notes * currency

    # Si el cambio restante no es cero, no se puede devolver el cambio
    if to_give_back != 0:
        money_back = None

    return money_back


if __name__ == '__main__':
    run(20, [5, 2, 1])
