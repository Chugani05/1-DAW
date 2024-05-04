def mslice(window_size: int = 1):
    def helper(text: str) -> list[str]:
        text_slices = []
        for cutpos in range(0, len(text), window_size):
            slices_ = text[cutpos : cutpos + window_size]
            text_slices.append(slices_)
        return text_slices

    return helper


s3 = mslice(3)


if __name__ == "__main__":
    for slice in s3('Hay algo mal con el programa'):
        print(slice)
