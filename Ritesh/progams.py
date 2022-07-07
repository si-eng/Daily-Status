#1. Write a Python program to print the following string in a specific format.
# "Twinkle, twinkle, little star, How I wonder what you are! Up above the world so high, Like a diamond in the sky. Twinkle, twinkle, little star, 
# How I wonder what you are"

print("Twinkle, twinkle, little star, \n\tHow I wonder what you are! \n\t\tUp above the world so high, \n\t\tLike a diamond in the sky. \nTwinkle, twinkle, little star, \n\tHow I wonder what you are!")

#2. Write a Python program to get the Python version you are using
import sys
print("Python version")
print (sys.version)

#3. Write a Python program to display the current date and time.

from datetime import datetime

# datetime object containing current date and time
now = datetime.now()
 
print("now =", now)

# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print("date and time =", dt_string)	

#4. Write a Python program which accepts the radius of a circle from the user and compute the area.

from math import pi

r = float(input ("Enter radius of circle : "))

print ("Area of the circle is: " + str(pi * r**2))

#5. Write a Python program which accepts the user's first and last name and print them in reverse order with a 
# space between them.

fname = input("Input your First Name : ")
lname = input("Input your Last Name : ")
print ("Hello  " + lname + " " + fname)

#6 Write a Python program to test whether a number is within 100 of 1000 or 2000

def near_thousand(n):
      return ((abs(1000 - n) <= 100) or (abs(2000 - n) <= 100))
print(near_thousand(1000))
print(near_thousand(900))
print(near_thousand(800))   
print(near_thousand(2200))

#7 Write a Python program to calculate the sum of three given numbers, 
# if the values are equal then return three times of their sum
def sum_thrice(x, y, z):

     sum = x + y + z
  
     if x == y == z:
      sum = sum * 3
     return sum

print(sum_thrice(1, 2, 3))
print(sum_thrice(3, 3, 3))

#8 Write a Python program to get a string which is n (non-negative integer) copies of a given string.
def larger_string(str, n):
   result = ""
   for i in range(n):
      result = result + str
   return result

print(larger_string('abc', 2))
print(larger_string('.py', 3))

#9 Write a Python program to find whether a 
# given number (accept from the user) is even or odd, print out an appropriate message to the user.

num = int(input("Enter a number: "))
mod = num % 2
if mod > 0:
    print("This is an odd number.")
else:
    print("This is an even number.")

#10 Write a Python program to count the number 4 in a given list

def list_count_4(nums):
  count = 0  
  for num in nums:
    if num == 4:
      count = count + 1

  return count

print(list_count_4([1, 4, 6, 7, 4]))
print(list_count_4([1, 4, 6, 4, 7, 4]))

#11 Write a Python program to test whether a passed letter is a vowel or not.

def is_vowel(char):
    all_vowels = 'aeiou'
    return char in all_vowels
print(is_vowel('c'))
print(is_vowel('e'))

#12 Write a Python program to create a histogram from a given list of integers.

def histogram( items ):
    for n in items:
        output = ''
        times = n
        while( times > 0 ):
          output += '*'
          times = times - 1
        print(output)

histogram([2, 3, 6, 5])

#13 Write a Python program to concatenate all elements in a list into a string and return it.
def concatenate_list_data(list):
    result= ''
    for element in list:
        result += str(element)
    return result

print(concatenate_list_data([1, 5, 12, 2]))

#14 Write a Python program that will accept the base and height of a triangle and compute the area.

b = int(input("Input the base : "))
h = int(input("Input the height : "))

area = b*h/2

print("area = ", area)

#15 Write a Python program to compute the greatest common divisor (GCD) of two positive integers.

def gcd(x, y):
   gcd = 1   
   if x % y == 0:
       return y   
   for k in range(int(y / 2), 0, -1):
       if x % k == 0 and y % k == 0:
           gcd = k
           break 
   return gcd
