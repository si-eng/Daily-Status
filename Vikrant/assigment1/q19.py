string = str(input("Enter a string : "))
if (len(string) >=2 and string[:2] == 'Is'):
    print(string)
else:
    print("Is"+string)