a =int(input("Enter any no.: "))
b =int(input("Enter any no.: "))
# for i in range(1,a+1):
#     b +=1

# print(b)
while b != 0:
        data = a & b
        # print(data)
        a = a ^ b
        # print(a)
        b = data << 1
        # print(b ,"\n")

print("Sum is : ", a)