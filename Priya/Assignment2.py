#1. Write a Python function that takes a sequence of numbers and determines whether all the numbers are different from each other.
# def test_distinct(data):
#       if len(data) == len(set(data)):
#         return True
#       else:
#         return False;
# print(test_distinct([1,5,7]))
# print(test_distinct([2,4,5,5,7]))

#2. Write a Python program to create all possible strings by using 'a', 'e', 'i', 'o', 'u'. Use the characters exactly once.
# import random
# char_list = ['a','e','i','o','u']
# random.shuffle(char_list)
# print(''.join(char_list))

#3. Write a Python program to remove and print every third number from a list of numbers until the list becomes empty.
# def remove_nums(int_list):
#   position = 3 - 1                           #(#list starts with 0 index)
#   idx = 0
#   len_list = (len(int_list))
#   while len_list>0:
#     idx = (position+idx)%len_list
#     print(int_list.pop(idx))                  #(Python list pop() is an inbuilt function in Python that removes and returns the last value from the List or the given index value. )
#     len_list -= 1
# nums = [10,20,30,40,50,60,70,80,90]
# remove_nums(nums)

#5. Write a Python program to create the combinations of 3 digit combo
# numbers = []
# for num in range(1000):
#   num=str(num).zfill(3)
# print(num)
# numbers.append(num)

#6. Write a Python program to print a long text, convert the string to a list and print all the words and their frequencies.
# string_words = '''India Republic Day is celebrated on 26 January every year. It was 1950 when Dr. Rajendra Prasad our first president hoisted the tricolor on Rajpath, Delhi. Our first chief guest was the President of Indonesia, Mr. Sukarno. Similarly, in 2021 Boris Johnson, Prime Minister of the United Kingdom was invited as a guest of honor but the planning has been recently canceled due to the corona crisis. Every year we invite various famous personalities to be a part of our celebration.

# We have been celebrating this occasion since the year 1950 and it has been declared a national holiday. We celebrate this day because we got our constitution on this day. It took 2 years, 11 months, and 18 days to make our constitution and was completed by 26 November 1949. We also celebrate 26 November as our Constitution day. On 26 January 1950, it was announced to enforce our Constitution for the first time.

# We celebrate this occasion with great enthusiasm and Delhi is the center of the Republic Day celebration. India will celebrate its 73rd Republic Day in the year 2022. The cultural programs will be fewer in number and protocols for COVID-19 will be followed strictly.

# The programme on Rajpath includes a small Parade by various armed forces that will be fewer in number. Children under the age of 15 are strictly prohibited to attend the ceremony. People every year visit Delhi to see this programme but this year only a few spectators are allowed to watch the event to avoid overcrowding amid the pandemic. We can also watch the live telecast of the programme on the national channel Doordarshan.

# Generally, schools also celebrate this occasion and organize various programmes. People all over India celebrate this event by hoisting the flag and distributing sweets. Sometimes they also wear tricolors and play patriotic songs and enjoy their day. This year the republic day celebration will be done in the pandemic situation and therefore the way of celebrating the event is changed. It is necessary to remain safe rather than taking risks.'''
# word_list = string_words.split()

# word_freq = [word_list.count(n) for n in word_list]

# print("String:\n {} \n".format(string_words))
# print("List:\n {} \n".format(str(word_list)))
# print("Pairs (Words and Frequencies:\n {}".format(str(list(zip(word_list, word_freq)))))

#7. Write a Python program to count the number of each character of a given text of a text file.
# import collections
# import pprint
# file_input = input('File Name: ')
# with open(file_input, 'r') as info:
#   count = collections.Counter(info.read().upper())
#   value = pprint.pformat(count)
# print(value)

# 9. Write a Python program to get a list of locally installed Python modules.
# import pkg_resources
# installed_packages = pkg_resources.working_set
# installed_packages_list = sorted(["%s==%s" % (i.key, i.version)
#      for i in installed_packages])
# for m in installed_packages_list:
#     print(m)


#10. Write a Python program to display some information about the OS where the script is running.
# import platform as pl
# os_profile = [
#         'machine',
#         'node',
#         'platform',
#         'processor',
#         'python_build',
#         'python_compiler',
#         'python_version',
        
#         'system',
#         'uname',
#         'version',
#     ]
# for key in os_profile:
#   if hasattr(pl, key):  
#     print(key +  ": " + str(getattr(pl, key)()))             #(The getattr() function returns the value of the specified attribute from the specified object.)

#14. Write a Python program to add two positive integers without using the '+' operator. Go to the editor
#Note: Use bit wise operations to add two numbers.
# def Add(x, y):
#     while (y != 0):
#         carry = x & y
 
#         x = x ^ y
#         y = carry << 1
#     return x
# print(Add(156, 32))


