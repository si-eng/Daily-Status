#####################CODE11#######################
# Write a Python program that accepts an integer (n) and computes the value of n+nn+nnn.
# # Line 1 - It displays 'Input the integer:" and stores the input in variable a.
# a = int(input("Input an integer : ")) 
# # Line 2 - n1 stores the value of variable a.
# n1 = int( "%s" % a )
# #   Line 3- n2 stores the value of variable 'aa' as integer.
# # Line 4 - n3 stores the value of variable 'aaa' as integer.
# # Line 5 - It adds the values present in n1, n2, n3 and prints it.
# n2 = int( "%s%s" % (a,a) )
# n3 = int( "%s%s%s" % (a,a,a) )
# print (n1+n2+n3)

# # Here %s is the formatting string which is replaced by the value present at the end after % sign

#####################CODE12#######################
# Write a Python program to print the documents (syntax, description etc.) of Python built-in function(s).
# # Sample function:
# print(abs.__doc__)

#####################CODE13#######################
#  12. Write a Python program to print the calendar of a given month and year.
# import calendar 
# year = int(input ("enter year = "))
# month = int(input("enter month = "))
# print(calendar.month(year,month))

#####################CODE14#######################

# # Python3 program to find number of days
# # between two given dates
# from datetime import date
 
# def numOfDays(date1, date2):
#     return (date2-date1).days
# date1 = date(2014, 7, 2)
# date2 = date(2014, 7, 11)
# print(numOfDays(date1, date2), "days")

#####################CODE15#######################

# R =  int(input("radius of sphere: "))
# # py = float(22/7)

# # V = float(4.0/3.0*py*R*R)
# # print("volume of sphere: ",V)   


#####################CODE16#######################
# 16. Write a Python program to get the difference between a given number and 17, if the number is greater than 17 return double the absolute difference
# numb = int(input("ptint the vavle: "))
# if(numb<=17):
#    b = (numb - 17)
#    print(b)
# elif( numb>17):
#     a = ((numb - 17)*2)
#     print(a)
    
#####################CODE17#######################
# numb = int(input("Enter a no. "))

# if (numb >= 900 and numb <= 1100):
#     print("Given is within 100 of 1000 ")
# elif ( numb >= 1900 and numb <= 2100):
#     print("Given is within 100 of 2000 ")
# else:
#     print("Given is not within 100 of 1000 or 2000 ")


#####################CODE18#######################
# n1 = int(input("value 1 : "))
# n2 = int(input("value 2 : "))
# n3 = int(input("value 3 : "))

# if(n1==n2==n3):
#     sm = (n1+n2+n3)*3
#     print("the output",sm)
# else:
#     sm2 =n1+n2+n3
#     print("output: ",sm2)

#####################CODE19#######################
# # 19.Write a Python program to get a new string from a given string where "Is" has been added to the front. If the given string already begins with "Is" then return the string unchanged.
# def new_string(str):
#     if len(str) >= 2 and str[:2] == "Is":
#      return str
#      return "Is" + str
# print(new_string("Array list tuples"))
# print(new_string(" "))
   

#####################CODE20#######################
