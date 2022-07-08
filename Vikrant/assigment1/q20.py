string = str(input("Enter a string : "))
rep = int(input("Enter no of rep: "))

ans = ""

for i in range(rep):
    ans = ans + string

print(ans)