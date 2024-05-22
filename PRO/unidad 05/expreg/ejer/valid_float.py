import re


def is_valid_float(number: str) -> bool:
    regex = r'((\d*|-?\d+)\.(\d*|\w*)|\d*e\d*)'
    return re.fullmatch(regex, number) is not None
