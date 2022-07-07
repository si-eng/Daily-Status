#1."Twinkle, twinkle,..... little star",
#print("Twinkle, twinkle, little star, \n\tHow I wonder what you are! \n\t\tUp above the world so high, \n\t\tLike a diamond in the sky. \nTwinkle, twinkle, little star, \n\tHow I wonder what you are!")

#2.Write a Python program to get the Python version you are using
#import sys
#print(sys.version)

#3. Write a Python program to display the current date and time.
# import datetime
# n=datetime.datetime.now()
# print(n)

#4.  Write a Python program which accepts the radius of a circle from the user and compute the area.
# n=float(input("enter the value= "))
# a=3.14*(n*n)
# print(a)

#5. Write a Python program which accepts the user's first and last name and print them in reverse order with a space between them.
# a=("Anu")
# b=("Radha")
# print (b, " ", a)

#6. Write a Python program which accepts a sequence of comma-separated numbers from user and generate a list and a tuple with those numbers.
# v = input("enter numbers" )
# list = v.split(",")
# tuple = tuple(list)
# print('List :',list)

#7 Write a Python program to accept a filename from the user and print the extension of that.
# x="my.nb"
# y=x.split(".")
# print(y[-1])

# 8. Write a Python program to display the first and last colors from the following list.
# color_list = ["Red","Green","White" ,"Black"]
# print (color_list[0],color_list[3])

# 9. Write a Python program to display the examination schedule. (extract the date from exam_st_date)
# a = (11, 12, 2014)
# print ("date: %i / %i / %i"%a)

# 10. Write a Python program that accepts an integer (n) and computes the value of n+nn+nnn.
# a = int(input("Input an integer : "))
# n1 = int( "%s" % a )
# n2 = int( "%s%s" % (a,a) )
# n3 = int( "%s%s%s" % (a,a,a) )
# print (n1+n2+n3)

# 11. Write a Python program to print the documents (syntax, description etc.) of Python built-in function(s).
# print(abs.__doc__)

# 12. Write a Python program to print the calendar of a given month and year.
# import calendar
# y = int(input("input the year :"))
# m = int (input("intput the month :"))
# print(calendar.month(y,m))

# 13. Write a Python program to print the following 'here document'. 
# Sample string :
# a string that you "don't" have to escape
# This
# is a ....... multi-line
# heredoc string --------> example

# print("""
# Sample string :
# a string that you "don't" have to escape
# This
# is a ....... multi-line
# heredoc string --------> example""")

# 14. Write a Python program to calculate number of days between two dates.
# Sample dates : (2014, 7, 2), (2014, 7, 11)
#Expected output : 9 days

# from datetime import date
# a= date(2014, 7, 2)
# b= date(2014, 7, 11)
# y= a-b
# print(y.days)

#15. Write a Python program to get the volume of a sphere with radius 6.
# pi = 3.1415926535897931
# r= 6.0
# V= 4.0/3.0*pi* r**3
# print('The volume of the sphere is: ',V)

#16. Write a Python program to get the difference between a given number and 17, if the number is greater than 17 return double the absolute difference.
# def difference(n):
#    if n <= 17:
#      return 17 - n
#    else:
#       return (n - 17) * 2 

# print(difference(23))
# print(difference(13))

#17. Write a Python program to test whether a number is within 100 of 1000 or 2000.

# def near_thousand(n):
#       return ((abs(1000 - n) <= 100) or (abs(2000 - n) <= 100))
# print(near_thousand(1000))
# print(near_thousand(900))
# print(near_thousand(800))   
# print(near_thousand(2200))

# 18.program to calculate the sum of three given numbers, if the values are equal then return three times of their sum.
# a=4
# b=4
# c=4
# if a==b==c:
#     print(int(a+b+c)*3)
# else:
#     print(a+b+c)

# 19.program to get a new string from a given string where "Is" has been added to the front. If the given string already begins with "Is" then return the string unchanged
# def new_string(str):
#   if len(str) >= 2 and str[:2] == "Is":
#     return str
#   return "Is" + str

# print(new_string("Isnew"))
# print(new_string("IsOld"))

#20.program to get a string which is n (non-negative integer) copies of a given string
# def myint(str,n):
#      result = ""
#      for i in range(n):
#         result= result+str
#      return result
# print(myint("Anu",2))
# print(myint("Radha",3))

#21.program to find whether a given number (accept from the user) is even or odd, print out an appropriate message to the user
#  n=int(input("enter number"))
#  if n%2 == 0:
#      print("Even number")
#  else:
#      print("Odd")

