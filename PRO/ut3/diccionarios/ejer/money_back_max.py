# **************************
# AQUÍ TIENE SU VUELTA (MAX)
# **************************


def run(to_give_back: float, available_currencies: dict) -> dict:
    money_back = {}

    # Ordenar las monedas/billetes disponibles de mayor a menor valor
    sorted_currencies = sorted(available_currencies.keys(), reverse=True)

    # Iterar sobre cada moneda/billete disponible
    for currency in sorted_currencies:
        # Verificar si hay suficiente cantidad de esta moneda/billete para devolver el cambio
        num_notes = min(available_currencies[currency], int(to_give_back // currency))

        # Actualizar el diccionario de cambio
        if num_notes > 0:
            money_back[currency] = num_notes

            # Restar el valor de las monedas/billetes utilizados del cambio restante
            to_give_back -= num_notes * currency

    # Si el cambio restante no es cero, no se puede devolver el cambio
    if to_give_back != 0:
        money_back = None

    return money_back


if __name__ == '__main__':
    run(20, {5: 3, 2: 7, 1: 3})