print("GCD of 12 & 17 =",gcd(12, 17))
print("GCD of 4 & 6 =",gcd(4, 6))
print("GCD of 336 & 360 =",gcd(336, 360))

#16 Write a Python program to get the least common multiple (LCM) of two positive integers.
def lcm(x, y):
  if x > y:
      z = x
  else:
      z = y
  while(True):
      if((z % x == 0) and (z % y == 0)):
          lcm = z
          break
      z += 1
  return lcm
print(lcm(4, 6))
print(lcm(15, 17))

#17 Write a Python program to sum of three given integers. However, if two values are equal sum will be zero.

def sum_three(x, y, z):
    if x == y or y == z or x==z:
        sum = 0
    else:
        sum = x + y + z
    return sum
print(sum_three(2, 1, 2))
print(sum_three(3, 2, 2))
print(sum_three(2, 2, 2))
print(sum_three(1, 2, 3))

#18 Write a Python program to sum of two given integers. However, if the sum is between 15 to 20 it will return 20.
def sum(x, y):
    sum = x + y
    if sum in range(15, 20):
        return 20
    else:
        return sum

print(sum(10, 6))
print(sum(10, 2))
print(sum(10, 12))

#19 Write a Python program that will return true if the two given integer values are equal or their sum or difference is 5

def test_number5(x, y):
   if x == y or abs(x-y) == 5 or (x+y) == 5:
       return True
   else:
       return False
print(test_number5(7, 2))
print(test_number5(3, 2))
print(test_number5(2, 2))
print(test_number5(7, 3))
print(test_number5(27, 53))

#20 Write a Python program to add two objects if both objects are an integer type.

def add_numbers(a, b):
   if not (isinstance(a, int) and isinstance(b, int)):
       return "Inputs must be integers!"
   return a + b
print(add_numbers(10, 20))
print(add_numbers(10, 20.23))
print(add_numbers('5', 6))
print(add_numbers('5', '6'))

#21 Write a Python program to display your details like name, age, address in three different lines.

def personal_details():
    name, age = "Simon", 19
    address = "Bangalore, Karnataka, India"
    print("Name: {}\nAge: {}\nAddress: {}".format(name, age, address))

personal_details()

#22 Write a Python program to solve (x + y) * (x + y)
x, y = 4, 3
result = x * x + 2 * x * y + y * y
print("({} + {}) ^ 2) = {}".format(x, y, result))

#23 Write a Python program to compute the distance between the points (x1, y1) and (x2, y2).

import math
p1 = [4, 0]
p2 = [6, 6]
distance = math.sqrt( ((p1[0]-p2[0])**2)+((p1[1]-p2[1])**2) )

print(distance)

#24 Write a Python program to check whether a file exists
import os.path
print(os.path.isfile('main.txt'))
print(os.path.isfile('main.py'))

#25 Write a Python program to get OS name, platform and release information
import platform
import os
print("Name of the operating system:",os.name)
print("\nName of the OS system:",platform.system())
print("\nVersion of the operating system:",platform.release())

#26 Write a Python program to locate Python site-packages
import site; 
print(site.getsitepackages())

#27 Write a Python program to call an external command.
from subprocess import call
call(["ls", "-l"])

#28 Write a python program to get the path and name of the file that is currently executing.
import os
print("Current File Name : ",os.path.realpath(__file__))

#29 Write a Python program to find out the number of CPUs using
import multiprocessing
print(multiprocessing.cpu_count())

#30 Write a Python program to parse a string to Float or Integer
n = "246.2458"
print(float(n))
print(int(float(n)))

#31 Write a Python program to list all files in a directory in Python
from os import listdir
from os.path import isfile, join
files_list = [f for f in listdir('/home/students') if isfile(join('/home/students', f))]
print(files_list);

#32 Write a Python program to print without newline or space.
for i in range(0, 10):
    print('*', end="")
print("\n")
	
