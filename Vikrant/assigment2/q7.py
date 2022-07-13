import collections

file_input = input('File Name: ')
with open('q6.py', 'r') as info:
  count = collections.Counter(info.read().upper())
  
print(count)