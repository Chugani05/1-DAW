# ********************
# REORGANIZANDO FECHAS
# ********************


def run(input_date: str, base_year: int) -> str:
    date = input_date.split('/')
    day = date[0]
    month = date[1]
    year = int(date[2])

    fullyear = base_year + year

    output_date = str(f'{month}-{day}-{fullyear}')

    return output_date


if __name__ == '__main__':
    run('12/31/23', 2000)
