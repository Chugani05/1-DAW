# *********************
# ¿QUÉ ES LO SIGUIENTE?
# *********************


def run(items: list, ref_item: object) -> object:
    index = items.index(ref_item)
    target_index = index + 1

    if target_index < len(items):
        target_item = items[target_index]
    else:
        target_item = None

    return target_item


if __name__ == '__main__':
    run([1, 2, 3, 4, 5, 6, 7], 3)
