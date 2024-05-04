# ******************
# POBLACIÓN PROMEDIO
# ******************


def run(pdata: dict) -> dict:
    total_population = sum(pdata.values())

    relative_percentage = {
        city: (population / total_population) * 100 for city, population in pdata.items()
    }

    avg_data = {city: round(porcentage, 3) for city, porcentage in relative_percentage.items()}

    return avg_data


if __name__ == '__main__':
    run({'Tokyo': 38140000, 'Delhi': 26454000, 'Shanghai': 24484000, 'Mumbai': 21357000})
