def get_vowels():
    VOWELS = 'aeiou'
    for vowel in VOWELS:
        yield vowel


for vowel in get_vowels():
    print(vowel)
