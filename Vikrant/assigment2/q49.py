a = float(input("Enter the side of parallelogram: "))
b = float(input("Enter the another side of parallelogram: "))
c = float(input("Enter dignol of parallelogram: "))

if c**2 == a**2+b**2 :
    print("This is a rectangle.")
elif a == b:
    print("This is a rhombus.")
else:
    print("not a rectangel or rhombus.")