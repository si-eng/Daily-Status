n = int(input("Enter a number : "))
x = n
prime = []
sum = 0
c = 2
while n!=0:
  for i in range(2,c):
    if c%i==0:
      break
  else:
    sum +=c  
    prime.append(c)  
    n-=1
  c+=1  
print(f'first {x}, prime numbers are \n{prime}')
print(f'sum of all is {sum}')
