def mslice(window_size: int = 1):
    def helper(text: str) -> list[str]:
        for cutpos in range(0, len(text), window_size):
            yield text[cutpos : cutpos + window_size]

    return helper


s3 = mslice(3)

if __name__ == "__main__":
    for slice in s3('Hay algo mal con el programa'):
        print(slice)
