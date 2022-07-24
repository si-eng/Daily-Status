n = int (input("Enter your no.: "))
sum = 0
while n>0:
    a = n%10
    n = int(n/10)
    sum +=a
print(sum)
