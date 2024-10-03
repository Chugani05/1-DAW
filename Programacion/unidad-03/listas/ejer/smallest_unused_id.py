# *****************
# MENOR ID SIN USAR
# *****************


def run(ids: list) -> int:
    ids = sorted(ids)
    smallest_unused_id = 1

    for id in ids:
        if smallest_unused_id == id:
            smallest_unused_id += 1
        else:
            break

    return smallest_unused_id


if __name__ == '__main__':
    run([3, 1, 8, 4, 9])
