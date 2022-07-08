# x = input('Enter first digit : ')
# y = input('Enter second digit : ')

# x1 = isinstance(x, int)
# y1 = isinstance(y, int)
# print(x1)
# print(y1)
# if (isinstance(x, int) or isinstance(y, int)):
#     print("sum is ", x+y)

# else:
#     print("Enter a intergers to add.")

def add_numbers(a, b):
   if not (isinstance(a, int) and isinstance(b, int)):
       return "Inputs must be integers!"
   return a + b

print(add_numbers(5,4))
print(add_numbers(5,4.5))
    
