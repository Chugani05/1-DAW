# **********
# ONLY WORDS
# **********


def run(items: list) -> int:
    #
    sum_words = 0
    for item in items:
        if isinstance(item, str):
            sum_words += len(item)

    # Por listas por compreción
    sum_words = sum([len(item) for item in items if isinstance(item, str)])

    #
    lengths = []
    for item in items:
        if isinstance(item, str):
            lengths.append(item)
    sum_words = sum(lengths)

    return sum_words


if __name__ == '__main__':
    run([99, 'x', 3, 5, 'hello', 'banana', 4])
