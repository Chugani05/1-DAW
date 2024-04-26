# ***************
# APLANA LA LISTA
# ***************


def run(elements: list) -> list:
    flatten_elements = []

    for item in elements:
        if isinstance(item, list):
            flatten_elements.extend(item)
        else:
            flatten_elements.append(item)

    return flatten_elements


if __name__ == '__main__':
    run([0, 10, [20, 30], 40, 50, [60, 70, 80], [90, 100, 110, 120]])
