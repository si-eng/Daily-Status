num = [2, 3, 4, 5]
intger = int(input("Enter a intger to compare: "))
print(all(x > intger for x in num))