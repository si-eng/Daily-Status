x = int(input('Enter first digit : '))
y = int(input('Enter second digit : '))
z = int(input('Enter third digit : '))


if (x==y or y==z or z==x ):
    print("sum is 0")
else:
    print("sum is ", x+y+z)
