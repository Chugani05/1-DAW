# **********************
# ANIMALES SUPER RÁPIDOS
# **********************


def run(speed_km_h: float) -> float:
    # TU CÓDIGO AQUÍ
    speed_cm_s = int(speed_km_h * 100000 / 3600)

    return speed_cm_s


if __name__ == '__main__':
    run(1.08)