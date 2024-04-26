# ******************************
# VALORES IGUALES EN DICCIONARIO
# ******************************


def run(items: dict) -> bool:
    # Si el diccionario está vacío, todos sus valores son iguales (True)
    if not items:
        all_same = True
    else:
        # Seleccionar el primer valor del diccionario
        first_value = items[next(iter(items))]

        # Iterar sobre los valores del diccionario y comparar con el primer valor
        for value in items.values():
            if value != first_value:
                all_same = False

    return all_same


if __name__ == '__main__':
    run({'a': 1, 'b': 1, 'c': 1, 'd': 1})
