# *******************
# HEXADECIMAL A TEXTO
# *******************


def run(hex_codes: list) -> str:
    text = ''
    for hex_code in hex_codes:
        code = int(hex_code, 16)
        char = chr(code)
        text += char

    #
    buffer = []
    for hex_code in hex_codes:
        code = int(hex_code, 16)
        char = chr(code)
        buffer.append(char)
    text = ''.join(buffer)

    return text


if __name__ == '__main__':
    run(['1f49a', '2728', '1f389', '1f3c6'])
