# ********************
# CUBOIDES Y VOLÚMENES
# ********************


def run(cuboid1: list, cuboid2: list) -> float:
    volume1 = cuboid1[0] * cuboid1[1] * cuboid1[2]
    volume2 = cuboid2[0] * cuboid2[1] * cuboid2[2]

    vol_diff = abs(volume1 - volume2)

    return vol_diff


if __name__ == '__main__':
    run([2, 2, 3], [5, 4, 1])
