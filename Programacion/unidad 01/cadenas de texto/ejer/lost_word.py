# ******************
# LA PALABRA PERDIDA
# ******************


def run(text: str, target_word: str, replace_word: str) -> str:
    word = text.find(target_word)
    first_part = text[:word]
    second_part = text[word + len(target_word) :]
    mtext = first_part + replace_word + second_part

    return mtext


if __name__ == '__main__':
    run('This is a beautiful night on the Atlantic', 'beautiful', 'terrible')