#22. program to count the number 4 in a given list.
# def myfunc(num):
#     count=0
#     for i in num:
#         if i == 4:
#             count=count+1
#     return count
# print(myfunc([1,4,2,3,5,6,4,4]))


# 23.

# 24.program to test whether a passed letter is a vowel or not
#  n=input("enter Value")
#  list=['a','e','i','o','u']
#  if n in list:
#     print("yes it is a vowel")
#  else:
#     print("no it is not a vowel")

#25 Write a Python program to check whether a specified value is contained in a group of values.
# def is_group_member(group_data, n):
#    for value in group_data:
#        if n == value:
#            return True
#    return False
# print(is_group_member([1, 5, 8, 3], 3))
# print(is_group_member([5, 8, 3], -1))

#26 Write a Python program to create a histogram from a given list of integers.
# def histogram( items ):
#     for n in items:
#         output = ''
#         times = n
#         while( times > 0 ):
#           output += '*'
#           times = times - 1
#         print(output)
# histogram([2, 7, 5, 6])

#27 Write a Python program to concatenate all elements in a list into a string and return it
# def concatenate_list_data(list):
#     result= ''
#     for element in list:
#         result += str(element)
#     return result
# print(concatenate_list_data([4, 5, 12, 6]))

#28 Write a Python program to print all even numbers from a given numbers list in the same order and stop the printing if any numbers that come after 237 in the sequence
# numbers = [
    # 386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345,
    # 399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217,
    # 815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717,
    # 958,743, 527
    # ]
    #
# numbers = [
#     386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345,
#     399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217,
#     815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717,
#     958,743, 527
#     ]
# for x in numbers:
#     if x == 237:
#         print(x)
#         break;
#     elif x % 2 == 0:
#         print(x)

#29 Write a Python program to print out a set containing all the colors from color_list_1 which are not present in color_list_2
# color_list_1 = set(["White", "Black", "Red"])
# color_list_2 = set(["Red", "Green"])
# color_list_1 = set(["White", "Black", "Red"])
# color_list_2 = set(["Red", "Green"])
# print("Original set elements:")
# print(color_list_1)
# print(color_list_2)
# print("\nDifferenct of color_list_1 and color_list_2:")
# print(color_list_1.difference(color_list_2))
# print("\nDifferenct of color_list_2 and color_list_1:")
# print(color_list_2.difference(color_list_1))

#30 Write a Python program that will accept the base and height of a triangle and compute the area.
# b = int(input("Input the base : "))
# h = int(input("Input the height : "))
# area = b*h/2
# print("area = ", area)

#33 Write a Python program to sum of three given integers. However, if two values are equal sum will be zero
# def sum_three(x, y, z):
#     if x == y or y == z or x==z:
#         sum = 0
#     else:
#         sum = x + y + z
#     return sum
# print(sum_three(2, 1, 2))
# print(sum_three(3, 2, 2))
# print(sum_three(2, 2, 2))
# print(sum_three(1, 2, 3))

#34 Write a Python program to sum of two given integers. However, if the sum is between 15 to 20 it will return 20.
# def sum(x, y):
#     sum = x + y
#     if sum in range(15, 20):
#         return 20
#     else:
#         return sum
# print(sum(10, 6))
# print(sum(10, 2))
# print(sum(10, 12))

#37 Write a Python program to display your details like name, age, address in three different lines
# def personal_details():
#     name, age = "Anu", 25
#     address = "Mohali, Chandigarh, India"
#     print("Name: {}\nAge: {}\nAddress: {}".format(name, age, address))
# personal_details()
# Write a Python program to solve (x + y) * (x + y).
# x= int(input("User Input Value1: "))
# y= int(input("User Input Value2: "))
# result = x * x + 2 * x * y + y * y
# print(result)

#39 Write a Python program to compute the future value of a specified principal amount, rate of interest, and a number of years
#  amt = 10000, int = 3.5, years = 7
# amt = 10000
# int = 3.5
# years = 7
# future_value = amt*((1+(0.01*int)) ** years)
# print(round(future_value,2))

#48 Write a Python program to parse a string to Float or Integer.
# n = "348.3458"
# print(float(n))
# print(int(float(n)))

#50 Write a Python program to print without newline or space.
# for i in range(0, 10):
#     print('*', end="")
# print("\n")

#51. Write a Python program to determine profiling of Python programs.

#52.


#53. Write a python program to access environment variables.
# import os
# Access all environment variables
# print('*----------------------------------*')
# print(os.environ)
# print('*----------------------------------*')
# # Access a particular environment variable
# print(os.environ['HOME'])
# print('*----------------------------------*')
# print(os.environ['PATH'])
# print('*----------------------------------*')