#15. Write a Python program to check the priority of the four operators (+, -, *, /).
# from collections import deque
# import re
# __operators__ = "+-/*"
# __parenthesis__ = "()"
# __priority__ = {
#     '+': 0,
#     '-': 0,
#     '*': 1,
#     '/': 1,
# }
# def test_higher_priority(operator1, operator2):
#     return __priority__[operator1] >= __priority__[operator2]
# print(test_higher_priority('*','-'))
# print(test_higher_priority('+','-'))
# print(test_higher_priority('+','*'))
# print(test_higher_priority('+','/'))
# print(test_higher_priority('*','/'))

# 16. Write a Python program to get the third side of right angled triangle from two given sides.
# def pythagoras(opposite_side,adjacent_side,hypotenuse):
#         if opposite_side == str("x"):
#             return ("Opposite = " + str(((hypotenuse**2) - (adjacent_side**2))**0.5))
#         elif adjacent_side == str("x"):
#             return ("Adjacent = " + str(((hypotenuse**2) - (opposite_side**2))**0.5))
#         elif hypotenuse == str("x"):
#             return ("Hypotenuse = " + str(((opposite_side**2) + (adjacent_side**2))**0.5))
#         else:
#             return "You know the answer!"
# print(pythagoras(3,4,'x'))
# print(pythagoras(3,'x',5))
# print(pythagoras('x',4,5))
# print(pythagoras(3,4,5))


# 18. Write a Python program to find the median among three given numbers
# x = input("Input the first number ")
# y = input("Input the second number ")
# z = input("Input the third number ")
# print("Median of the above three numbers -")
# if y < x and x < z:   
#     print(x)
# elif z < x and x < y:
#     print(x)
#     elif z < y and y < x:
#     print(y)
# elif x < y and y < z:
#     print(y)  
# elif y < z and z < x:
#     print(z)    
# elif x < z and z < y:
#     print(z)

#21 Write a Python program to find the number of notes (Sample of notes: 10, 20, 50, 100, 200 and 500 ) against a given amount

# def no_notes(a):
#   Q = [500, 200, 100, 50, 20, 10]
#   x = 0
#   for i in range(6):
#     q = Q[i]
#     x += int(a / q)
#     a = int(a % q)
#   if a > 0:
#     x = -1
#   return x
# print(no_notes(880))
#print(no_notes(1000))

#24 Write a Python program to find the number of divisors of a given integer is even or odd

# def divisor(n):
#   x = len([i for i in range(1,n+1) if not n % i])
#   return x
# print(divisor(15))
# print(divisor(12))
# print(divisor(9))
# print(divisor(6))


#25 Write a Python program to find the digits which are absent in a given mobile number.

# def absent_digits(n):
#   all_nums = set([0,1,2,3,4,5,6,7,8,9])
#   n = set([int(i) for i in n])
#   n = n.symmetric_difference(all_nums)
#   n = sorted(n)
#   return n
# print(absent_digits([9,8,7,4,6,3,1,8]))

# 32. Write a python program to find heights of the top three building in descending order from eight given buildings

# print("Input the heights of eight buildings:")
# l = [int(input()) for i in range(8)]
# print("Heights of the top three buildings:")
# l = sorted(l)
# print(*l[:4:-1], sep='\n')

#51. Write a Python program to find the difference between the largest integer and the smallest integer which are created by 8 numbers from 0 to 9. 
# The number that can be rearranged shall start with 0 as in 00135668.

# print("Input an integer created by 8 numbers from 0 to 9.:")
# num = list(input())
# print("Difference between the largest and the smallest integer from the given integer:")
# print(int("".join(sorted(num,reverse=True))) - int("".join(sorted(num))))


# 54. if you draw a straight line on a plane, the plane is divided into two regions. For example, if you pull two straight lines in parallel, 
# you get three areas, and if you draw vertically one to the other you get 4 areas.
#Write a Python program to create maximum number of regions obtained by drawing n given straight lines. 

# while True:
#     print("Input number of straight lines (o to exit): ")
#     n=int(input())
#     if n<=0:
#         break
#     print("Number of regions:") 
#     print((n*n+n+2)//2)


#56. Write a Python program to sum of all numerical values (positive integers) embedded in a sentence. 
# import re
# string=input ("user input : ")
# number=re.findall('\d+',string)
# sum=0
# for j in number:
#     sum+=int(j)
# print(sum)


#58. When character are consecutive in a string , it is possible to shorten the character string by replacing the character with a certain rule. For example, 
# in the case of the character string YYYYY, if it is expressed as # 5 Y, it is compressed by one character.
#Write a Python program to restore the original string by entering the compressed string with this rule. However, the # character does not appear in the restored character string.

# def restore_original_str(a1):
#       result = ""
#   ind = 0
#   end = len(a1)
#   while ind < end:
#     if a1[ind] == "#":
#       result += a1[ind + 2] * int(a1[ind + 1])
#       ind += 3
#     else:
#       result += a1[ind]
#       ind += 1
#   return result
# print("Original text:","XY#6Z1#4023")
# print(restore_original_str("XY#6Z1#4023"))
# print("Original text:","#39+1=1#30")
# print(restore_original_str("#39+1=1#30"))


