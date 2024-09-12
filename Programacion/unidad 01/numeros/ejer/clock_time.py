# *********************
# CONTANDO MILISEGUNDOS
# *********************


def run(hours: int, minutes: int, seconds: int) -> float:
    milli_seconds_hours = hours * 60 * 60 * 1000
    milli_seconds_minutes = minutes * 60 * 1000
    milli_seconds_seconds = seconds * 1000
    time_since_midnight = milli_seconds_hours + milli_seconds_minutes + milli_seconds_seconds

    return time_since_midnight


if __name__ == '__main__':
    run(0, 1, 1)