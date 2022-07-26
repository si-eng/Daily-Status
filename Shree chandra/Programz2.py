#2 Write a Python program to create all possible strings by using ‘a’, ‘e’, ‘i’, ‘o’, ‘u’. Use the characters exactly once
"""char_list = ['a','e','i','o','u']
random.shuffle(char_list)
print(''.join(char_list))"""

#1 Write a Python function that takes a sequence of numbers and determines whether all the numbers are different from each other.
"""def test_distinct(data):
  if len(data) == len(set(data)):
    return True
  else:
    return False;
print(test_distinct([1,5,7,9]))
print(test_distinct([2,4,5,5,7,9]))"""

#5 Write a Python program to create the combinations of 3 digit combo
"""numbers = []
for num in range(1000):
 num=str(num).zfill(3)
print(num)
numbers.append(num)"""

#24 4 Write a Python program to find the number of divisors of a given integer is even or odd
"""def divisor(n):
  x = len([i for i in range(1,n+1) if not n % i])
  return x
print(divisor(15))
print(divisor(12))
print(divisor(9))
print(divisor(6))
print(divisor(3))"""

#33 Write a Python program to compute the digit number of sum of two given integers.
"""print("Input two integers(a b): ")
a,b = map(int,input().split(" "))
print("Number of digit of a and b.:")
print(str(a+b))"""

#18 Write a Python program to find the median among three given numbers
"""x = input("Input the first number ")
y = input("Input the second number ")
z = input("Input the third number ")
print("Median of the above three numbers -")
if y < x and x < z:
    print(x)
elif z < x and x < y:
    print(x)
elif z < y and y < x:
    print(y)
elif x < y and y < z:
    print(y)
elif y < z and z < x:
    print(z)
elif x < z and z < y:
    print(z)"""

#7. Write a Python program to count the number of each character of a given text of a text file.
"""import collections
import pprint
file_input = input('File Name: ')
with open(file_input, 'r') as info:
  count = collections.Counter(info.read().upper())
  value = pprint.pformat(count)
print(value)"""

#9 Write a Python program to get a list of locally installed Python modules.
"""import pkg_resources
installed_packages = pkg_resources.working_set
installed_packages_list = sorted(["%s==%s" % (i.key, i.version)
     for i in installed_packages])
for m in installed_packages_list:
    print(m)"""

#144 Write a Python program to convert integer to string.
"""language = "Python"
version = 3.6
print('Language: ' + language + ',' + ' Version: ' + str(version))"""

#4. Write a Python program to add two positive integers without using the '+' operator. Go to the editor
""""def Add(x, y):
    while (y != 0):
        carry = x & y
        x = x ^ y
        y = carry << 1
    return x
print(Add(156, 32))""""

#25 Write a Python program to find the digits which are absent in a given mobile number.
"""def absent_digits(n):
  all_nums = set([0,1,2,3,4,5,6,7,8,9])
  n = set([int(i) for i in n])
  n = n.symmetric_difference(all_nums)
  n = sorted(n)
  return n
print(absent_digits([9,8,3,2,2,0,9,7,6,3]))"""

#46 Write a Python program to that reads a date (from 2016/1/1 to 2016/12/31) and prints the day of the date. Jan. 1, 2016, is Friday. Note that 2016 is a leap year.
"""from datetime import date
print("Input month and date (separated by a single space):")
m, d = map(int, input().split())
weeks = {1:'Monday',2:'Tuesday',3:'Wednesday',4:'Thursday',5:'Friday',6:'Saturday',7:'Sunday'}
w = date.isoweekday(date(2016, m, d))
print("Name of the date: ",weeks[w])"""

#81 Write a Python program to randomly generate a list with 10 even numbers between 1 and 100 inclusive
"""import random
print(random.sample([i for i in range(1,100) if i%2==0], 10))"""

#91 Write a Python program to find the position of the second occurrence of a given string in another given string. If there is no such string return -1.
"""def find_string(txt, str1):
	return txt.find(str1, txt.find(str1)+1)
print(find_string("The quick brown fox jumps over the lazy dog", "the"))
print(find_string("the quick brown fox jumps over the lazy dog", "the"))"""

#115 Write a Python program to generate and prints a list of numbers from 1 to 10.
"""nums = range(1,10)
print(list(nums))
print(list(map(str, nums)))"""

