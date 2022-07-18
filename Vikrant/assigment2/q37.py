
n = int(input("Enter any no. : "))
result = 0

for i in range(10):
    for j in range(10):
        for k in range(10):
            if (i+j+k == n):
                result +=(0<=n-(i+j+k)<=9)

print(result)