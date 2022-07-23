from math import sqrt

b = float(input("Enter base length : "))
p = float(input("Enter perpendcular length : "))

h = sqrt( b**2 + p**2 )

print("hypotenuse of a right angled triangle is: ", h)
