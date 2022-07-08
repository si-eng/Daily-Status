#1. Write a Python program to print the following string in a specific format (see the output). Go to the editor
#Sample String : "Twinkle, twinkle, little star, How I wonder what you are! Up above the world so high, Like a diamond in the sky. Twinkle, twinkle, little star, How I wonder what you are" 

# print("Twinkle, twinkle, little star, \n\tHow I wonder what you are! \n\t\tUp above the world so high, \n\t\tLike a diamond in the sky. \nTwinkle, twinkle, little star, \n\tHow I wonder what you are!")
# # \n   new line
# # \t one tab differenece


#2. Write a Python program to get the Python version you are using. 
# import sys
# print("Python Version:-", sys.version)

#3. Write a Python program to display the current date and time.
# import datetime
# x = datetime.datetime.now()
# print ("Current date and time : ")
# print (x.strftime("%Y-%m-%d %H:%M:%S"))  # strftime(formating)


#4. Write a Python program which accepts the radius of a circle from the user and compute the area. 
# a = float(input ("enter the the radius =  "))
# p = 3.14*(a*a)
# print("area of circle = ", p)

#5.Write a Python program which accepts the user's first and last name and print them in reverse order with a space between them.5
# fname = input("Input your First Name : ")
# lname = input("Input your Last Name : ")
# print (lname + " " + fname)

# 6.Write a Python program which accepts a sequence of comma-separated numbers from user and generate a list and a tuple with those numbers
# number = input("user input numbers : ")
# list = number.split(",")
# tuple = tuple(list)
# print('List : ',list)
# print('Tuple : ',tuple)

#  7. Write a Python program to accept a filename from the user and print the extension of that
# filename= input("Enter Filename: ")
# f = filename.split(".")
# print ("Extension of the file is : ", f[-1])
 
 
 
# 8. Write a Python program to display the first and last colors from the following list.
# colour = input ("Enetr colors name= ")
# f = colour.split(",")
# c= (f[0], f[-1])
# print(c)
  
#9. Write a Python program to display the examination schedule. (extract the date from exam_st_date). 
# exam_st_date = (11,12,2014)
# print( "The examination will start from : %i / %i / %i"%exam_st_date)
 
# 10. Write a Python program that accepts an integer (n) and computes the value of n+nn+nnn
# a = int(input("Input an integer : "))
# n1 = int( "%d" % a )
# n2 = int( "%d%d" % (a,a) )
# n3 = int( "%d%d%d" % (a,a,a) )
# print (n1+n2+n3)

#11. Write a Python program to print the documents (syntax, description etc.) of Python built-in function(s).
#print(abs.__doc__)
# x = abs(-67.78)
# print(x)
#Return the absolute value of a number. The argument may be an integer, a floating point number, or an object implementing __abs__(). If the argument is a complex number, its magnitude is returned.


#  12. Write a Python program to print the calendar of a given month and year.
# import calendar 
# y = int(input ("enter year = "))
# m = int(input("enter month = "))
# print(calendar.month(y,m))

# 13. Write a Python program to print the following 'here document'. Go to the editor
# Sample string :
# a string that you "don't" have to escape
# This
# is a ....... multi-line
# heredoc string --------> example
# print("""
# a string that you "don't" have to escape
# This
# is a  ....... multi-line
# heredoc string --------> example
# """)



# 14. Write a Python program to calculate number of days between two dates.
# from datetime import datetime
# first_year= str(input('Enter date(yyyy-mm-dd): '))
# my_date1 = datetime.strptime(first_year, "%Y-%m-%d")
# print(my_date1)
# last_year = str(input('Enter date(yyyy-mm-dd): '))
# my_date2 = datetime.strptime(last_year, "%Y-%m-%d")
# print(my_date2)

# delta = my_date2 - my_date1
# print(delta.days)

# 15. Write a Python program to get the volume of a sphere with radius 6.

# num= int(input("enter the radius = "))
# V=4/3*(3.14*num*3)
# print(V)

#  16. Write a Python program to get the difference between a given number and 17, if the number is greater than 17 return double the absolute difference
# def difference(n):
#     if n <= 17:
#         return 17 - n
#     else:
#         return (n - 17) * 2 

# print(difference(18))

