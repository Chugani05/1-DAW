# ***************
# ¿ESTÁ ORDENADO?
# ***************


def run(items: list) -> bool:
    items_sorted = True
    for curr_index in range(1, len(items)):
        prev_item = items[curr_index - 1]
        curr_index = items[curr_index]
        if curr_index < prev_item:
            items_sorted = False
            break

    # Con bucle while
    curr_index = 0
    items_sorted = True
    while items_sorted and curr_index < len(items) - 2:
        if items[curr_index] > items[curr_index + 1]:
            items_sorted = False
        curr_index += 1

    return items_sorted


if __name__ == '__main__':
    run(['a', 'f', 't'])
