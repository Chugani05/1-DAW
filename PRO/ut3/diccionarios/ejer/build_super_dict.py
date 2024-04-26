# ***************************
# DICCIONARIO EN CONSTRUCCIÓN
# ***************************


def run(items: list) -> dict:
    unpack_items = {}
    for sublist in items:
        unpack_items[sublist[0]] = sublist[1:]
    return unpack_items


if __name__ == '__main__':
    run(
        [
            ['Episode IV - A New Hope', 'May 25', 1977, 'George Lucas'],
            ['Episode V - The Empire Strikes Back', 'May 21', 1980],
            ['Episode VI - Return of the Jedi', 'May 25', 1983],
        ]
    )