# 17. Write a Python program to test whether a number is within 100 of 1000 or 2000
# def near_thousand(n):
#       return ((abs(1000 - n) <= 100) or (abs(2000 - n) <= 100))
# print(near_thousand(1000))
# print(near_thousand(800))
# print(near_thousand(80))   
# print(near_thousand(2200))


# 18. calculate the sum of three given numbers, if the values are equal then return thrice of their sum.
# def num(x, y, z):
    
#      sum = x + y + z
  
#      if x == y == z:
#       sum = sum * 3
#      return sum

# print(num(2, 2, 2))    #  three numbers are equal
# print(num(1, 2, 3))    # three numers are not equal


# 19.Write a Python program to get a new string from a given string where "Is" has been added to the front. If the given string already begins with "Is" then return the string unchanged.
# def new_string(str):
#     if len(str) >= 2 and str[:2] == "Is":
#         return str
#     return "Is" + str
# print(new_string("Array list tuples"))
# print(new_string(" ")) 

# 20. Write a Python program to get a string which is n (non-negative integer) copies of a given string. 
# def larger_string(str, n):
#     result = ""
#     for i in range(n):
#         result = result + str
#     return result
# print(larger_string('abc', 4))

#21. Write a Python program to find whether a given number (accept from the user) is even or odd, print out an appropriate message to the user. 
# num = int(input("Enter a number: "))
# mod = num % 2
# if mod > 0:
#     print("This is an odd number.")
# else:
#     print("This is an even number.")#

# 22. Write a Python program to count the number 4 in a given list.   
# def count(lst, x):
#     count = 0
#     for num in lst:
#         if (num == x):
#             count = count + 1
#     return count
# lst = [4,7,7,4,9,4,7,4]
# x = 4
# print('{} has occurred {} times'.format(x, count(lst, x)))


# 23. Write a Python program to get the n (non-negative integer) copies of the first 2 characters of a given string. Return the n copies of the whole string if the length is less than 2.
# def substring_copy(str, n):
#       flen = 2
#   if flen > len(str):
#     flen = len(str)
#   substr = str[:flen]
  
#   result = ""
#   for i in range(n):
#     result = result + substr
#   return result
# print(substring_copy('abcdef', 2))
# print(substring_copy('p', 3));


# 24. Write a Python program to test whether a passed letter is a vowel or not.
# def is_vowel(char):
#     all_vowels = 'aeiou'
#     print (char in all_vowels)
# is_vowel('p')
# is_vowel('i')



#25. Write a Python program to check whether a specified value is contained in a group of values.
# def is_group_member(group_data, n):
#         for value in group_data:
#             if n == value:
#                 return True
#         return False
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

#27. Write a Python program to concatenate all elements in a list into a string and return i
# list = ['1','2','3','4'] 
# newlist = ""
# a = newlist.join(list) 
# print(a) 

                            


# 28. Write a Python program to print all even numbers from a given numbers list in the same order and stop the printing if any numbers that come after 237 in the sequence. Go to the editor
# Sample numbers list :

# numbers = [    
#     386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345, 
#     399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217, 
#     815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717, 
#     958,743, 527
#     ]
# num = [    
#     386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345, 
#     399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217, 
#     815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717, 
#     958,743, 527
#     ]
# for x in num:
#     if x == 237:
#         print(x)
#         break;
#     elif x % 2 == 0:
#         print(x)


# 29. Write a Python program to print out a set containing all the colors from color_list_1 which are not present in color_list_2. Go to the editor
# Test Data :
# color_list_1 = set(["White", "Black", "Red"])
# color_list_2 = set(["Red", "Green"])
# color_list_1 = set(["White", "Black", "Red"])
# color_list_2 = set(["Red", "Green"])
# print("Original set elements:")
# print(color_list_1)
# print(color_list_2)
# print("Differenct of color_list_1 and color_list_2:")
# print(color_list_1 - color_list_2)

#30. Write a Python program that will accept the base and height of a triangle and compute the area.
# b = int(input("Input the base : "))
# h = int(input("Input the height : "))
# area = b*h/2
# print("Area of Triangle= ", area)

