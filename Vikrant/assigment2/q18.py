a = int(input("first no. :"))
b = int(input("second no. :"))
c = int(input("third no. :"))

data = []
data.append(a)
data.append(b)
data.append(c)
print("\norignal data = ",data)

data.sort()
print("sorted data = ", data)
print(data[1] ,"is median.")


