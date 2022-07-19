print("Twinkle, twinkle, little star, \n\tHow I wonder what you are! \n\t\tUp above the world so high, \n\t\tLike a diamond in the sky. \nTwinkle, twinkle, little star, \n\tHow I wonder what you are!")


#program to get python version

from cmath import pi, sqrt
from genericpath import getmtime
from importlib.resources import path
from itertools import count
from multiprocessing.sharedctypes import Value
from re import U
import re
import sys
from turtle import color
from unicodedata import name
from unittest import result
print(sys.version)

#to display current date and time
import datetime
x = datetime.datetime.now()
print(x)

#program which accepts the radius of a circle from the user and compute the area
# from math import pi
# r = float(input ("enter radius of the circle : "))
# print ("The area of the circle with radius " + str(r) + " is: " + str(pi * r**2))


# program which accepts the user's first and last name and print them in reverse order with a space between them
fst = "Anish"
scnd = "Dhiman"
print(scnd , " " , fst )

#program which accepts a sequence of comma-separated numbers from user and generate a list and a tuple with those numbers
#values = input("Input some comma seprated numbers : ")
# list = values.split(",")
# tuple = tuple(list)
# print('List : ',list)
# print('Tuple : ',tuple)

# program to accept a filename from the user and print the extension of that.
fname="xyzds.java"
f=fname.split(".")
print(f[-1])

# program to display the first and last colors from the following list
colors=["red","blue","green","purple"]
print(colors[1],colors[-1])

#program to display the examination schedule.
date = (1,7,2022)
print("%i / %i / %i" % date)

# program that accepts an integer (n) and computes the value of n+nn+nnn
x= 5
n1=int("%s" % (x))
n2=int("%s%s " % (x,x))
n3=int("%s%s%s " % (x,x,x))
print(n1+n2+n3)


#program to print the documents (syntax, description etc.) of Python built-in function(s).


#program to print the calendar of a given month and year.
# import calendar
# m = int(input("enter month "))
# year = int(input("enter year "))
# print(calendar.month(m,year))



print("""a string that you "don't" have to escape
This
is a ....... multi-line
heredoc string --------> example""")


#program to calculate number of days between two dates.
from datetime import date
fdate = date(2022,3,24)
ldate = date(2022,4,23)
fdays = (ldate-fdate)
print(fdays.days)

#Python program to get the volume of a sphere with radius 6
#The volume of the sphere is : V = 4/3πr3 
pi=3.14
r = 6
volume = 4/3*pi*r**3
print(volume)

#program to get the difference between a given number and 17, if the number is greater than 17 return double the absolute difference.

n=22
if n<17:
    print(17-n)
else:
    print(int((n-17)*2))


#program to test whether a number is within 100 of 1000 or 2000.

# a = int(input("enter number"))
# if a >= 900 and a <= 1100:
#     print(" number is within 100 of 1000")
# elif a >= 1900 and a <= 2100:
#     print("number is within 100 of  2000")
# else:
#     print("Number is not within 100 of 1000 and 2000")

#program to calculate the sum of three given numbers, if the values are equal then return three times of their sum.
a=5
b=5
c=5
if a==b==c:
    print(int(a+b+c)*3)
else:
    print(a+b+c)


#program to get a new string from a given string where "Is" has been added to the front. If the given string already begins with "Is" then return the string unchanged
def strng(st1):
    if len(st1) >= 2 and st1[:2] == "Is":
        return st1
    return "Is" + st1
print(strng("heychamp"))
print(strng("Isyou"))


#program to get a string which is n (non-negative integer) copies of a given string
def myint(str,n):
    result = ""
    for i in range(n):
        result= result+str
    return result
print(myint("anish",2))
print(myint("dhiman",3))


#program to find whether a given number (accept from the user) is even or odd, print out an appropriate message to the user
# n=int(input("enter number"))
# if n%2 == 0:
#     print("Even number")
# else:
#     print("Odd")

#program to count the number 4 in a given list.
def myfunc(num):
    count=0
    for i in num:
        if i == 4:
            count=count+1
    return count
print(myfunc([1,3,2,4,5,6,4,4]))


#program to get the n (non-negative integer) copies of the first 2 characters of a given string. Return the n copies of the whole string if the length is less than 2.