# 31. Write a Python program to compute the greatest common divisor (GCD) of two positive integers. 
# import math
# a= int(input("Enter first number = "))
# b= int(input("Enter second number = "))
# print("The gcd of 336 and 360 is : ", end="")
# print(math.gcd(a,b))

# 32. Write a Python program to get the least common multiple (LCM) of two positive integers
# a=int(input("enter first"))
# b=int(input("enter second"))
# maxnum=max(a,b)
# while(True):
#     if (maxnum % a == 0 and maxnum % b ==0):
#         break
#     maxnum+=1
# print(maxnum)

# 33. Write a Python program to sum of three given integers. However, if two values are equal sum will be zero.
# def sum_three(x, y, z):
#     if x == y or y == z or x==z:
#         sum = 0
#     else:
#         sum = x + y + z
#     return sum
# print(sum_three(2, 1, 2))
# print(sum_three(3, 2,5 ))


# 34. Write a Python program to sum of two given integers. However, if the sum is between 15 to 20 it will return 20.
# def sum(x, y):
#     sum = x + y
#     if sum in range(15, 20):
#         return 20
#     else:
#         return sum

# print(sum(10, 6))
# print(sum(10, 2))
# print(sum(10, 12))


# 35. Write a Python program that will return true if the two given integer values are equal or their sum or difference is 5
# def test_number5(x, y):
#        if x == y or abs(x-y) == 5 or (x+y) == 5:
#        return True
#    else:
#        return False
# print(test_number5(7, 2))
# print(test_number5(2, 2))
# print(test_number5(7, 3))


#36. Write a Python program to add two objects if both objects are an integer type
# def add_numbers(a, b):
#          if not (isinstance(a, int) and isinstance(b, int)):
#             return "Inputs must be integers!"
#         return a + b
# print(add_numbers(10, 20))
# print(add_numbers(10, 20.23))
# print(add_numbers('5', 6))
# print(add_numbers('5', '6'))


#37. Write a Python program to display your details like name, age, address in three different lines.
# name= input("user input name= ")
# address = input("user input address= ")
# age= int(input("user input address= "))
# print("Name: {}\nAge: {}\nAddress: {}".format(name, age, address))

# 38. Write a Python program to solve (x + y) * (x + y).
# x= int(input("USER INPUT VALUE1: "))
# y= int(input("USER INPUT VALUE2: "))
# result = x * x + 2 * x * y + y * y
# print(result)


# 39. Write a Python program to compute the future value of a specified principal amount, rate of interest, and a number of years.  
# p= 1200   # principle amount
# t= 2      # time
# r= 5.4    # rate
# # calculates the compound interest
# a=p*(1+(r/100))**t  # formula for calculating amount
# ci=a-p  # compound interest = amount - principal amount
# print(ci)

# 40. Write a Python program to compute the distance between the points (x1, y1) and (x2, y2).

# x1=int(input("enter x1 : "))
# x2=int(input("enter x2 : "))
# y1=int(input("enter y1 : "))
# y2=int(input("enter y2 : "))
# result= ((((x2 - x1 )**2) + ((y2-y1)**2) )**0.5)
# print("distance between",(x1,x2),"and",(y1,y2),"is : ",result)

# 41. Write a Python program to check whether a file exists
# import os.path
# print(os.path.isfile('question1.py'))
# print(os.path.isfile('trial.tf'))

# 42. Write a Python program to determine if a Python shell is executing in 32bit or 64bit mode on OS.
# import struct
# print(struct.calcsize("i")*8)
# print(struct.calcsize("i")*16)

# 43. Write a Python program to get OS name, platform and release information.
# import platform
# import os
# print("Name of the operating system:",os.name)
# print("\nName of the OS system:",platform.system())
# print("\nVersion of the operating system:",platform.release())

# 44. Write a Python program to locate Python site-packages. 
# import site; 
# print(site.getsitepackages())

# 45. Write a Python program to call an external command.
# import os
# print(os.system('ls -l'))

# 46. Write a python program to get the path and name of the file that is currently executing. 
# import os
# print("Current File Name : ",os.path.realpath(__file__))

# 47. Write a Python program to find out the number of CPUs using.
# import multiprocessing
# print(multiprocessing.cpu_count())

# 48. Write a Python program to parse a string to Float or Integer
# n = "246.2458"
# print(float(n))
# print(int(float(n)))

