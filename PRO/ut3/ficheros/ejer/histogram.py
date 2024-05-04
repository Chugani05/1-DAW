# **********
# HISTOGRAMA
# **********
import filecmp
from pathlib import Path


def run(data_path: Path) -> bool:
    histogram_path = 'data/histogram/histogram.txt'
    # TU CÓDIGO AQUÍ

    return filecmp.cmp(histogram_path, 'data/histogram/.expected', shallow=False)


if __name__ == '__main__':
    run('data/histogram/data.txt')