# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    text = text.replace(" ", "").lower()
    return text == text[::-1]
