# ***********
# ¿HAY STOCK?
# ***********


def run(stock: dict, merch: str, amount: int) -> bool:
    if merch in stock and stock[merch] >= amount:
        available = True
    else:
        available = False

    return available


if __name__ == '__main__':
    run({'pen': 20, 'cup': 11, 'keyring': 40}, 'cup', 9)