#program to test whether a passed letter is a vowel or not
# n=input("enter word")
# list=['a','i','e','o','u']

# if n in list:
#     print("yes it,s a vowel")
# else:
#     print("not")

#program to check whether a specified value is contained in a group of values. 

def myfun(group,n):
    for value in group:
        if n == value:
            return True        
    return False
print(myfun([3,4,5,9],6))

#program to create a histogram from a given list of integers.
s = ['Geeks', 'for', 'Geeks']
str1 = ""
# traverse in the string 

#Write a Python program to concatenate all elements in a list into a string and return it
s=['ell','world']
st=''
for i in s:
    st+=i
print(st)


# program to print all even numbers from a given numbers list in the same order and stop the printing if any numbers that come after 237 in the sequence

numbers = [    
    386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345, 
    399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217, 
    815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717, 
    958,743, 527
    ]

for i in numbers:
    if i == 237:
        break
    elif i%2 == 0:
        print(i)

#program to print out a set containing all the colors from color_list_1 which are not present in color_list_2.
color_list_1 = set(["White", "Black", "Red"])
color_list_2 = set(["Red", "Green"])
 
final = color_list_1.difference(color_list_2)   #differnce()-it  is used to returns the difference between two sets
print(final)


# program that will accept the base and height of a triangle and compute the area.
b=20
h=40
area=1/2*b*h   #formula to find area of triangle=1/2 base*height
print(area)


#program to compute the greatest common divisor (GCD) of two positive integers
# a = int(input("enter fst num"))
# b = int(input("enter second num"))
# if a>b:
#     min=b
# else:
#     min = a

# for i in range(1,min+1):
#     if b%i == 0 and a % i ==0:
#         hcf = i
# print(hcf)


#program to get the least common multiple (LCM) of two positive integers.
# a=int(input("enter first"))
# b=int(input("enter second"))
# maxnum=max(a,b)
# while(True):
#     if (maxnum % a == 0 and maxnum % b ==0):
#         break
#     maxnum+=1
# print(maxnum)


# program to sum of three given integers. However, if two values are equal sum will be zero.
# num1=int(input("enter fisrt number"))
# num2=int(input("enter second number"))
# num3=int(input("enter third number"))

# if num1 == num2 or num2 == num3 or num3 == num1:
#     print(0)
# else:
#     print(num1+num2+num3)


#program to sum of two given integers. However, if the sum is between 15 to 20 it will return 20
# a = int(input("enter fst num"))
# b = int(input("enter scnd num"))
# if a + b >= 15 and a+b <= 20:
#     print(20)
# else:
#     print(a+b)



#program that will return true if the two given integer values are equal or their sum or difference is 5.
def func1(a,b):
    if a == b or a + b == 5 or abs(a-b) == 5:
        return True
    else:
        return False
print(func1(7,2))
print(func1(5,5))
print(func1(8,3))
print(func1(7,3))


#program to add two objects if both objects are an integer type
def addnum(x,y):
    if isinstance(x,int) and isinstance(y,int):
        return x+y
    else:
        return "Input must be of integer type"

print(addnum(4,6))
print(addnum(4,6.7))
print(addnum(4,'6'))

# program to solve (x + y) * (x + y)

x=4
y=3
z= x*x + y*y + 2*x*y
print(z)


#program to compute the future value of a specified principal amount, rate of interest, and a number of years.


#program to compute the distance between the points (x1, y1) and (x2, y2)

#Python program to check whether a file exists
import os.path
file_exists = os.path.exists('Asgnment.py')
file = os.path.exists('Asgnment.txt')
print(file_exists)
print(file)


#program to determine if a Python shell is executing in 32bit or 64bit mode on OS
import struct
print(struct.calcsize("P")*4)
print(struct.calcsize("P")*8)


#program to get OS name, platform and release information.
import os
import platform

print(os.name)
print(platform.system())
print(platform.release())


#program to locate Python site-packages
import site; 
print(site.getsitepackages())


#program to call an external command


#program to get the path and name of the file that is currently executing
import os
print(os.path.realpath('asgnment.py'))


#program to find out the number of CPUs using
import multiprocessing
print(multiprocessing.cpu_count())


#program to parse a string to Float or Integer.
n = "2458"
print(float(n))
print(int(n))

