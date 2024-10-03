# *************************
# MOVIMIENTOS DE INVENTARIO
# *************************


def run(imoves: str) -> dict:
    inventory = {}

    # Dividir la cadena de texto en movimientos individuales
    moves = imoves.split(',')

    # Procesar cada movimiento
    for move in moves:
        # Extraer el artículo y la cantidad del movimiento
        item, quantity = move[0], int(move[1:])

        # Actualizar el inventario
        if item in inventory:
            inventory[item] += quantity
        else:
            inventory[item] = quantity

    return inventory


if __name__ == '__main__':
    run('A1,B4,A-2,A7,B1,C4')
