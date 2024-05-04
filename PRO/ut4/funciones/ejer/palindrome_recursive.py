# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    if not text:
        return True
    text = text.replace(" ", "").lower()
    if text[0] != text[-1]:
        return False
    return is_palindrome(text[1:-1])