#33 Write a Python program to print to stderr
from __future__ import print_function
import sys

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

eprint("abc", "efg", "xyz", sep="--")

#34 Write a python program to access environment variables
import os
# Access all environment variables 
print('*----------------------------------*')
print(os.environ)
print('*----------------------------------*')
# Access a particular environment variable 
print(os.environ['HOME'])
print('*----------------------------------*')
print(os.environ['PATH'])
print('*----------------------------------*')

#35 Write a Python program to get the current username
import getpass
print(getpass.getuser())

#36 Write a Python program to sum of the first n positive integers.
n = int(input("Input a number: "))
num = (n * (n + 1)) / 2
print("Sum of the first", n ,"positive integers:", num)

#37 Write a Python program to convert height (in feet and inches) to centimeters

print("Input your height: ")
h_ft = int(input("Feet: "))
h_inch = int(input("Inches: "))

h_inch += h_ft * 12
h_cm = round(h_inch * 2.54, 1)

print("Your height is : %d cm." % h_cm)

#38 Write a Python program to convert all units of time into seconds.

days = int(input("Input days: ")) * 3600 * 24
hours = int(input("Input hours: ")) * 3600
minutes = int(input("Input minutes: ")) * 60
seconds = int(input("Input seconds: "))

time = days + hours + minutes + seconds

print("The  amounts of seconds", time)

#39 Write a Python program to calculate sum of digits of a number.

num = int(input("Input a four digit numbers: "))
x  = num //1000
x1 = (num - x*1000)//100
x2 = (num - x*1000 - x1*100)//10
x3 = num - x*1000 - x1*100 - x2*10
print("The sum of digits in the number is", x+x1+x2+x3)

#40. Write a Python program to get the details of math module

# Imports the math module
import math            
#Sets everything to a list of math module
math_ls = dir(math) # 
print(math_ls)

#41 Write a Python program to get the copyright information and write Copyright information in Python code.

import sys
print("\nPython Copyright Information")
print(sys.copyright)
print()

#42. Write a Python program to find the available built-in modules.
import sys
import textwrap
module_name = ', '.join(sorted(sys.builtin_module_names))
print(textwrap.fill(module_name, width=70))

#43. Write a Python program to concatenate N strings.
list_of_colors = ['Red', 'White', 'Black']  
colors = '-'.join(list_of_colors)
print()
print("All Colors: "+colors)
print()

#44. Write a Python program to count the number of occurrence of a specific character in a string.
s = "The world is my territory."  
print("Original String:")
print(s)
print("Number of occurrence of 'r' in the said string:")
print(s.count("r"))

#45 Write a Python program to get the size of a file.

import os
file_size = os.path.getsize("abc.txt")
print("\nThe size of abc.txt is :",file_size,"Bytes")
print()

#46 Write a Python program to swap two variables.
a = 30
b = 20
print("\nBefore swap a = %d and b = %d" %(a, b))
a, b = b, a
print("\nAfter swaping a = %d and b = %d" %(a, b))
print()

#47. Write a Python program to get the users environment.

import os
print()
print(os.environ)
print()

#48. Write a Python program to filter the positive numbers from a list.

nums = [34, 1, 0, -23, 12, -88]
print("Original numbers in the list: ",nums)
new_nums = list(filter(lambda x: x >0, nums))
print("Positive numbers in the said list: ",new_nums)

#49. Write a Python program to check whether an integer fits in 64 bits
int_val = 30
if int_val.bit_length() <= 63:
    print((-2 ** 63).bit_length())
    print((2 ** 63).bit_length())
	
#49 Write a Python program to check whether lowercase letters exist in a string.

str1 = 'B3ERUSiYhd789'
print(any(i.islower() for i in str1))

#50 Write a Python program to input two integers in a single line.

print("Input the value of x & y")
x, y = map(int, input().split())
print("The value of x & y are: ",x,y)









