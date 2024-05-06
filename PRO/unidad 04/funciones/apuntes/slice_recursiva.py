def rslice(text: str, window: int) -> list[str]:
    if len(text) == 0:
        return []
    return [text[0:window]] + rslice(text[window:], window)


if __name__ == "__main__":
    print(rslice('Hay algo mal con el programa', 4))
