# ****************
# SUMANDO COLUMNAS
# ****************
from pathlib import Path


def run(data_path: Path) -> tuple:
    with open(data_path, 'r') as f:
        rows = []
        for line in f.readlines():
            nums = line.split()
            rows.append([int(num) for num in nums])

        columns = []
        for i in range(len(rows[0])):
            column = []
            for row in rows:
                column.append(row[i])
            columns.append(column)

        csum = []
        for column in columns:
            csum.append(sum(column))

    return tuple(csum)


if __name__ == '__main__':
    run('data/sum_cols/data1.txt')