#59. A convex polygon is a simple polygon in which no line segment between two points on the boundary ever goes outside the polygon. 
# Equivalently, it is a simple polygon whose interior is a convex set. In a convex polygon, all interior angles are less than or equal to 180 degrees, while in a strictly convex polygon all interior angles are strictly less than 180 degrees.
#Write a Python program that compute the area of the polygon . The vertices have the names vertex 1, vertex 2, vertex 3, ... vertex n according to the order of edge connections

# def poly_area(c):
#       add = []
#   for i in range(0, (len(c) - 2), 2):
#     add.append(c[i] * c[i + 3] - c[i + 1] * c[i + 2])
#     add.append(c[len(c) - 2] * c[1] - c[len(c) - 1] * c[0])
#     return abs(sum(add) / 2)
# no_sides = int(input('Input number of sides: '))
# cord_data = []
# for z in range(no_sides):
#     print("Side:",z+1)
#     print("Input the Coordinate:")
#     x = int(input('Input Coordinate x:'))
#     y = int(input('Input Coordinate y:'))
#     cord_data.append(x)
#     cord_data.append(y)
# print("\nArea of the Polygon:",poly_area(cord_data))

#60. Internet search engine giant, such as Google accepts web pages around the world and classify them, creating a huge database. The search engines also analyze the search keywords entered by the user and create inquiries for database search. In both cases, complicated processing is carried out in order to realize efficient retrieval, but basics are all cutting out words from sentences.

#Write a Python program to cut out words of 3 to 6 characters length from a given sentence not more than 1024 characters.
# print("Input a sentence (1024 characters. max.)")
# yy = input()
# yy = yy.replace(",", " ")
# yy = yy.replace(".", " ")
# print("3 to 6 characters length of words:")
# print(*[y for y in yy.split() if 3 <= len(y) <= 6])

#61. Arrange integers (0 to 99) as narrow hilltop, as illustrated in Figure 1. Reading such data representing huge, when starting from the top and proceeding according to the next rule to the bottom.
# Write a Python program that compute the maximum value of the sum of the passing integers.

'''import sys
print("Input the numbers (ctrl+d to exit):")
nums = [list(map(int, l.split(","))) for l in sys.stdin]
mvv = nums[0]
for i in range(1, (len(nums)+1)//2):
    rvv = [0]*(i+1)
    for j in range(i):
        rvv[j] = max(rvv[j], mvv[j]+nums[i][j])
        rvv[j+1] = max(rvv[j+1], mvv[j]+nums[i][j+1])
    mvv = rvv
for i in range((len(nums)+1)//2, len(nums)):
    rvv = [0]*(len(mvv)-1)
    for j in range(len(rvv)):
        rvv[j] = max(mvv[j], mvv[j+1]) + nums[i][j]
    mvv = rvv
print("Maximum value of the sum of integers passing according to the rule on one line.") 
print(mvv[0])'''


#62. Write a Python program to find the number of combinations that satisfy p + q + r + s = n 
# where n is a given number <= 4000 and p, q, r, s in the range of 0 to 1000.
'''from collections import Counter
print("Input a positive integer: (ctrl+d to exit)") 
pair_dict = Counter()
for i in range(2001):
  pair_dict[i] = min(i, 2000 - i) + 1 
while True:
  try:
    n = int(input())
    ans = 0
    for i in range(n + 1):
      ans += pair_dict[i] * pair_dict[n - i]
    print("Number of combinations of a,b,c,d:",ans) 
  except EOFError:
    break'''
    
#63. Write a Python program which adds up columns and rows of given table as shown in the specified figure. Go to the editor
#Input number of rows/columns (0 to exit)
#4
#Input cell value:
# 25 69 51 26
# 68 35 29 54
# 54 57 45 63
# 61 68 47 59
# Result:
# 25 69 51 26 171
# 68 35 29 54 186
# 54 57 45 63 219
# 61 68 47 59 235
# 208 229 172 202 811
# Input number of rows/columns (0 to exit)
'''while True:
    print("Input number of rows/columns (0 to exit)")
    n = int(input())
    if n == 0:
        break
    print("Input cell value:")
    x = []
    for i in range(n):
        x.append([int(num) for num in input().split()])

    for i in range(n):
        sum = 0
        for j in range(n):
            sum += x[i][j]
        x[i].append(sum)

    x.append([])
    for i in range(n + 1):
        sum = 0
        for j in range(n):
            sum += x[j][i]
        x[n].append(sum)
    print("Result:")
    for i in range(n + 1):
        for j in range(n + 1):
            print('{0:>5}'.format(x[i][j]), end="")
        print()'''
    
#64. Given a list of numbers and a number k, write a Python program to check whether the sum of any two numbers from the list is equal to k or not.ll    
'''def check_sum(nums, k):   
    for i in range(len(nums)):
        for j in range(i+1, len(nums)):
            if nums[i] + nums[j] == k:
                return True
    return False
print(check_sum([12, 5, 0, 5], 10))
print(check_sum([20, 20, 4, 5], 40))
print(check_sum([1, -1], 0))
print(check_sum([1, 1, 0], 0)) 
