no = int(input("Enter a no: "))

def number(no):
    list = [1,5,8,3]
    for i in list:
        if (no == i):
            return True
    return False

print(number(no))