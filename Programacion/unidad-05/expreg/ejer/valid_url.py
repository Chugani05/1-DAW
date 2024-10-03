import re


def is_valid_url(url: str) -> bool:
    #    otro_regex = r'https?://(\w*\.\w*|\w*\.\w*\.\w*\.\w*|\w*\.\w*\.\w*\.\w*/\w*|\w*\.\w*\.\w*\.\w*/\w*/|\w*\.\w*\.\w*\.\w*/\w*/\w*|\w*\.\w*\.\w*\.\w*/\w*/\w*/\w*|\w*\.\w*\.\w*\.\w*/\w*/\w*\.\w*)'
    regex = r'https?://\w*(\.\w*)+(/\w*)*(\w*\.\w*)?'
    return re.fullmatch(regex, url) is not None