#140 Write a Python program to convert all items in a given list to float values
"""nums = ['0.49', '0.54', '0.54', '0.54', '0.54', '0.54', '0.55', '0.54', '0.54',  '0.54', 
 '0.55', '0.55', '0.55', '0.54', '0.55', '0.55', '0.54', '0.55', '0.55', '0.54']
print("Original list:")
print(nums)
print("\nList of Floats:")
nums_of_floats = []
for item in nums:
    nums_of_floats.append(float(item))
print(nums_of_floats)"""

#98 Write a Python program to check whether a sequence of numbers has an increasing trend or not.
"""def increasing_trend(nums):
    if (sorted(nums) == nums):
        return True
    else:
        return False
print(increasing_trend([1,2,3,4]))
print(increasing_trend([1,2,5,3,4]))
print(increasing_trend([-1,-2,-3,-4]))
print(increasing_trend([-4,-3,-2,-1]))
print(increasing_trend([1,2,3,4,0]))"""


#100 Write a Python program to compute the sum of all items of a given array of integers where each integer is multiplied by its index. Return 0 if there is no number
"""def sum_index_multiplier(nums):
	return sum(j*i for i, j in enumerate(nums))
print(sum_index_multiplier([1,2,3,4]))
print(sum_index_multiplier([-1,-2,-3,-4]))
print(sum_index_multiplier([]))"""


#92 Write a Python program to compute cumulative sum of numbers of a given list.
"""def nums_cumulative_sum(nums_list):
  return [sum(nums_list[:i+1]) for i in range(len(nums_list))]
print(nums_cumulative_sum([10, 20, 30, 40, 50, 60, 7]))
print(nums_cumulative_sum([1, 2, 3, 4, 5]))
print(nums_cumulative_sum([0, 1, 2, 3, 4, 5]))"""


#101 Write a Python program to find the name of the oldest student from a given dictionary containing the names and ages of a group of students 
"""def oldest_student(students):
	return max(students, key=students.get)
print(oldest_student({"Charlie": 12, "Kriti": 11, 
                      "Sara": 14, "Falguni pathak": 11, 
                      "Nida rafiq": 15})) 
print(oldest_student({"Nida rafiq": 12, "Jackey john": 12.2, 
                      "Sameer": 12.4, "Prem raichand": 12.6, 
                      "Bobby": 12.7}))""" 

#103 Write a Python program to check whether two given lines are parallel or not.
"""def parallel_lines(line1, line2):
  return line1[0]/line1[1] == line2[0]/line2[1]
print(parallel_lines([2,3,4], [2,3,8]))
print(parallel_lines([2,3,4], [4,-3,8]))   """ 

#121 Write a Python program to create a coded string from a given string, using specified formula.
"""def test(str):
	return str.translate(str.maketrans('PTSHA', '90168'))
str = "PHP"
print("Original string: ",str)
print("Coded string: ",test(str))
str = "JAVASCRIPT"
print("\nOriginal string: ",str)
print("Coded string: ",test(str))"""


#60 Write a Python program to cut out words of 3 to 6 characters length from a given sentence not more than 1024 characters.
"""print("Input a sentence (1024 characters. max.)")
yy = input()
yy = yy.replace(",", " ")
yy = yy.replace(".", " ")
print("3 to 6 characters length of words:")
print(*[y for y in yy.split() if 3 <= len(y) <= 6])"""


#73 Write a Python program to remove the duplicate elements of a given array of numbers such that each element appear only once and return the new length of the given array
"""def remove_duplicates(nums):
    for i in range (len(nums)-1, 0, -1):
        if nums[i] == nums[i-1]:
            del nums[i-1]
    return len(nums)
print(remove_duplicates([0,0,1,1,2,2,3,3,4,4,4]))
print(remove_duplicates([1, 2, 2, 3, 4, 4]))"""


#75 Write a Python program to remove all instances of a given value from a given array of integers and find the length of the new array
"""def remove_element(array_nums, val):
    i = 0
    while i < len(array_nums):
        if array_nums[i] == val:
            array_nums.remove(array_nums[i])
        else:
            i += 1
    return len(array_nums)
print(remove_element([1, 2, 3, 4, 5, 6, 7, 5], 5))
print(remove_element([10,10,10,10,10], 10)) 
print(remove_element([10,10,10,10,10], 20)) 
print(remove_element([], 1))"""


#87 Write a Python program to check whether a given employee code is exactly 8 digits or 12 digits. Return True if the employee code is valid and False if it's not.
"""def is_valid_emp_code(emp_code):
 return len(emp_code) in [8, 12] and emp_code.isdigit()
print(is_valid_emp_code('12345678'))
print(is_valid_emp_code('1234567j'))
print(is_valid_emp_code('12345678j'))
print(is_valid_emp_code('123456789123'))
print(is_valid_emp_code('123456abcdef'))"""


