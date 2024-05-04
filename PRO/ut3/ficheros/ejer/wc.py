# ****************
# CONTANDO COMO WC
# ****************
from pathlib import Path


def run(input_path: Path) -> tuple:
    num_lines = 0
    num_words = 0
    num_bytes = 0

    f = open(input_path, 'r')
    for line in f:
        num_lines += 1
        num_words += len(line.strip().split())
        num_bytes += len(line.encode('utf-8'))
    f.close()

    return num_lines, num_words, num_bytes


if __name__ == '__main__':
    run('data/wc/lorem.txt')
