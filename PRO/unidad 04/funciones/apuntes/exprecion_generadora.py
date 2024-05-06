# devuelve una lista
def gen_sq(i: int) -> list:
    return [i for i in range(0, 20) if i % 3 == 0]


if __name__ == "__main__":
    print(gen_sq(54))


# devuelve una suma de la lista
def gen_sq(i: int) -> list:
    sq = [i for i in range(0, 20) if i % 3 == 0]

    return sum(sq)


if __name__ == "__main__":
    print(gen_sq(54))
