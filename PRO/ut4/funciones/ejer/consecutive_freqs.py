# ************************************
# FRECUENCIA DE ELEMENTOS CONSECUTIVOS
# ************************************


def cfreq_as_list(items):
    result = []
    if items:
        target_value = items[0]
        freq = 0
        for item in items:
            if item != target_value:
                result.append((target_value, freq))
                freq = 1
                target_value = item
            else:
                freq += 1
        result.append((target_value, freq))
    return result


def cfreq(items, as_string=False):
    result = cfreq_as_list(items)
    if as_string:
        result = ",".join(f"{num}:{freq}" for num, freq in result)
    return result
