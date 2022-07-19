text = str(input("Enter any text that include pytohn and Java in it. : "))
text = text.split()
for i in text:
    if i =="python":
        b = text.index(i)
        # print(b)
    elif i =="java":
        c = text.index(i)

text[b] = "java"
text[c] = "python"
print(text)