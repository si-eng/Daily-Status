h = int(input("Enter the longest side : "))
b = int(input("Enter the another side : "))
s = int(input("Enter the another side : "))

if (s**2 + b**2 == h**2):
    print("Its a right angle triangle.")
else:
    print("Its not right angle triangle.")