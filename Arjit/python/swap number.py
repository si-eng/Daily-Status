from re import X
from tkinter import Y


A = int(input("Enter the value of X : "))

B = int(input("Enter the value of y : "))

#A,B = B,A   Without declaring third variable

temp = A
A = B
B = temp

print("The value of x : ", A)

print("The value of y : ", B)

