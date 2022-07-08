str1 = input("Enter a Binary no: ")
while '01' in str1:
        str1 = str1.replace('01', '')
print( len(str1) == 0)