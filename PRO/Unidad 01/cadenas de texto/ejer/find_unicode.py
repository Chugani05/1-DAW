# ********************
# ENCUENTRE EL UNICODE
# ********************


def run(source_char: str, offset: int) -> str:
    char_value = ord(source_char)
    target_char = chr(char_value + offset)

    return target_char


if __name__ == '__main__':
    run('δ', -2)