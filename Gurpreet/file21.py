#21 Write a Python program to find whether a given number (accept from the user) is even or odd, print out an appropriate message to the user.

num = int(input("Enter the number: "))
mod = num % 2
if mod > 0:
    print("this is odd number")
else:
    print("this is even number")
    