#111 Write a Python program to check whether two given circles (given center (x,y) and radius) are intersecting. Return true for intersecting otherwise false.
"""def is_circle_collision(circle1, circle2):
   x1, y1, r1 = circle1
   x2, y2, r2 = circle2
   distance = ((x1-x2)**2 + (y1-y2)**2)**0.5
   return distance <= r1 + r2
print(is_circle_collision([1,2, 4], [1,2, 8]))
print(is_circle_collision([0,0, 2], [10,10, 5]))"""


#56  Write a Python program to sum of all numerical values embedded in a sentence.
"""import re
string=input ("user input : ")
number=re.findall('\d+',string)
sum=0
for j in number:
    sum+=int(j)
print(sum)"""


#59 A convex polygon is a simple polygon in which no line segment between two points on the boundary ever goes outside the polygon. Equivalently, it is a simple polygon whose interior is a convex set. In a convex polygon, all interior angles are less than or equal to 180 degrees, while in a strictly convex polygon all interior angles are strictly less than 180 degrees.
"""def poly_area(c):
  add = []
  for i in range(0, (len(c) - 2), 2):
    add.append(c[i] * c[i + 3] - c[i + 1] * c[i + 2])
    add.append(c[len(c) - 2] * c[1] - c[len(c) - 1] * c[0])
    return abs(sum(add) / 2)
no_sides = int(input('Input number of sides: '))
cord_data = []
for z in range(no_sides):
    print("Side:",z+1)
    print("Input the Coordinate:")
    x = int(input('Input Coordinate x:'))
    y = int(input('Input Coordinate y:'))
    cord_data.append(x)
    cord_data.append(y)
print("\nArea of the Polygon:",poly_area(cord_data))""" 

#49 Write a Python program which reads the two adjoined sides and the diagonal of a parallelogram and check whether the parallelogram is a rectangle or a rhombus.
"""a = float(input("Enter the side of parallelogram: "))
b = float(input("Enter the another side of parallelogram: "))
c = float(input("Enter diagonal of parallelogram: "))
if c**2 == a**2+b**2 :
    print("This is a rectangle.")
elif a == b:
    print("This is a rhombus.")
else:
    print("not a rectangel or rhombus.")"""

#14 Write a Python program to add two positive integers without using the '+' operator
"""def Add(x, y):
    while (y != 0):
        carry = x & y 
        x = x ^ y
        y = carry << 1
    return x
print(Add(17,5))"""

#26 Write a Python program to compute the summation of the absolute difference of all distinct pairs in a given array 
"""def sum_distinct_pairs(arr):
    result = 0
    i = 0
    while i<len(arr):
        result+=i*arr[i]-(len(arr)-i-1)*arr[i]
        i+=1
    return result
print(sum_distinct_pairs([1,2,3]))
print(sum_distinct_pairs([1,4,5]))"""

#32 Write a python program to find heights of the top three building in descending order from eight given buildings
"""print("Input the heights of eight buildings:")
l = [int(input()) for i in range(8)]
print("Heights of the top three buildings:")
l = sorted(l)
print(*l[:4:-1], sep='\n')"""

#43 Write a Python program to test whether two lines PQ and RS are parallel. The four points are P(x1, y1), Q(x2, y2), R(x3, y3), S(x4, y4)
"""print("Input x1,y1,x2,y2,x3,y3,xp,yp:")
x1, y1,x2, y2, x3, y3, x4, y4 = map(float, input().split())
print('PQ and RS are parallel.' if abs((x2 - x1)*(y4 - y3) - (x4 - x3)*(y2 - y1)) < 1e-10 else 'PQ and RS are not parallel')"""

#51 Write a Python program to find the difference between the largest integer and the smallest integer which are created by 8 numbers from 0 to 9. The number that can be rearranged shall start with 0 as in 00135668
"""print("Input an integer created by 8 numbers from 0 to 9.:")
num = list(input())
print("Difference between the largest and the smallest integer from the given integer:")
print(int("".join(sorted(num,reverse=True))) - int("".join(sorted(num))))"""

#54 Write a Python program to create maximum number of regions obtained by drawing n given straight lines
"""while True:
    print("Input number of straight lines (o to exit): ")
    n=int(input())
    if n<=0:
        break
    print("Number of regions:") 
    print((n*n+n+2)//2)"""










