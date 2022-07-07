# 16. Write a Python program to get the difference between a given number and 17,
# if the number is greater than 17 return double the absolute difference.

x = int(input("Enter the number: "))
if x <= 17:
    print(17-x)
else:
    print((x - 17) * 2)


