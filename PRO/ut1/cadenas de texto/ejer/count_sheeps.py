# ***************
# CONTANDO OVEJAS
# ***************


def run(num_sheeps: int) -> str:
    counting = 'sheep...'
    sleep = counting * num_sheeps

    return sleep


if __name__ == '__main__':
    run(0)