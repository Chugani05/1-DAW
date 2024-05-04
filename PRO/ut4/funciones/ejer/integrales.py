def func(x):
    y = x**2
    return y


def calc_rect_area(base, height):
    area = base * height
    return area


def frange(start, end, step=1):
    result = []
    current = start

    while current <= end:
        result.append(current)
        current += step
    return result


def integral(start, end, step):
    intervals = frange(start, end, step)
    total_area = 0.0
    for i in intervals:
        h = func(i)
        total_area += calc_rect_area(step, h)
    return total_area


if __name__ == "__main__":
    print(integral(0, 10, 0.01))