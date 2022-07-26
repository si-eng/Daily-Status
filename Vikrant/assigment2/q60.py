print("Input a sentence (1024 characters. max.)")
yy = input()
yy = yy.replace(",", " ")
yy = yy.replace(".", " ")
print("3 to 6 characters length of words:")
for y in yy.split():
    if 3 <= len(y) <= 6:
        print(y, end =" ") 