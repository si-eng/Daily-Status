no1 = int(input("Enter the first no. : "))
no2 = int(input("Enter the second no. : "))

l1 = str(no1)
l2 = str(no2)

count = 0

for i in range(len(l1),0,-1):
    integer1 = int(l1[i-1])
    integer2 = int(l2[i-1])
    sum = integer1+integer2
    if sum > 9:
        count +=1 

print(count)