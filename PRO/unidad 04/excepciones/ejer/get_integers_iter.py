def getint() -> int:
    validation = False
    while not validation:
        try:
            user_value = input('Give me an integer number: ')
            result = int(user_value)
            validation = True
        except ValueError:
            print('Not a valid integer. Try it again!')
    return result


if __name__ == '__main__':
    value = getint()
    print(value)
