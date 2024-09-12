country = input('What countrys flag do you want to see?: ')

match country:
    case 'Italia':
        flag = '🇮🇹'
    case 'España':
        flag = '🇪🇸'
    case 'America':
        flag = '🇺🇸'
    case 'Alemania':
        flag = '🇩🇪 '
    case 'Reino Unido':
        flag = '🇬🇧'
    case 'Francia':
        flag = '🇫🇷'
    case 'China':
        flag = '🇨🇳'
    case 'Japón':
        flag = '🇯🇵'
    case 'Korea del Sur':
        flag = '🇰🇷'
    case 'Rusia':
        flag = '🇷🇺'
    case _:
        flag = 'We coudnt find the flag'

print(flag)

