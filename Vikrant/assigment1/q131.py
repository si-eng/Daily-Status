x =input("enter a string: ")
length = int(len(x)/2)
f = ""
l = ""
for i in range(length):
    f += x[i]

print(f)
print("\n")

for i in range(length,len(x)):
    l += x[i]

print(l)

