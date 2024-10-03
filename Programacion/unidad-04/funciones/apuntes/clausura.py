def mult(n: int):
    def helper(x: int) -> int:
        return n * x

    return helper


m3 = mult(3)


if __name__ == "__main__":
    print(m3(4))
