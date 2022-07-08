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