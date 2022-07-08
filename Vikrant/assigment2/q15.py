op1 = input("Enter any operater(+-/*) : ")
op2 = input("Enter any operater(+-/*) to compare : ")

if op1 == "/":
    a = 4
elif op1 == "*":
    a=3
elif op1 == "+":
    a=2
elif op1 == "-":
    a=1

if op2 == "/":
    b = 4
elif op2 == "*":
    b=3
elif op2 == "+":
    b=2
elif op2 == "-":
    b=1

print(a >= b)