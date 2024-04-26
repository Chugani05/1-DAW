age = int(input('ingresar edad: '))
weight = int(input('ingresar peso: '))
heartbeat = int(input('ingresar pulso: '))
platelets = int(input('ingresar plaquetas: '))

match age:
    case n if n > 18 and n < 65:
        print('appropriate age')
    case _:
        print('not appropriate age')

match weight:
    case n if n > 50:
        print('appropriate weight')
    case _:
        print('not appropriate weight')

match heartbeat:
    case n if n > 50 and n < 110:
        print('appropriate heartbeat')
    case _:
        print('not appropriate heartbeat')

match platelets:
    case n if n < 150.000:
        print('appropriate platelets')
    case _:
        print('not appropriate platelets')