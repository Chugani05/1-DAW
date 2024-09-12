import re


def is_valid_email(email: str) -> bool:
    regex = r'(\w*(-?\w+)?)\@\w*\.\w*((\.\w*)*)?'
    return re.fullmatch(regex, email) is not None
