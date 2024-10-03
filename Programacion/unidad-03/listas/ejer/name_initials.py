# **********************
# INICIALES DE UN NOMBRE
# **********************


def run(fullname: str) -> str:
    new_fullname = fullname.split(",")
    name = new_fullname[1]
    surname = new_fullname[0]

    new_surname = surname.split(" ")
    first_surname = "".join(new_surname[0])
    second_surname = "".join(new_surname[1])

    initials = f"{name[0].upper()}.{first_surname[0].upper()}.{second_surname[0].upper()}."

    return initials


if __name__ == '__main__':
    run('Delgado Quintero, sergio')
