n = int(input("Enter a no.: "))
count = 0

for i in range(1,n):
    if n%i==0:
        count +=1

print(count+1)