# *******************************
# ADIVINANDO PERSONAJES DE MARVEL
# *******************************


def run(can_fly: bool, is_human: bool, has_mask: bool) -> str:
    if can_fly:
        if is_human:
            if has_mask:
                character = 'Ironman'
            else:
                character = 'Captain Marvel'
    if can_fly:
        if not is_human:
            if has_mask:
                character = 'Ronan Accuser'
            else:
                character = 'Vision'
    if not can_fly:
        if is_human:
            if has_mask:
                character = 'Spiderman'
            else:
                character = 'Hulk'
    if not can_fly:
        if not is_human:
            if not has_mask:
                character = 'Thanos'
            else:
                character = 'Black Bolt'

    return character


if __name__ == '__main__':
    run(True, True, True)