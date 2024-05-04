# **************
# SUMA RECORTADA
# **************


def run(values: list) -> int:
    tsum = 0
    if values:
        for num in values:
            if num == min(values) or num == max(values):
                continue
            else:
                tsum += num

    return tsum


if __name__ == '__main__':
    run([6, 2, 1, 8, 10])
