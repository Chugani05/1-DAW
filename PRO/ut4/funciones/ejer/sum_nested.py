# ***********************
# SUMANDO CON ANIDAMIENTO
# ***********************


def sum_nested(items: list) -> int:
    total_sum = 0
    for item in items:
        if isinstance(item, list):
            total_sum += sum_nested(item)
        else:
            total_sum += item
    return total_sum
