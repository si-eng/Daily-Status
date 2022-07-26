li = [12, 5, 0, 5]
sum = int(input("Enter a sum: "))
ans = []


for i in range(len(li)):
    for j in range(len(li)):
        if i==j:
            continue
        elif (li[i] + li[j] == sum ):
            a = "True"
            ans.append(a)
        else:
            a =" False"

if "True" in ans:
    print("True")
else: 
    print("False")