# ****************
# TROCEADO EXTREMO
# ****************


def run(numbers: str) -> str:
    stripped_numbers = numbers.split(',')
    if len(stripped_numbers) <= 2:
        strip_numbers = ''
    else:
        strip_numbers = ' '.join(stripped_numbers[1:-1])

    return strip_numbers


if __name__ == '__main__':
    run('1,2,3')