# 54. Write a Python program to get the current username
# import getpass
# print(getpass.getuser())

#55

#56

#57

# 58. Write a Python program to sum of the first n positive integers
# n = int(input("Input a number: "))
# sum_num = (n * (n + 1)) / 2
# print("Sum of the first", n ,"positive integers:", sum_num)

# 59. Write a Python program to convert height (in feet and inches) to centimeters.
# print("Input Your Height: ")
# h_ft = int(input("Feet: "))
# h_inch = int(input("Inches: "))
# h_inch += h_ft * 12
# h_cm = round(h_inch * 2.54, 1)
# print("Your height is : %d cm." % h_cm)

# 60. Write a Python program to calculate the hypotenuse of a right angled triangle.
# from math import sqrt
# print("Input lengths of shorter triangle sides:")
# a = float(input("a: "))
# b = float(input("b: "))
# c = sqrt(a**2 + b**2)
# print("The length of the hypotenuse is:", c )

# 61. Write a Python program to convert the distance (in feet) to inches, yards, and miles.
# d_ft = int(input("Input distance in feet: "))
# d_inches = d_ft * 12
# d_yards = d_ft / 3.0
# d_miles = d_ft / 5280.0
# print( d_inches)
# print(d_yards)
# print( d_miles)

# 62. Write a Python program to convert all units of time into seconds.
# days = int(input("Input days: ")) * 3600 * 24
# hours = int(input("Input hours: ")) * 3600
# minutes = int(input("Input minutes: ")) * 60
# seconds = int(input("Input seconds: "))
# time = days + hours + minutes + seconds
# print("The  amounts of seconds", time)

#63
#64
#65

# 66.Write a Python program to calculate body mass index.
# height = float(input("Input your height in Feet: "))
# weight = float(input("Input your weight in Kilogram: "))
# print("Your body mass index is: ", weight / (height/100)**2  )

#67
#68

# 69.Write a Python program to sort three integers without using conditional statements and loops.
# x = int(input("Input first number: "))
# y = int(input("Input second number: "))
# z = int(input("Input third number: "))
# a = min(x, y, z)
# c = max(x, y, z)
# b = (x + y + z) - a - c     
# print("Numbers in sorted order: ", a, c, b)

#70
#71

# 72. Write a Python program to get the details of math module.
# Imports the math module
# import math
# Sets everything to a list of math module
# math_ls = dir(math) 
# print(math_ls)

# 73. Write a Python program to calculate midpoints of a line.
# print('\nCalculate the midpoint of a line :')
# x1 = float(input('The value of x (the first endpoint) '))
# y1 = float(input('The value of y (the first endpoint) '))
# x2 = float(input('The value of x (the first endpoint) '))
# y2 = float(input('The value of y (the first endpoint) '))
# x_m_point = (x1 + x2)/2
# y_m_point = (y1 + y2)/2
# print();
# print("The midpoint of line is :")
# print( "The midpoint's x value is: ",x_m_point)
# print( "The midpoint's y value is: ",y_m_point)
# print();

#74

# 75. Write a Python program to get the copyright information and write Copyright information in Python code.
# import sys
# print("\nPython Copyright Information")
# print(sys.copyright)
# print()

# 76 
# 77
#78
#79

# 80. Write a Python program to get the current value of the recursion limit.
# import sys
# print()
# print("Current value of the recursion limit:")
# print(sys.getrecursionlimit())
# print()

# 81. Write a Python program to concatenate N strings.
# list_of_colors = ['Red', 'White', 'Black']
# colors = '-'.join(list_of_colors)
# print()
# print("All Colors: ",colors)
# print()

# 82. Write a Python program to calculate the sum of all items of a container (tuple, list, set, dictionary)
# s = sum([19,50,30])
# print("\nSum of the container: ", s)
# print()
 
#83

# 84. Write a Python program to count the number occurrence of a specific character in a string
# s = "The quick brown fox jumps over the lazy dog."
# print("Original string:")
# print(s)
# print("Number of occurrence of 'o' in the said string:")
# print(s.count("o"))

#85

# 86. Write a Python program to get the ASCII value of a character
# print()
# print(ord('b'))
# print(ord('c'))
# print(ord('d'))
# print(ord('2'))
# print()

#87

# 88. Given variables x=30 and y=20, write a Python program to print "30+20=50".
# x = 30
# y = 20
# print("\n%d+%d=%d" % (x, y, x+y))
# print()

# 89. Write a Python program to perform an action if a condition is true.
#Given a variable name, if the value is 1, display the string "First day of a Month!" and do nothing if the value is not equal.
# n=1
# if n == 1:
#    print("\nFirst day of a Month!")
# print()

