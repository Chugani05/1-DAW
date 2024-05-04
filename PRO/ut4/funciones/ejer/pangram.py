# ********
# PANGRAMA
# ********


ALPHABET = "abcdefghijklmnopqrstuvwxyz"
ALPHABET_LENGHT = 26


def is_pangram(text: str) -> bool:
    text = text.lower()
    letters = set(text)
    letters = {l for l in letters if l in ALPHABET}
    return len(letters) == ALPHABET_LENGHT