# 49. Write a Python program to list all files in a directory in Python.
# from os import listdir
# from os.path import isfile, join
# files_list = [f for f in listdir('/home/seasia') if isfile(join('/home/seasia', f))]
# print(files_list);

# 50. Write a Python program to print without newline or space.
# for i in range(0, 10):
#     print('*', end="")
# print("\n")

# 51. Write a Python program to determine profiling of Python programs
# import cProfile                 #(Python includes a built in module called cProfile which is used to measure the execution time of a program.)
# cProfile.run("10 + 10")


# 53. Write a python program to access environment variables.
# import os
# # Access all environment variables 
# print('*----------------------------------*')
# print(os.environ)
# print('*----------------------------------*')
# # Access a particular environment variable 
# print(os.environ['HOME'])
# print('*----------------------------------*')
# print(os.environ['PATH'])
# print('*----------------------------------*')

# 54. Write a Python program to get the current username
# getlogin() method of OS library is used to get the current username.
# # importing os module
# import os
# # using getlogin() returning username
# p=os.getlogin()
# print(p)

# 56. Write a Python program to get height and width of the console window
# import os
# size = os.get_terminal_size()
# print(size)

# 58. Write a Python program to sum of the first n positive integers
# n = int(input("Input a number: "))
# sum_num = (n * (n + 1)) / 2
# print("Sum of the first", n ,"positive integers:", sum_num)

# 59. Write a Python program to convert height (in feet and inches) to centimeters.
# print("Input your height: ")
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
# d_ft= int(input("Input distance in feet: "))
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

#63. Write a Python program to get an absolute file path.
# def absolute_file_path(path_fname):
#         import os
#         return os.path.abspath('path_fname')        
# print("Absolute file path: ",absolute_file_path("question1.py"))

# 64. Write a Python program to get file creation  date/times. 
# import os.path, time
# print("Created: %s" % time.ctime(os.path.getctime("question1.py")))

# 65. Write a Python program to convert seconds to day, hour, minutes and seconds.
# time = float(input("Input time in seconds: "))
# day = time // (24 * 3600)
# time = time % (24 * 3600)
# hour = time // 3600
# time %= 3600
# minutes = time // 60
# time %= 60
# seconds = time
# print("d:h:m:s-> %d:%d:%d:%d" % (day, hour, minutes, seconds))


# 66.Write a Python program to calculate body mass index.
# height = float(input("Input your height in Feet: "))
# weight = float(input("Input your weight in Kilogram: "))
# print("Your body mass index is: ", weight / (height/100)**2  )

#67. Write a Python program to convert pressure in kilopascals to pounds per square inch, a millimeter of mercury (mmHg) and atmosphere pressure
# kpa = float(input("Input pressure in in kilopascals> "))
# psi = kpa / 6.89475729
# mmhg = kpa * 760 / 101.325
# atm = kpa / 101.325
# print("The pressure in pounds per square inch: %.2f psi"  % (psi))
# print("The pressure in millimeter of mercury: %.2f mmHg" % (mmhg))
# print("Atmosphere pressure: %.2f atm." % (atm))

# 68. Write a Python program to calculate sum of digits of a number.
# i=int(input("enter number: "))
# sum=0
# while (i>0):
#     sum=sum+i%10
#     i=i//10
# print("sum of digit= ", sum)    


# 69.Write a Python program to sort three integers without using conditional statements and loops.
# x = int(input("Input first number: "))
# y = int(input("Input second number: "))
# z = int(input("Input third number: "))
# a1 = min(x, y, z)
# a3 = max(x, y, z)
# a2 = (x + y + z) - a1 - a3     #(condition)
# print("Numbers in sorted order: ", a1, a2, a3)


# 70. Write a Python program to sort files by date.
# import glob
# files = glob.glob("*.py")
# print("\n".join(files))

# 72. Write a Python program to get the details of math module.
# # Imports the math module
# import math            
# #Sets everything to a list of math module
# math_ls = dir(math) # 
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

#74. Write a Python program to hash a word
# hash for integer unchanged
#print('Hash for 181 is:', hash(1851.4))
# hash for decimal
#print('Hash for 181.23 is:',hash(181.23))
# hash for string
#print('Hash for Python is:', hash('Python'))

