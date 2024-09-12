# ************
# ELLA QUÍMICA
# ************


def run(formula: list) -> bool:
    if 1 in formula and 2 in formula:
        valid = False
    elif 3 in formula and 4 in formula:
        valid = False
    elif (5 in formula and 6 not in formula) or (6 in formula and 5 not in formula):
        valid = False
    elif not (7 in formula or 8 in formula):
        valid = False
    else:
        valid = True

    return valid


if __name__ == '__main__':
    run([1, 3, 7])
