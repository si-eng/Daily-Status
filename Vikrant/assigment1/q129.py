string = str(input("Enter a String: "))
l_zero = int(input("Enter the Leading zeros: "))

l_string = string.ljust(l_zero, '0')

print(l_string)