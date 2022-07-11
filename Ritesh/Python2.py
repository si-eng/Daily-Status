#1. Write a Python function that takes a sequence of numbers and determines whether all the numbers are different from each other.

def x(data):
  if len(data) == len(set(data)):
    return True
  else:
    return False;
print(x([1,5,7,9]))
print(x([2,4,5,5,7,9]))

#2. Write a Python program to create all possible strings by using 'a', 'e', 'i', 'o', 'u'. Use the characters exactly once 

import random
char_list = ['a','e','i','o','u']
random.shuffle(char_list)
print(''.join(char_list))

#5. Write a Python program to create the combinations of 3-digit combo

numbers = []
for num in range(4000):
  num=str(num).zfill(3)
print(num)
numbers.append(num)

#7. Write a Python program to count the number of each character of a given text of a text file.

import collections
import pprint
file_input = input('File Name: ')
with open(file_input, 'r') as info:
  count = collections.Counter(info.read().upper())
  value = pprint.pformat(count)
print(value)

#14 Write a Python program to add two positive integers without using the '+' operator.

def add_without_plus_operator(a, b):
    while b != 0:
        data = a & b
        a = a ^ b
        b = data << 1
    return a
print(add_without_plus_operator(4, 10))
print(add_without_plus_operator(-30, 10))
print(add_without_plus_operator(-10, -20))

#18 Write a Python program to find the median among three given numbers.

a = input("Input the first number")
b = input("Input the second number")
c = input("Input the third number")
print("Median of the above three numbers -")

if b < a and a < c:
    print(a)
elif c < a and a < b:
    print(a)
    
elif c < b and b < a:
    print(b)
elif a < b and b < c:
    print(b)
    
elif b < c and c < a:
    print(c)    
elif a < c and c < b:
    print(c)

#20. Write a Python program to find the number of zeros at the end of a factorial of a given positive number

def factendzero(n):
  x = n // 5
  y = x 
  while x > 0:
    x /= 5
    y += int(x)
  return y
       
print(factendzero(5))
print(factendzero(12))
print(factendzero(100))

#21 Write a Python program to find the number of notes (Sample of notes: 10, 20, 50, 100, 200 and 500 ) against a given amount

def no_notes(a):
  Q = [500, 200, 100, 50, 20, 10]
  x = 0
  for i in range(6):
    q = Q[i]
    x += int(a / q)
    a = int(a % q)
  if a > 0:
    x = -1
  return x
print(no_notes(880))
print(no_notes(1000))

#24 Write a Python program to find the number of divisors of a given integer is even or odd

def divisor(n):
  x = len([i for i in range(1,n+1) if not n % i])
  return x
print(divisor(15))
print(divisor(12))
print(divisor(9))
print(divisor(6))
print(divisor(3))

#25 Write a Python program to find the digits which are absent in a given mobile number.

def absent_digits(n):
  all_nums = set([0,1,2,3,4,5,6,7,8,9])
  n = set([int(i) for i in n])
  n = n.symmetric_difference(all_nums)
  n = sorted(n)
  return n
print(absent_digits([9,8,7,4,6,3,2,1,8]))
