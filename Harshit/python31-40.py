############Q31############
# import math
# a= int(input("Enter first number = "))
# b= int(input("Enter second number = "))
# print("The gcd of 336 and 360 is : ", end="")
# print(math.gcd(a,b)
############Q32############
# a=int(input("enter first"))
# b=int(input("enter second"))
# maxnum=max(a,b)
# while(True):
#     if (maxnum % a == 0 and maxnum % b ==0):
#         break
#     maxnum+=1
# print(maxnum)
############Q33############
# def sum_three(x, y, z):
#     if x == y or y == z or x==z:
#         sum = 0
#     else:
#         sum = x + y + z
#     return sum
# print(sum_three(2, 1, 2))
# print(sum_three(3, 2,5 ))



############Q34############
# def sum(x, y):
#     sum = x + y
#     if sum in range(15, 20):
#         return 20
#     else:
#         return sum

# print(sum(10, 6))
# print(sum(10, 2))
# print(sum(10, 12))

############Q35############
# def test_number5(x, y):
#        if x == y or abs(x-y) == 5 or (x+y) == 5:
#        return True
#    else:
#        return False
# print(test_number5(7, 2))
# print(test_number5(2, 2))
# print(test_number5(7, 3))


############Q36############
# def add_numbers(a, b):
#          if not (isinstance(a, int) and isinstance(b, int)):
#             return "Inputs must be integers!"
#         return a + b
# print(add_numbers(10, 20))
# print(add_numbers(10, 20.23))
# print(add_numbers('5', 6))
# print(add_numbers('5', '6'))

############Q37############
# name= input("user input name= ")
# address = input("user input address= ")
# age= int(input("user input address= "))
# print("Name: {}\nAge: {}\nAddress: {}".format(name, age, address))


############Q38############
# 38. Write a Python program to solve (x + y) * (x + y).
# x= int(input("USER INPUT VALUE1: "))
# y= int(input("USER INPUT VALUE2: "))
# result = x * x + 2 * x * y + y * y
# print(result)
############Q39############
# p= 1200   
# t= 2      
# r= 5.4   
# # calculates compound interest
# a=p*(1+(r/100))**t  # formula for calculating amount
# ci=a-p  
# print(ci)

############Q40############

# x1=int(input("enter x1 : "))
# x2=int(input("enter x2 : "))
# y1=int(input("enter y1 : "))
# y2=int(input("enter y2 : "))
# result= ((((x2 - x1 )**2) + ((y2-y1)**2) )**0.5)
# print("distance between",(x1,x2),"and",(y1,y2),"is : ",result)
