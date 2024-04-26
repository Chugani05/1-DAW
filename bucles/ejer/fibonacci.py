a = 0
print(a)
b = 1
print(b)

for _ in range(2, 100):
    c = a + b
    a = b
    b = c
    print(c)
