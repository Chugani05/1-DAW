# *****************
# FICHO CUANDO TOCA
# *****************


def run(time: str, offset: int) -> str:
    parts = time.split(':')
    hours = int(parts[0])
    minutes = int(parts[1])

    time_in_minutes = (hours * 60) + minutes
    time_plus_offset = time_in_minutes + offset
    new_minutes = time_plus_offset % (24 * 60)
    new_hours = new_minutes // 60
    new_minutes %= 60

    final_time = f'{new_hours}:{new_minutes}'

    return final_time


if __name__ == '__main__':
    run('17:15', 240)
