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

#28 Write a Python program to print the length of the series and the series from the given 3rd term, 
# 3rd last term and the sum of a series.

tn = int(input("Input third term of the series:"))
tltn = int(input("Input 3rd last term:"))
s_sum = int(input("Sum of the series:"))
n = int(2*s_sum/(tn+tltn))
print("Length of the series: ",n)


if n-5==0:
  d = (s_sum-3*tn)//6
else:
  d = (tltn-tn)/(n-5)

a = tn-2*d
j = 0
print("Series:")
for j in range(n-1):
  print(int(a),end=" ")
  a+=d
print(int(a),end=" ")

#29 Write a Python program to find common divisors between two numbers in a given pair.

def ngcd(x, y):
    i=1
    while(i<=x and i<=y):
        if(x%i==0 and y%i == 0):
            gcd=i;
        i+=1
    return gcd;
def num_comm_div(x, y):
  n = ngcd(x, y)
  result = 0
  z = int(n**0.5)
  i = 1
  while( i <= z ):
    if(n % i == 0):
      result += 2 
      if(i == n/i):
        result-=1
    i+=1
  return result

print("Number of common divisors: ",num_comm_div(2, 4))
print("Number of common divisors: ",num_comm_div(2, 8))
print("Number of common divisors: ",num_comm_div(12, 24))

#30 Write a Python program to reverse the digits of a given number and add it to the original, If the sum is not a palindrome repeat this procedure.

def rev_number(n):
  x = 0
  while True:
    k = str(n)
    if k == k[::-1]:
      break
    else:
      m = int(k[::-1])
      n += m
      x += 1
  return n 

print(rev_number(1159))
print(rev_number(1256))

#31 Write a Python program to count the number of carry operations for each of a set of addition problems.

def carry_number(x, y):
  ctr = 0
  if(x == 0 and y == 0):
    return 0
  z = 0  
  for i in reversed(range(10)):
      z = x%10 + y%10 + z
      if z > 9:
        z = 1
      else:
        z = 0
      ctr += z
      x //= 10
      y //= 10
      
  if ctr == 0:
    return "No carry operation."
  elif ctr == 1:
    return ctr
  else:
    return ctr
print(carry_number(158, 284))
print(carry_number(8, 4))

#32 Write a python program to find heights of the top three building in descending order from eight given buildings.
print("Input the heights of eight buildings:")
l = [int(input()) for i in range(8)]
print("Heights of the top three buildings:")
l = sorted(l)
print(*l[:4:-1], sep='\n')

#33 Write a Python program to compute the digit number of sum of two given integers.
print("Input two integers(a b): ")
a,b = map(int,input().split(" "))
print("Number of digit of a and b.:")
print(len(str(a+b)))

#34 Write a Python program to check whether three given lengths (integers) of three sides form a right triangle.
#  Print "Yes" if the given sides form a right triangle otherwise print "No".
print("Input three integers(sides of a triangle)")
int_num = list(map(int,input().split()))
x,y,z = sorted(int_num)
if x**2+y**2==z**2:
    print('Yes')
else:
    print('No')

#35 Write a Python program which solve the equation:
#ax+by=c
#dx+ey=f
#Print the values of x, y where a, b, c, d, e and f are given.

print("Input the value of a, b, c, d, e, f:")
a, b, c, d, e, f = map(float, input().split())
n = a*e - b*d
print("Values of x and y:")
if n != 0:
    x = (c*e - b*f) / n
    y = (a*f - c*d) / n
    print('{:.3f} {:.3f}'.format(x+0, y+0))

#37 Write a Python program which reads an integer n and 
# find the number of combinations of a,b,c and d (0 ≤ a,b,c,d ≤ 9) where (a + b + c + d) will be equal to n.

import itertools
print("Input the number(n):")
n=int(input())
result=0
for (i,j,k) in itertools.product(range(10),range(10),range(10)):
    result+=(0<=n-(i+j+k)<=9)
print("Number of combinations:",result)

#38 Write a Python program to print the number of prime numbers which are less than or equal to a given integer.

primes = [1] * 800
primes[0] = 0
 
