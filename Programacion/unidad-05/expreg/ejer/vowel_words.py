import re


def extract_vowel_words(text: str) -> list[str]:
    regex = r'\b[aeiou]\w*'
    return re.findall(regex, text, re.I)
