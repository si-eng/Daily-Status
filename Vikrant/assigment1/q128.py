string = input("Enter a string without space : ")

for i in string:
    if i == i.lower():
        print("\nString contain a lower case. ")
        break
