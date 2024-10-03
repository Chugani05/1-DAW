def getint() -> int:
    try:
        user_value = input('Give me an integer number: ')
        result = int(user_value)
    except ValueError:
        print('Not a valid integer. Try it again!')
        return getint()
    return result


if __name__ == '__main__':
    value = getint()
    print(value)
