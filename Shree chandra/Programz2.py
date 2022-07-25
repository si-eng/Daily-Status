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