# 75. Write a Python program to get the copyright information and write Copyright information in Python code.
# import sys
# print("\nPython Copyright Information")
# print(sys.copyright)
# print()

#78. Write a Python program to find the available built-in modules.
# import sys
# import textwrap
# module_name = ', '.join(sorted(sys.builtin_module_names))
# print(textwrap.fill(module_name, width=20))

# 79. Write a Python program to get the size of an object in bytes.
# import sys
# str1 = "one"
# str2 = "two"
# str3 = "three"
# x = 0
# y = 112
# print("Size of ",str1,"=",str(sys.getsizeof(str1))+ " bytes")
# print("Size of ",str2,"=",str(sys.getsizeof(str2))+ " bytes")
# print("Size of ",str3,"=",str(sys.getsizeof(str3))+ " bytes")
# print("Size of",x,"=",str(sys.getsizeof(x))+ " bytes")
# print("Size of" ,y,"="+str(sys.getsizeof(y))+ " bytes")
# L = [1, 2, 3, 'Red', 'Black']
# print("Size of",L,"=",sys.getsizeof(L)," bytes")
# T = ("Red", [8, 4, 6], (1, 2, 3))
# print("Size of",T,"=",sys.getsizeof(T)," bytes")
# S = {'apple', 'orange', 'apple', 'pear'}
# print("Size of",S,"=",sys.getsizeof(S)," bytes")
# D = {'Name': 'priya', 'Age': 21}
# print("Size of",D,"=",sys.getsizeof(S)," bytes")

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
# s = sum([10,20,30])
# print("\nSum of the container: ", s)
# print()

# 83. Write a Python program to test whether all numbers of a list is greater than a certain number.
# num = [2, 3, 4, 5]
# print()
# print(all(x > 1 for x in num))
# print(all(x > 4 for x in num))
# print()


# 84. Write a Python program to count the number occurrence of a specific character in a string
# s = "The quick brown fox jumps over the lazy dog."  
# print("Original string:")
# print(s)
# print("Number of occurrence of 'o' in the said string:")
# print(s.count("o"))

# 85. Write a Python program to check whether a file path is a file or a directory.
# import os  
# path="question1.py"  
# if os.path.isdir(path):  
#     print("It is a directory")  
# elif os.path.isfile(path):  
#     print("It is a normal file")  
# else:  
#     print("It is a special file (socket, FIFO, device file)" )
# print()

# 86. Write a Python program to get the ASCII value of a character
# print(ord('a'))                       #http://sticksandstones.kstrom.com/appen.html
# print(ord('A'))
# print(ord('1'))
# print(ord('@'))


#87. Write a Python program to get the size of a file.
# import os
# file_size = os.path.getsize("question1.py")
# print("The size of abc.txt is :",file_size,"Bytes")
# print()


# 88. Given variables x=30 and y=20, write a Python program to print "30+20=50". 
# x = 30
# y = 20
# print("\n%d+%d=%d" % (x, y, x+y))
# print()

# 89. Write a Python program to perform an action if a condition is true.
# Given a variable name, if the value is 1, display the string "First day of a Month!" and do nothing if the value is not equal.
# n=1
# if n == 1:
#    print("\nFirst day of a Month!")
# print()


# 90. Write a Python program to create a copy of its own source code. 
# s='s=%r;print(s%%s'; print(s%s)

# 91. Write a Python program to swap two variables.
# a = 30
# b = 20
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
# x = "priya"
# print("\nIdentity: ",x)
# print("\nType: ",type(x))
# print("\nValue: ",id(x))


  
#94. Write a Python program to convert a byte string to a list of integers.
# x = b'GpG'              (Initializing a byte string as GpG)
# print(list(x))


# 95. Write a Python program to check whether a string is numeric     
# string = '123ayu456'
# print(string.isnumeric())
    
# string = '123456'
# print(string.isnumeric())


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
# host_name = socket.gethostname()
# print("Host name:", host_name)

# 101. Write a Python program to access and print a URL's content to the console.
# from http.client import HTTPConnection
# conn = HTTPConnection("github.com")
# conn.request("GET", "/")  
# result = conn.getresponse()
# contents = result.read() 
# print(contents)

