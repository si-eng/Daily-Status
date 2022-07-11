##########################Q21############################
# num = int(input("Enter a number: "))
# mod = num % 2
# if mod > 0:
#     print("This is an odd number.")
# else:
#     print("This is an even number.")

##########################Q22############################
# def list_count_4(nums):
#   count = 0  
#   for num in nums:
#     if num == 4:
#       count = count + 1

#   return count

# print("Total no of 4 found in List are : ",list_count_4([1, 4, 6, 7, 4]))
##########################Q23############################
# def substring_copy(str, n):
#     s_string = 2
#     if s_string > len(str):
#         s_string = len(str)
#     substr = str[:s_string]
    
#     result = ""
#     for i in range(n):
#         result = result + substr
#     return result

# print(substring_copy('harshit', 2))
##########################Q24############################
# alphabate = str(input("Enter a letter : "))
# letter = alphabate.lower()
# if (letter =='a' or letter =='e'or letter =='i'or letter =='o' or letter =='u'):
#     print("It's a Vowel")
# else:
#     print("It's not a Vowel")
##########################Q25############################
# no = int(input("Enter a no: "))

# def number(no):
#     list = [1,5,8,3]
#     for i in list:
#         if (no == i):
#             return True
#     return False

# print(number(no))
##########################Q26############################
#26 Write a Python program to create a histogram from a given list of integers.
# def histogram( items ):
#     for n in items:
#         output = ''
#         times = n
#         while( times > 0 ):
#           output += '*'
#           times = times - 1
#         print(output)
# histogram([2, 7, 5, 6])
##########################Q27############################
#27. Write a Python program to concatenate all elements in a list into a string and return i
# list = ['1','2','3','4'] 
# newlist = ""
# a = newlist.join(list) 
# print(a) 
##########################Q28############################
# 28. Write a Python program to print all even numbers from a given numbers list in the same order and stop the printing if any numbers that come after 237 in the sequence. Go to the editor
# Sample numbers list :

# numbers = [    
#     386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345, 
#     399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217, 
#     815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717, 
#     958,743, 527
#     ]
# num = [    
#     386, 462, 47, 418, 907, 344, 236, 375, 823, 566, 597, 978, 328, 615, 953, 345, 
#     399, 162, 758, 219, 918, 237, 412, 566, 826, 248, 866, 950, 626, 949, 687, 217, 
#     815, 67, 104, 58, 512, 24, 892, 894, 767, 553, 81, 379, 843, 831, 445, 742, 717, 
#     958,743, 527
#     ]
# for x in num:
#     if x == 237:
#         print(x)
#         break;
#     elif x % 2 == 0:
#         print(x)
##########################Q29############################

# 29. Write a Python program to print out a set containing all the colors from color_list_1 which are not present in color_list_2. Go to the editor
# Test Data :
# color_list_1 = set(["White", "Black", "Red"])
# color_list_2 = set(["Red", "Green"])
# color_list_1 = set(["White", "Black", "Red"])
# color_list_2 = set(["Red", "Green"])
# print("Original set elements:")
# print(color_list_1)
# print(color_list_2)
# print("Differenct of color_list_1 and color_list_2:")
# print(color_list_1 - color_list_2)
##########################Q30############################
#30. Write a Python program that will accept the base and height of a triangle and compute the area.
# b = int(input("Input the base : "))
# h = int(input("Input the height : "))
# area = b*h/2
# print("Area of Triangle= ", area)