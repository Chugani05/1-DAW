# ********************************
# ENUMERANDO ELEMENTOS MODO HUMANO
# ********************************


def run(items: str) -> str:
    # Mi código
    enum_items = []

    spliting_items = items.split(':')
    replacing_items = ', '.join(spliting_items)
    reversing_items = replacing_items[::-1]
    replacing_items2 = reversing_items.replace(' ,', ' dna ', 1)
    enum_items = replacing_items2[::-1]

    # Otra forma
    sp_items = items.split(':')
    rest_items = sp_items[:-1]
    last_item = sp_items[-1]
    if len(sp_items) == 1:
        enum_items = last_item
    else:
        enum_items = ', '.join(rest_items) + ' and ' + last_item

    return enum_items


if __name__ == '__main__':
    run('apples')
