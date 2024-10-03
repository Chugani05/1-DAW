# **********************
# POSTES EN LA CARRETERA
# **********************


def run(num_pillars: int, gap_pillars: float, pillar_width: float) -> float:
    total_gap = gap_pillars * 100 * (num_pillars - 1)
    total_with = (num_pillars - 2) * pillar_width
    inter_distance = total_gap + total_with

    return inter_distance


if __name__ == '__main__':
    run(10, 5, 30)