# ********************
# LEYENDO FICHEROS CSV
# ********************
from pathlib import Path


def run(datafile: Path) -> list:
    data = []
    with open(datafile, 'r') as f:
        lines = f.readline().strip().split(',')
        for line in f:
            values = line.strip().split(',')
            row = {}
            for key, value in zip(lines, values):
                if value.lower() == 'true':
                    row[key] = True
                elif value.lower() == 'false':
                    row[key] = False
                elif value.isdigit():
                    row[key] = int(value)
                elif value == '':
                    row[key] = None
                else:
                    row[key] = value
            data.append(row)
    return data


if __name__ == '__main__':
    run('data/read_csv/pokemon.csv')
