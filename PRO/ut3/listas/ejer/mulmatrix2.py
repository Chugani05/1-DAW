# *****************************
# MULTIPLICANDO MATRICES DE 2X2
# *****************************


def run(A: list, B: list) -> list:
    num1 = A[0][0] * B[0][0] + A[0][1] * B[1][0]
    num2 = A[0][0] * B[0][1] + A[0][1] * B[1][1]
    num3 = A[1][0] * B[0][0] + A[1][1] * B[1][0]
    num4 = A[1][0] * B[0][1] + A[1][1] * B[1][1]

    P = [[num1, num2], [num3, num4]]

    return P


if __name__ == '__main__':
    run([[6, 4], [8, 9]], [[3, 2], [1, 7]])
