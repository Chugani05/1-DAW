# ****************
# SUMA HETEROGÉNEA
# ****************


def run(items: list) -> int:
    sum_items = sum(int(item) for item in items)

    return sum_items


if __name__ == '__main__':
    run([1, '2', 3, '4', 5])
