def is_even(values):
    return values % 2 == 0


def split_list(values):
    evens = []
    odds = []
    for value in values:
        if is_even(values):
            evens.append(value)
        else:
            odds.append(value)

    return evens, odds


if __name__ == "__main__":
    numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    print(split_list(numeros))