#program to list all files in a directory in Python
# import os
# path="C:\Users\kumaranish\Desktop\Terraform"
# dirList = os.listdir(path)
# print(path)
# print(dirList)

#program to print without newline or space
for i in range(0, 10):
    print('*',end="")


#program to determine profiling of Python programs.
import cProfile
def sum():
    print(5*10)
cProfile.run('sum()')


#program to access environment variables
import os
print(os.environ)
# Access a particular environment variable 
print(os.environ['PATH'])


# program to get the current username
import getpass
print(getpass.getuser())

# Python to find local IP addresses using Python's stdlib
import socket
h_name= socket.gethostname ()
ip = socket.gethostbyname(h_name)
print(h_name)
print(ip)


# program to get height and width of the console window.
import os
size = os.get_terminal_size()
print(size)



#program to get execution time (in seconds) for a Python method.
import time
st= time.time()
for i in range(10):
    print("Anish Dhiman")

et = time.time()
print(et - st)

#Python program to sum of the first n positive integers.
n = 14
sum = n * (n+1)/2
print(sum)


#Python program to convert height (in feet and inches) to centimeters.

h_ft = 5
h_inch = 9
 
h_inch += h_ft * 12
h_cm = round(h_inch * 2.54, 1)
 
print("Your height is : %d cm." % h_cm)

#program to calculate the hypotenuse of a right angled triangle.
import math
a = 10
b = 8
c = sqrt(a**2 + b**2)
print(c)


#program to convert the distance (in feet) to inches, yards, and miles.
d_ft = 5
d_inches = d_ft * 12
d_yards = d_ft / 3.0
d_miles = d_ft / 5280.0

print("The distance in inches is %i inches." % d_inches)
print("The distance in yards is %.2f yards." % d_yards)
print("The distance in miles is %.2f miles." % d_miles)



#Python program to convert all units of time into seconds.
days = 3 * 3600 * 24
hours = 5 * 3600
minutes = 10 * 60
seconds = 20

time = days + hours + minutes + seconds

print("The  amounts of seconds", time)


#program to get an absolute file path.
def abs_path(fname):
    import os
    return os.path.abspath(fname)
print(abs_path('asgnment.py'))


#program to get file creation and modification date/times
import os,time
print(time.ctime(os.path.getmtime('asgnment.py')))
print(time.ctime(os.path.getctime('asgnment.py')))


# program to convert seconds to day, hour, minutes and seconds.
time = 15
day = time // (24 * 3600)
time = time % (24 * 3600)
hour = time // 3600
time %= 3600
minutes = time // 60
time %= 60
seconds = time
print("d:h:m:s-> %d:%d:%d:%d" % (day, hour, minutes, seconds))


#program to calculate body mass index
h=2.5
w=75
 
BMI=w/(h*h)
print(BMI)

# program to convert pressure in kilopascals to pounds per square inch, a millimeter of mercury (mmHg) and atmosphere pressure
kpa = 12
psi = kpa / 6.89475729
mmhg = kpa * 760 / 101.325
atm = kpa / 101.325
print("The pressure in pounds per square inch: %.2f psi"  % (psi))
print("The pressure in millimeter of mercury: %.2f mmHg" % (mmhg))
print("Atmosphere pressure: %.2f atm." % (atm))



#python program to get sum of digits
def getSum(n):
    
    sum = 0
    while (n != 0):
        sum = sum + (n % 10)
        n = n//10      
    return sum   
n = 12345
print(getSum(n))


#program to sort three integers without using conditional statements and loops
x=8
y=4
z=6

a1 = min(x,y,z)
a3 = max(x,y,z)
a2 = (x+y+z) - a1 - a3

print(a1,a2,a3)


#Python program to sort files by date



# program to get the details of math module.
import math
math_ls = dir(math)
print(math_ls)


#program to calculate midpoints of a line
x1 = 2
y1 = 2

x2 = 4
y2 = 4

x_line = (x1+x2)/2
y_line = (y1+y2)/2
print(x_line,y_line)


#program to get the copyright information and write Copyright information in Python code
import sys
print("\nPython Copyright Information")
print(sys.copyright)
print()



