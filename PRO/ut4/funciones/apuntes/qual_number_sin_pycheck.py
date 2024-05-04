def get_qual_number(n: int) -> str:
    n = str(n)[::-1]
    result = ''

    for i, digit in enumerate(n, 1):
        result += digit
        if i % 3 == 0 != len(n):
            result += ','

    return result[::-1]


if __name__ == "__main__":
    print(get_qual_number(54169847647))
