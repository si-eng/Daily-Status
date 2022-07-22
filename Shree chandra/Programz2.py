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