#program to get the command-line arguments (name of the script, the number of arguments, arguments) passed to a script
import sys
print("This is the name/path of the script:"),sys.argv[0]
print("Number of arguments:",len(sys.argv))
print("Argument List:",str(sys.argv))



#program to test whether the system is a big-endian platform or little-endian platform.
import sys
print()
if sys.byteorder == "little":
    print("Little-endian platform.")
else:

    print("Big-endian platform.")
print()


#program to find the available built-in modules
#help("modules")


#program to get the size of an object in bytes
import sys
a = "Anish"
b = "Dhiman"
c = 9459336612

print("size of a is ")
print(sys.getsizeof(a))
print("size of b is ")
print(sys.getsizeof(b))
print("size of c is ")
print(sys.getsizeof(c))


#program to get the current value of the recursion limit.
import sys
print("the recursion limit is ")
print(sys.getrecursionlimit())



#program to concatenate N strings
x = ["Anish",'Dhiman','DeVops']


d = ' '. join(x)
print(d)

#program to calculate the sum of all items of a container (tuple, list, set, dictionary).
# creating a list
# list1 = [11, 5, 17, 18, 23]
 
# # using sum() function
# total = sum(list1)
 
# # printing total value
# print("Sum of all elements in given list: ", total)


# program to test whether all numbers of a list is greater than a certain number
num = [2, 3, 4, 5]
print()
print(all(x > 1 for x in num))
print(all(x > 4 for x in num))
print()


#program to count the number occurrence of a specific character in a string
string = "Hey this is Anish Dhiman"
count = string.count('i')
print(count)


# program to check whether a file path is a file or a directory
import os  
path="Asgnment.py"  
if os.path.isdir(path):  
    print("\nIt is a directory")  
elif os.path.isfile(path):  
    print("\nIt is a normal file") 
else :
    print("It is a special file")


#program to get the ASCII value of a character
print(ord('a'))
print(ord('A'))
print(ord('f'))


#program to get the size of a file
import os
file_size = os.path.getsize('asgnment.py')
print(file_size)



#Given variables x=30 and y=20, write a Python program to print "30+20=50"
x = 30
y = 20
c = x + y
print(f"{x} + {y} = " , c)


#Python program to perform an action if a condition is true.
n=1
if n == 1:
   print("\nFirst day of a Month!")



#program to create a copy of its own source code
def file_copy(src, dest):
    with open(src) as f, open(dest, 'w') as d:
        d.write(f.read())
        file_copy("testvpc.tf", "z.py")
        with open('z.py', 'r') as filehandle:
            for line in filehandle:
                print(line, end = '')



#Python program to swap two variables
a = 5
b = 8
a,b = b,a

print(a)
print(b)



#program to define a string containing special characters in various forms
print("\#{'}${\"}@/")
print("\#{'}${"'"'"}@/")
print(r"""\#{'}${"}@/""")
print('\#{\'}${"}@/')
print('\#{'"'"'}${"}@/')
print(r'''\#{'}${"}@/''')



# program to get the Identity, Type, and Value of an object
a = 5
print(type(a))
print(id(a))
print(a)


# program to convert a byte string to a list of integers
X = b'Anish Dhiman'
print(list(X))


#program to check whether a string is numeric
str = 'Anish'
#str = '123'
try:
    i = float(str)
except (ValueError, TypeError):
    print('\nNot numeric')


# program to print the current call stack. 


#program to list the special variables used within the language


#program to get the system time.
import time
print(time.ctime())



# program to clear the screen or terminal
# import os
# os.system('cls')

#program to get the name of the host on which the routine is running
import socket
host_name = socket.gethostname()
print("Host name:", host_name)


#program to access and print a URL's content to the console
from http.client import HTTPConnection
conn = HTTPConnection("w3resource.com")
conn.request("GET", "/")  
result = conn.getresponse()
# retrieves the entire contents.  
contents = result.read() 
print(contents)

#program to get system command output
import subprocess
# file and directory listing
returned_text = subprocess.check_output("dir", shell=True, universal_newlines=True)
print("dir command to list file and directory")
print(returned_text)


#program to extract the filename from a given path
import os 
print(os.path.basename('/users/system1/student1/homework-1.py'))


#program to get the effective group id, effective user id, real group id, a list of supplemental group ids associated with the current process.