#90

# 91. Write a Python program to swap two variables.
# a = 30
# b = 50
# print("\nBefore swap a = %d and b = %d" %(a, b))
# a, b = b, a
# print("\nAfter swaping a = %d and b = %d" %(a, b))
# print()

# 92. Write a Python program to define a string containing special characters in various forms.
# print("\#{'}${\"}@/")
# print("\#{'}${"'"'"}@/")
# print("""\#{'}${"}@/""")
# print('\#{\'}${"}@/')
# print('\#{'"'"'}${"}@/')
# print('''\#{'}${"}@/''')

# 93. Write a Python program to get the Identity, Type, and Value of an object.
# x = "Anuradha"
# print("\nIdentity: ",x)
# print("\nType: ",type(x))
# print("\nValue: ",id(x))

#94. Write a Python program to convert a byte string to a list of integers.
# x = b'dfguihj'              
# print(list(x))

# 95. Write a Python program to check whether a string is numeric
# string = '6789'
# print(string.isnumeric())
# string = 'anu6789'
# print(string.isnumeric())

#96

#97


# 98. Write a Python program to get the system time.
# import time
# print()
# print(time.ctime())
# print()

# 99. Write a Python program to clear the screen or terminal
# import os
# os.system("clear")

# 100. Write a Python program to get the name of the host on which the routine is running.
# import socket
# Host_name = socket.gethostname()
# print("Host name:", Host_name)

# 101

# 102

# 103. Write a Python program to extract the filename from a given path.
# import os
# print()
# print(os.path.basename('/home/anuradha/python.py'))
# print()

# 104. Write a Python program to get the effective group id, effective user id, real group id, a list of supplemental group ids associated with the current process.
# import os
# print("\nEffective group id: ",os.getegid())
# print("Effective user id: ",os.geteuid())
# print("Real group id: ",os.getgid())
# print("List of supplemental group ids: ",os.getgroups())
# print()

# 105. Write a Python program to get the users environment
# import os
# print()
# print(os.environ)
# print()

# 106

# 107. Write a Python program to retrieve file properties.
# import os.path
# import time
# print('File         :', __file__)
# print('Access time  :', time.ctime(os.path.getatime(__file__)))
# print('Modified time:', time.ctime(os.path.getmtime(__file__)))
# print('Change time  :', time.ctime(os.path.getctime(__file__)))
# print('Size         :', os.path.getsize(__file__))

#108

# 109. Write a Python program to check if a number is positive, negative or zero.
# num = int(input("Enter a number: "))
# if num > 0:
#        print("It is positive number")
# elif num == 0:
#        print("It is Zero")
# else:
#        print("It is a negative num")

# 110. Write a Python program to get numbers divisible by fifteen from a list using an anonymous function.
# num_list = [68,24,88,99,65,45]
# result = list(filter(lambda x: (x % 15 == 0), num_list))
# print("Numbers divisible by 15 =",result)

# 111

# 112. Write a Python program to remove the first item from a specified list
# color = ["indigo", "anu", "radha"]
# del color[0]
# print(color)


#113

# 114. Write a Python program to filter the positive numbers from a list
# nums = [1,2,2,-6,-7]
# print("Original numbers in the list: ",nums)
# new_nums = list(filter(lambda x: x >0, nums))
# print("Positive numbers in the said list: ",new_nums)

# 115. Write a Python program to compute the product of a list of integers (without using for loop)
# from functools import reduce
# nums = [10, 100, 1000,]
# print(nums)
# nums_product = reduce( (lambda x, y: x * y), nums)                   
# print("\nProduct of the list of int (without using for loop):",nums_product)

# 116. Write a Python program to print Unicode characters.
# str = u'\u0050\u0052\u0049\u0059\u0041'                         
# print()
# print(str)
# print()

# 117. Write a Python program to prove that two string variables of same value point same memory location.
# str1 = "Python"
# str2 = "Python"
# print("\nMemory location of str1 =", hex(id(str1)))
# print("Memory location of str2 =", hex(id(str2)))
# print()

# 118. Write a Python program to create a bytearray from a list.
# nums = [10, 20, 56, 35, 17, 99]
# # Create bytearray from list of integers.
# values = bytearray(nums)
# for x in values: print(x)

# 119. Write a Python program to round a floating-point number to specified number decimal places
# order_amt = float(input("enter number: "))
# print('\nThe total order amount comes to %f' % order_amt)
# print('The total order amount comes to %.3f' % order_amt)
# print()

# 120. Write a Python program to format a specified string limiting the length of a string
# str_num = int(input("enter number: "))
# print("Original string:",str_num)
# print('%.6s' % str_num)
# print('%.9s' % str_num)
# print('%.10s' % str_num)