# 103. Write a Python program to extract the filename from a given path.
# import os
# print()
# print(os.path.basename('/home/seasia/python_prog'))
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

# 107. Write a Python program to retrieve file properties.
# import os.path
# import time
# print('File         :', __file__)
# print('Access time  :', time.ctime(os.path.getatime(__file__)))
# print('Modified time:', time.ctime(os.path.getmtime(__file__)))
# print('Change time  :', time.ctime(os.path.getctime(__file__)))
# print('Size         :', os.path.getsize(__file__))


# 109. Write a Python program to check if a number is positive, negative or zero.
# num = float(input("Input a number: "))
# if num > 0:
#    print("It is positive number")
    # elif num == 0:
    #    print("It is Zero")
    # else:
    #    print("It is a negative num)
    


# 110. Write a Python program to get numbers divisible by fifteen from a list using an anonymous function.    
# num_list = [45, 55, 60, 37, 100, 105, 220]
# # use anonymous function to filter
# result = list(filter(lambda x: (x % 15 == 0), num_list))
# print("Numbers divisible by 15 are",result)

# 111.Write a Python program to make file lists from current directory using a wildcard.
# import glob
# file = glob.glob('*.*')      """(A glob is a string of literal and/or wildcard characters used to match filepaths)"""
# print(file)



# 112. Write a Python program to remove the first item from a specified list
# color = ["Red", "Black", "Green", "White", "Orange"]
# print("Original list elements:")
# print(color)
# del color[0]
# print("After removing the first color:")
# print(color

# 113. Write a Python program to input a number, if it is not a number generates an error message.
# while True:
#     try:
#         a = int(input("Input a number: "))
#         break
#     except ValueError:
#         print("This is not a number. Try again...")
        
        
# 114. Write a Python program to filter the positive numbers from a list
# nums = [34, 1, 0, -23, 12, -88]
# print("Original numbers in the list: ",nums)
# new_nums = list(filter(lambda x: x >0, nums))
# print("Positive numbers in the said list: ",new_nums)


# 115. Write a Python program to compute the product of a list of integers (without using for loop)
# from functools import reduce
# nums = [10, 20, 30,]
# print("Original list numbers:")
# print(nums)
# nums_product = reduce( (lambda x, y: x * y), nums)                   reduce(function, iterable, [, initializer])
# print("\nProduct of the said numbers (without using for loop):",nums_product)



# 116. Write a Python program to print Unicode characters.
# str = u'\u0050\u0052\u0049\u0059\u0041'                         (https://en.wikipedia.org/wiki/List_of_Unicode_characters)
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

# 121. Write a Python program to determine whether variable is defined or not
# variable= "shukla"
# try:
#     a=int(variable)
#     print("the variable is number")
# except:
    
#     print("variable is string")
#     print(isinstance(variable,str))    
    
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
# num = [2,2,4,6,6,8,6,10,4]
# print(sum(collections.Counter(num).values()))        >>[collections.Counter(num).values() ]     


# 126. Write a Python program to get the actual module object for a given object.
# from inspect import getmodule
# from random import randint
# print(getmodule(randint))


# 128. Write a Python program to check whether lowercase letters exist in a string
# str1 = input("enter the user data: ")
# print(any(c.islower() for c in str1))

# 126. Write a Python program to get the actual module object for a given object.
# from inspect import getmodule
# from random import randint
# print(getmodule(randint))


#129. Write a Python program to add leading zeroes to a string.
# str1=input("enter the number:")
# print("Original String: ",str1)
# str1 = str1.ljust(8, '0')
# print(str1)

#130. Write a Python program to use double quotes to display strings
# p=""" "hellooooo" """
# print(p)

# 131. Write a Python program to split a variable length string into variables.
# name =["priya", "shukla"]
# print("name:", name)
# a, b = name
# print(a)
# print(b)

# 132. Write a Python program to list home directory without absolute path
# import os.path
# print(os.path.expanduser('~'))

# 133. Write a Python program to calculate the time runs (difference between start and current time) of a program
# import time
# start = time.time()
# for i in range(10):
#     print(i)
# # sleeping for 1 sec to get 10 sec runtime
# time.sleep(1)
# end = time.time()
# print(f"Runtime of the program is {end - start}")


