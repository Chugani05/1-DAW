import re


def calc(expression: str) -> int | float:
    regex = r'\s*(\d+)\s*([\+\-\*/])\s*(\d+)\s*'
    match_obj = re.match(regex, expression)

    operand1 = int(match_obj.group(1))
    operator = match_obj.group(2)
    operand2 = int(match_obj.group(3))

    match operator:
        case '+':
            result = operand1 + operand2
        case '-':
            result = operand1 - operand2
        case '*':
            result = operand1 * operand2
        case '/':
            result = operand1 / operand2
    return result
