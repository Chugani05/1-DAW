num_1 = int(input('incerta el primer valor: '))
num_2 = int(input('incerta el segundo valor: '))
num_3 = int(input('incerta el tercer valor: '))

if num_1 < num_2 < num_3:
    min_num = num_1
elif num_1 < num_3 < num_2:
    min_num = num_1
elif num_2 < num_3 < num_1:
    min_num = num_2
elif num_2 < num_1 < num_3:
    min_num = num_2
else:
    min_num = num_3

print(min_num)