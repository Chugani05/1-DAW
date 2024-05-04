# *******************
# EXTRACCIÓN DE PARES
# *******************


def is_even(value):
    return value % 2 == 0


def run(values: list) -> list:
    evens = []
    for value in values:
        if is_even(value):
            evens.append(value)
    return evens


# Con listas por compreción
def run(values: list[int]) -> list[int]:
    return [v for v in values if v % 2 == 0]


# Con listas por compreción con función auxiliar
def run(values: list[int]) -> list[int]:
    return [v for v in values if is_even(v)]
