# **********************
# MULTIPLICANDO MATRICES
# **********************


def run(A: list, B: list) -> list:
    if len(A[0]) != len(B):
        P = None
    else:
        P = [[0 for _ in range(len(B[0]))] for _ in range(len(A))]
        for rowA_index in range(len(A)):
            for rowB_index in range(len(B[0])):
                for rowAB_index in range(len(B)):
                    P[rowA_index][rowB_index] += (
                        A[rowA_index][rowAB_index] * B[rowAB_index][rowB_index]
                    )

    return P


if __name__ == '__main__':
    run([[1, 2, 3], [4, 5, 6]], [[5, -1], [1, 0], [-2, 3]])