# program to get the users environment
import os
print(os.environ)


#program to divide a path on the extension separator
import os.path
for path in [ 'test.txt', 'filename', '/user/system/test.txt', '/', '' ]:
    print(path, os.path.splitext(path))


#program to retrieve file properties
import os.path
import time
print('asgnment.py')
print(time.ctime(os.path.getatime('asgnment.py')))
print(time.ctime(os.path.getmtime('asgnment.py')))
print(time.ctime(os.path.getctime('asgnment.py')))


# program to find path refers to a file or directory when you encounter a path name
import os.path

for file in [ __file__, os.path.dirname(__file__), '/', './broken_link']:
    print('File        :', file)
    print('Absolute    :', os.path.isabs(file))
    print('Is File?    :', os.path.isfile(file))
    print('Is Dir?     :', os.path.isdir(file))
    print('Is Link?    :', os.path.islink(file))
    print('Exists?     :', os.path.exists(file))
    print('Link Exists?:', os.path.lexists(file))


# program to check if a number is positive, negative or zero
# a  = int(input("enter number"))
# if a > 0:
#     print("Positive number")
# elif a < 0:
#     print("Negative number")
# elif a == 0:
#     print("Zero")

# program to get numbers divisible by fifteen from a list using an anonymous function
num_list = [45, 55, 60, 37, 100, 105, 220]
# use anonymous function to filter
result = list(filter(lambda x: (x % 15 == 0), num_list))
print("Numbers divisible by 15 are",result)


# program to make file lists from current directory using a wildcard


#program to remove the first item from a specified list.
name = ['rahul','Anish','sumit','shubham','rajat']
print(name)

del name[0]
print(name)



# program to input a number, if it is not a number generates an error message.
# while True:
#     try:
#         a = int(input("enter number "))
#         break
#     except ValueError:
#         print("This is not a number")



#program to filter the positive numbers from a list.
list = [2,4,3,-23,-43,5,-57,60]
for i in list:
    if i > 0:
        print(i)


# program to compute the product of a list of integers (without using for loop)
from functools import reduce
nums = [10, 20, 30,]
print("Original list numbers:")
print(nums)
nums_product = reduce( (lambda x, y: x * y), nums)
print(nums_product)


#program to print Unicode characters
str = u'\u0050\u0079\u0074\u0068\u006f\u006e \u0045\u0078\u0065\u0072\u0063\u0069\u0073\u0065\u0073 \u002d \u0077\u0033\u0072\u0065\u0073\u006f\u0075\u0072\u0063\u0065'
print(str)

#program to prove that two string variables of same value point same memory location
s1 = "Anish"
s2 = "Anish"

print(hex(id(s1)))
print(hex(id(s2)))


# program to create a bytearray from a list.
nums = [10, 20, 56, 35, 17, 99]
# Create bytearray from list of integers.
values = bytearray(nums)
for x in values:
     print(x)



#program to round a floating-point number to specified number decimal places
order_amt = 212.374
print('\nThe total order amount comes to %f' % order_amt)
print('The total order amount comes to %.2f' % order_amt)


# program to format a specified string limiting the length of a string
str_num = "1234567890"
print("Original string:",str_num)
print('%.6s' % str_num)
print('%.9s' % str_num)
print('%.10s' % str_num)



# program to determine whether variable is defined or not.
try:
  x = 1
except NameError:
  print("Variable is not defined....!")
else:
  print("Variable is defined.")
try:
  y
except NameError:
  print("Variable is not defined....!")
else:
  print("Variable is defined.")




#program to empty a variable without destroying it.

n = 20
d = {"x":200}
l = [1,3,5]
t= (5,7,8)
print(type(n)())
print(type(d)())
print(type(l)())
print(type(t)())


#program to determine the largest and smallest integers, longs, floats
import sys
print("float info ", sys.float_info)
print("Integer info ",sys.int_info)
print("maximum size of integer ",sys.maxsize)



#program to check whether multiple variables have the same value
x = 10
y = 10
z = 10
if x == y ==z:
    print("All the values are equal")
else:
    print("Not Equal")


#program to sum of all counts in a collections
list = [1,2,3,4,4,4,5,56]
print(len(list))



