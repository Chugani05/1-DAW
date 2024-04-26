# ******************
# TUPLAS Y CONJUNTOS
# ******************


def run(input: tuple) -> set:
    element1 = set()
    element2 = set()

    # Iterar sobre las duplas en la tupla de entrada
    for pair in input:
        # Agregar los primeros valores al primer conjunto
        element1.add(pair[0])
        # Agregar los segundos valores al segundo conjunto
        element2.add(pair[1])

    output = element1, element2

    return output


if __name__ == '__main__':
    run(((4, 3), (8, 2), (7, 5), (8, 2), (9, 1)))
