num = int(input("Enter a no.: "))

count =0

# for i in range(n+1):
#     for j in range(i+1):
#         if (j % i == 0):

for j in range(num):
    for i in range(2,num):
        if (num % i) == 0:
           print()
        else:
            count +=1

print(count)
       
