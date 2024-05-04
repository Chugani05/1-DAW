import sys

values = sys.argv[1:]

values_count = 0
for num in values:
    values_count += 1

sumup = sum(values)
total = round(sumup / len(values_count), 2)
print(total)


values = [int(num) for num in sys.argv[1:]]
result = sum(values) / len(values)

print(round(result), 2)