for i in range(3, 1500, 2):
    if primes[i // 2]:
        primes[(i * i) // 2::i] = [0] * len(primes[(i * i) // 2::i])
 
print("Input the number(n):")
n=int(input())
if n < 4:
    print("Number of prime numbers which are less than or equal to n.:",n - 1)
else:
    print("Number of prime numbers which are less than or equal to n.:",sum(primes[:(n + 1) // 2]) + 1)

#39 Write a program to compute the radius and the central coordinate (x, y) of a circle which is constructed by three given points on the plane surface.

print("Input three coordinate of the circle:")
x1, y1, x2, y2, x3, y3 = map(float, input().split())
c = (x1-x2)**2 + (y1-y2)**2
a = (x2-x3)**2 + (y2-y3)**2
b = (x3-x1)**2 + (y3-y1)**2
s = 2*(a*b + b*c + c*a) - (a*a + b*b + c*c) 
px = (a*(b+c-a)*x1 + b*(c+a-b)*x2 + c*(a+b-c)*x3) / s
py = (a*(b+c-a)*y1 + b*(c+a-b)*y2 + c*(a+b-c)*y3) / s 
ar = a**0.5
br = b**0.5
cr = c**0.5 
r = ar*br*cr / ((ar+br+cr)*(-ar+br+cr)*(ar-br+cr)*(ar+br-cr))**0.5
print("Radius of the said circle:")
print("{:>.3f}".format(r))
print("Central coordinate (x, y) of the circle:")
print("{:>.3f}".format(px),"{:>.3f}".format(py))

#40 Write a Python program to check whether a point (x,y) is in a triangle or not. There is a triangle formed by three points.

print("Input x1,y1,x2,y2,x3,y3,xp,yp:")
x1,y1,x2,y2,x3,y3,xp,yp = map(float, input().split())
c1 = (x2-x1)*(yp-y1)-(y2-y1)*(xp-x1)
c2 = (x3-x2)*(yp-y2)-(y3-y2)*(xp-x2)
c3 = (x1-x3)*(yp-y3)-(y1-y3)*(xp-x3)
if (c1<0 and c2<0 and c3<0) or (c1>0 and c2>0 and c3>0):
    print("The point is in the triangle.")
else:
    print("The point is outside the triangle.")

#41 Write a Python program to compute and print sum of two given integers (more than or equal to zero). 
# If given integers or the sum have more than 80 digits, print "overflow".

print("Input first integer:")
x = int(input())
print("Input second integer:")
y = int(input())
if x >= 10 ** 80 or y >= 10 ** 80 or x + y >= 10 ** 80:
    print("Overflow!")
else:
    print("Sum of the two integers: ",x + y)

#42 Write a Python program that accepts six numbers as input and sorts them in descending order.

print("Input six integers:")
nums = list(map(int, input().split()))
nums.sort()
nums.reverse()
print("After sorting the said ntegers:")
print(*nums)

#44 Write a Python program to find the maximum sum of a contiguous subsequence from 
# a given sequence of numbers a1, a2, a3, ... an. A subsequence of one element is also a continuous subsequence

while True:
    print("Input number of sequence of numbers you want to input (0 to exit):")
    n = int(input())
    if n == 0:
        break
    else:
        A = []
        Sum = []
        print("Input numbers:") 
        for i in range(n):
            A.append(int(input()))
        Wa = 0
        for i in range(0,n):
            Wa += A[i]
            Sum.append(Wa)
        for i in range(0 , n):
            for j in range(0 , i):
                Num = Sum[i] - Sum[j]
                Sum.append(Num)
        print("Maximum sum of the said contiguous subsequence:")
        print(max(Sum))

#45 There are two circles C1 with radius r1, central coordinate (x1, y1) and C2 with radius r2 and central coordinate (x2, y2)

import math
print("Input x1, y1, r1, x2, y2, r2:")
x1,y1,r1,x2,y2,r2 = [float(i) for i in input().split()]
d = math.sqrt((x1-x2)**2 + (y1-y2)**2)
if d <= r1-r2:
    print("C2  is in C1")
elif d <= r2-r1:
    print("C1  is in C2")
elif d < r1+r2:
    print("Circumference of C1  and C2  intersect")
elif d == r1+r2:
    print("Circumference of C1 and C2 will touch")
else:
    print("C1 and C2  do not overlap")

#46 Write a Python program to that reads a date 
# (from 2016/1/1 to 2016/12/31) and prints the day of the date. Jan. 1, 2016, is Friday. Note that 2016 is a leap year.

from datetime import date
print("Input month and date (separated by a single space):")
m, d = map(int, input().split())
weeks = {1:'Monday',2:'Tuesday',3:'Wednesday',4:'Thursday',5:'Friday',6:'Saturday',7:'Sunday'}
w = date.isoweekday(date(2016, m, d))
print("Name of the date: ",weeks[w])

#47 Write a Python program which reads a text (only alphabetical characters and spaces.) and prints two words. 
# The first one is the word which is arise most frequently in the text. The second one is the word which has the maximum number of letters.

import collections
print("Input a text in a line.")
text_list = list(map(str, input().split()))
sc = collections.Counter(text_list)
common_word = sc.most_common()[0][0]
max_char = ""
for s in text_list:
    if len(max_char) < len(s):
        max_char = s
print("\nMost frequent text and the word which has the maximum number of letters.")
print(common_word, max_char)

#50 Write a Python program to replace a string "Python" with "Java" and "Java" with "Python" in a given string.

print("Input a text with two words 'Python' and 'Java'")
text = input().split()
for i in range(len(text)):
    if "Python" in text[i]:n = text[i].index("Python");text[i] = text[i][:n] + "Java" + text[i][n + 6:]
    elif "Java" in text[i]:n = text[i].index("Java");text[i] = text[i][:n] + "Python" + text[i][n + 4:]
print(*text)

#52 Write a Python program to compute the sum of first n given prime numbers.

# Take input from user
upto = int(input("Find sum of prime numbers upto : "))

sum = 0

for num in range(2, upto + 1):

    i = 2
    
    for i in range(2, num):
        if (int(num % i) == 0):
            i = num
            break;

    #If the number is prime then add it.
    if i is not num:
        sum += num

print("\nSum of all prime numbers upto", upto, ":", sum)