#134. Write a Python program to input two integers in a single line
# print("Input the value of x & y & z")
# x, y, z = map(int, input().split())
# print("The value of x & y &z are: ",x,y,z)

#135. Write a Python program to print a variable without spaces between values. 
# x = int(input("enter number: "))
# print('Value of x is',(x))

# d = {'Red': 'Green'}
# (c1, c2), = d.items()
# print(c1)
# print(c2)

# 136. Write a Python program to find files and skip directories of a given directory.
# import os
# print([f for f in os.listdir('/home/seasia ') if os.path.isfile(os.path.join('/home/seasia', f))])

# 137. Write a Python program to extract single key-value pair of a dictionary in variables
# p = {"Name": "Priya"}
# (c1, c2), = p.items()
# print(c1)
# print(c2)


# 138. Write a Python program to convert true to 1 and false to 0
# x = 'true'
# x = int(x == 'true')
# print(x)
# x = 'abcd'
# x = int(x == 'true')
# print(x)

# 139. Write a Python program to valid a IP address.
# import socket
# addr = '127.0.0.2561'                           # ('socket' module defines how server and client machines can communicate at hardware level using socket endpoints on top of the operating system)
# try:
#     socket.inet_aton(addr)                # The function inet_aton() converts an IPv4 address from the dotted-quad string format to 32-bit packed binary format. 
#     print("Valid IP")
# except socket.error:
#     print("Invalid IP")

#140. Write a Python program to convert an integer to binary keep leading zeros
# x = 12
# print(format(x, '08b'))
# print(format(x, '010b'))

# 141. Write a python program to convert decimal to hexadecimal
# x =  int(input("enter number: "))
# print(format(x, '02x'))

# 143. Write a Python program to determine if the python shell is executing in 32bit or 64bit mode on operating system.
# import struct
# print(struct.calcsize("P") * 8)

# 144. Write a Python program to check whether variable is integer or string. 
# print(isinstance(25,int) )      #The isinstance() function returns True if the specified object is of the specified type, otherwise False
# print(isinstance([25],int) )
# print(isinstance("25",str) )


# 145. Write a Python program to test if a variable is a list or tuple or a set.
# x = ('tuple', False, 3.2, 1)
# if type(x) is list:
#     print('x is a list')
# elif type(x) is set:
#     print('x is a set')
# elif type(x) is tuple:
#     print('x is a tuple')    
# else:
#     print('Neither a list or a set or a tuple.')

# 146. Write a Python program to find the location of Python module sources.
# import imp
# print("Location of Python random module sources:")
# print(imp.find_module('random'))

# 147. Write a Python function to check whether a number is divisible by another number. Accept two integers values form the user.
# def multiple(m, n):
#     	return True if m % n == 0 else False
# m= int(input ("1st number: "))
# n= int(input ("2nd number: "))
# print(multiple(m, n))


# 148. Write a Python function to find the maximum and minimum numbers from a sequence of numbers. Go to the editor
# Note: Do not use built-in functions.
# def minandmax():
#     num= [35,2,67,46,354,3,6]
#     min = num[0]
#     for a in num:
#         if a<min:
#             min = a
#             print(min)
#     max = num[0]
#     for a in num:
#         if a>max:
#             max = a
#     print(max)                
# minandmax()           

# 149. Write a Python function that takes a positive integer and returns the sum of the cube of all the positive integers smaller than the specified number.
# def sum_of_cubes(n):
#      n -= 1
#  total = 0
#  while n > 0:
#    total += n * n * n
#    n -= 1
#  return total
# print("Sum of cubes smaller than the specified number: ",sum_of_cubes(3))

#150. Write a Python function to check whether a distinct pair of numbers whose product is odd present in a sequence of integer values. 
# def odd_product(nums):
#   for i in range(len(nums)):
#     for j in range(len(nums)):
#       if  i != j:
#         product = nums[i] * nums[j]
#         if product & 1:
#           return True
#   return False          
# dt1 = [2, 4, 6, 8]
# dt2 = [1, 6, 4, 7, 8]
# dt3 = [1, 3, 5, 7, 9]
# print(dt1, odd_product(dt1));
# print(dt2, odd_product(dt2));
# print(dt3, odd_product(dt3));

