# ***********************************
# POR ENCIMA Y POR DEBAJO DE LA MEDIA
# ***********************************


def run(marks: list) -> tuple:
    # Mi código
    below_avg = []
    above_avg = []

    avg = sum(marks) / len(marks)

    for mark in marks:
        if mark <= avg:
            below_avg.append(mark)
        else:
            above_avg.append(mark)

    # Con listas por compreción
    avg = sum(marks) / len(marks)
    below_avg = [m for m in mark if m < avg]
    above_avg = [m for m in marks if m >= avg]

    return below_avg, above_avg


if __name__ == '__main__':
    run([3.7, 1.2, 9.5, 4.7, 6.3, 7.2, 3.8, 1.1, 1.4])
