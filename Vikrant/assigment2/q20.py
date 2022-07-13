n = int(input("Enter a no to get factroial: "))
f = 1
for i in range(1, n+1):
    f *=i
print("\nfactroial is: " , f)

f =str(f)
count = 0

string = f[::-1]
# print(string)

for j in string:
    if j == "0":
        count +=1
    else:
        break

print("total no. of zeros: ", count)

