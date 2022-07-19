# 1. Write a Python function that takes a sequence of numbers and determines whether all the numbers are different from each other.
# def nandan(list):
#   if len(list) == len(set(list)):
#     return True
#   else:
#     return False;
# print(nandan([1,5,7,9]))
# print(nandan([2,4,5,5,7,9]))

# 19. Write a Python program to find the value of n where n nandan of number 2 are written sequentially in a line without spaces.
# def nandan(num):
#   ans = True
#   n, tempn, i = 2, 2, 2
#   while ans:
#     if str(tempn) in num:
#       i += 1
#       tempn = pow(n, i)
#     else:
#       ans = False
#   return i-1;
# print(nandan("2481632"))
# print(nandan("248163264128"))

# # 20. Write a Python program to find the number of zeros at the end of a factorial of a given positive number.
# def factendzero(n):
#   x = n // 5
#   y = x 
#   while x > 0:
#     x /= 5
#     y += int(x)
#   return y
       
# print(factendzero(5))
# print(factendzero(12))
# print(factendzero(100))