#program to get the actual module object for a given object
from inspect import getmodule
from math import factorial
print(getmodule(factorial))


#program to check whether an integer fits in 64 bits
int_val = 55

if int_val.bit_length() <= 63:
    print("Yes, fites in 64 bits.")
    print(int_val.bit_length(), "is the bit leangth")
else: 
    print("Not fit in 64 bits. ")
    print(int_val.bit_length(), "is the bit leangth")



#program to check whether lowercase letters exist in a string.
str = 'sdfgSDF456'
for i in str:
    if i == i.lower():
        print("Yes it contains lower cases")
        break
    else:
        print("Doesn't contain any lower case")
# program to add leading zeroes to a string
str = '123.89' 
print(str)
str=str.ljust(8,'0')
print(str)

str = str.ljust(10,'0')
print(str)

str = '123'
str = str.rjust(8,'0')
print(str)



#program to use double quotes to display strings
import json
print(json.dumps({'Alex': 1, 'Suresh': 2, 'Agnessa': 3}))



#program to split a variable length string into variables
var_list = ['a', 'b', 'c']
x, y, z = (var_list + [None] * 3)[:3]
print(x, y, z)
var_list = [100, 20.25]
x, y = (var_list + [None] * 2)[:2]
print(x, y)


#program to list home directory without absolute path
import os
print(os.path.expanduser('~'))



# program to calculate the time runs (difference between start and current time) of a program
from timeit import default_timer
def timer(n):
    start = default_timer()
    # some code here
    for row in range(0,n):
        print(row)
    print(default_timer() - start)

timer(5)
timer(15)


#program to input two integers in a single line
# print("Input the value of x & y")
# x, y = map(int, input().split())
# print("The value of x & y are: ",x,y)



#program to print a variable without spaces between values
x = 97
print(f'Values of x is {x}')

# program to find files and skip directories of a given directory


# program to extract single key-value pair of a dictionary in variables
dict = {'name':'Anish'}
(x,y) ,= dict.items()
print(x)
print(y)


# Python program to convert true to 1 and false to 0.
x = 'true'
x = int(x == 'true')
print(x)
x = 'abcd'
x = int(x == 'true')
print(x)

 

#Python program to valid a IP address. 
import socket
ip = '10.8.21.51'
try:
    socket.inet_aton(ip)
    print("Correct IP")
except:
    print("Incorrect")


#Write a Python program to convert an integer to binary keep leading zeros
n = 15
print(format(n , '08b'))



# program to convert decimal to hexadecimal
x = 30
print(format(x, '02x'))
x = 4
print(format(x, '02x'))


#program to determine if the python shell is executing in 32bit or 64bit mode on operating system
import struct
print(struct.calcsize("P") * 8)


#program to check whether a variable is integer or string.
def isNumber(x):
    if type(x) == int:
         return True
    else:
         return False
input1 = 122
input2 = '122'
 
# Function Call
 
# for input1
if isNumber(input1):
    print("Integer")
else:
    print("String")
 
# for input2
if isNumber(input2):
    print("Integer")
else:
    print("String")


# program to test if a variable is a list or tuple or a set.
x = ('Anish','Dhiman', 1)
if type(x) is list:
    print('x is a list')
elif type(x) is set:
    print('x is a set')
elif type(x) is tuple:
    print('x is a tuple')    
else:
    print('not a list,not a set and not a tuple')



#program to find the location of Python module sources.
import imp
module = 'os'
print("Location ")
print(imp.find_module(module))


#function to check whether a number is divisible by another number. Accept two integers values form the user. 
def multiple(a,b):
    	return True if a%b == 0 else False
print(multiple(45, 3))
print(multiple(7, 2))



#Python function to find the maximum and minimum numbers from a sequence of numbers
list = [1,3,213,4,3,5,62,23]
print(min(list))
print(max(list))



#function that takes a positive integer and returns the sum of the cube of all the positive integers smaller than the specified number.
n = 12
s = 0 
while n > 0:
    n -=1
    s += n**3
print(s)


#function to check whether a distinct pair of numbers whose product is odd present in a sequence of integer values
def num(list):
    c=0
    for i in list:
        if i != 0:
            c=c+1
    if c >= 2:
        print("True")
    else: 
        print("False")
num([2,4,24,5,3,34,35])