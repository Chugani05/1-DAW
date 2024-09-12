animales = ['mariosa, león, tigre, elefante, delfin']

# con funcion lambda
sorted(animales, key=lambda n: len(n))


# definiendo una funcion
def len_word(word: str) -> int:
    return len(word)


sorted(animales, key=len_word)