#121

#122.Write a Python program to empty a variable without destroying it.
# d = {"x":200}
# l = [1,3,5]
# t= (5,7,8)
# print(type(d)())
# print(type(l)())
# print(type(t)())

# 123. Write a Python program to determine the largest and smallest integers, longs, floats.
# import sys
# print("Float value information: ",sys.float_info)
# print("\nInteger value information: ",sys.int_info)
# print("\nMaximum size of an integer: ",sys.maxsize)

# 124. Write a Python program to check whether multiple variables have the same value.
# p=int(input("enter number1: "))
# q=int(input("enter number2: "))
# s=int(input("enter number3: "))
# if p==q==s:
#     print("values are equal")
# else:
#     print("values are not equal")

#125. Write a Python program to sum of all counts in a collections
# import collections
# num = [1,2,3,4,5]
# print(sum(collections.Counter(num).values()))

#126
#127 
#        
# 128. Write a Python program to check whether lowercase letters exist in a string
# str1 = input("enter the user data: ")
# print(any(c.islower() for c in str1))

#129. Write a Python program to add leading zeroes to a string.
# str1=input("enter the number:")
# print("Original String: ",str1)
# str1 = str1.ljust(8, '0')
# print(str1)


#130. Write a Python program to use double quotes to display strings
# d=""" "neel" """
# print(d)

#131

# 132. Write a Python program to list home directory without absolute path
# import os.path
# print(os.path.expanduser('~'))

#133

#134. Write a Python program to input two integers in a single line
# print("Input the value of x & y & z")
# x, y, z = map(int, input().split())
# print("The value of x & y &z are: ",x,y,z)

#135. Write a Python program to print a variable without spaces between values.
# x = int(input("enter number: "))
# print('Value of x is',(x))
# d = {'Red': 'Green'}
# (t1, t2), = d.items()
# print(t1)
# print(t2)

#136

# 137. Write a Python program to extract single key-value pair of a dictionary in variables
# p = {"Name": "Anu"}
# (t1, t2), = p.items()
# print(t1)
# print(t2)

# 138. Write a Python program to convert true to 1 and false to 0
# x = 'true'
# x = int(x == 'true')
# print(x)
# x = 'abcd'
# x = int(x == 'true')
# print(x)

#139
#140

# 141. Write a python program to convert decimal to hexadecimal
# x =  int(input("enter number: "))
# print(format(x, '02x'))

#142

#143. Write a Python program to determine if the python shell is executing in 32bit or 64bit mode on operating system.
# import struct
# print("32 bit system : ",struct.calcsize("P")*4)
# print("64 bit system : ",struct.calcsize("P")*8)

#144. Write a Python program to check whether variable is integer or string.
# x=("Anuradha")
# print(type(x))

#145. Write a Python program to test if a variable is a list or tuple or a set.

# x= {1, 1.5, float}
# if type(x) is  list:
#   print('x is a list')
# elif type(x) is tuple:
#     print('x is a tuple')
# elif type(x) is set:
#     print('x is a set')
# else :
#     print('neither a list or a set or a tuple')

#146. Write a Python program to find the location of Python module sources.

# import imp
# print("Location of Python os module sources:")
# print(imp.find_module('os'))

#147. Write a Python function to check whether a number is divisible by another number. Accept two integers values form the user. 

# def number(m, n):
# 	return True if m % n == 0 else False
# print(number(30, 5))
# print(number(9, 2))

# 148. Write a Python function to find the maximum and minimum numbers from a sequence of numbers.Note: Do not use built-in functions. 

# def max_min(n):
#   max = n[0]
#   min = n[0]
#   for num in n:
#     if num> max:
#       max = num
#     elif num< min:
#         min = num
#   return max, min
# print(max_min([0,-3, 10, 15, 42, 17, 28, 35]))

# 149. Write a Python function that takes a positive integer and returns the sum of the cube of all the positive integers smaller than the specified number. 

# def sum_of_cubes(n):
#  n -= 1
#  total = 0
#  while n > 0:
#    total += n * n * n
#    n -= 1
#  return total
# print("Sum of cubes smaller than the specified number: ",sum_of_cubes(3))


#150. Write a Python function to check whether a distinct pair of numbers whose product is odd present in a sequence of integer values.

# def product(lst):
#  for i in range(len(lst)):
#   for j in range(len(lst)): 
#     if i!=j:
#         product= lst[i] * lst[j]
#         if product & 1:
#             return True
#         else :
#             return False 
# print(product([1,3,5,7]))
# print(product([2,4,6,8]))