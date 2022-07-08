s = "The quick brown fox jumps over the lazy dog."  
count = 0
l = input("Enter a letter to check it's occourence. : ")
for i in s:
    
    if i==l:
        count += 1
    
print(count)