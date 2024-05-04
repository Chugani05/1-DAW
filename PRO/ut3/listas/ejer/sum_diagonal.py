# *****************************
# SUMA DE LA DIAGONAL PRINCIPAL
# *****************************


def run(matrix: list) -> int:
    sum_diagonal = 0
    length = len(matrix)

    for row in range(length):
        for colum in range(length):
            if row == colum:
                sum_diagonal += matrix[row][colum]

    return sum_diagonal


if __name__ == '__main__':
    run([[4, 6, 1], [2, 9, 3], [1, 7, 7]])
