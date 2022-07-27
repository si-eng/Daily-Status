string  = input("Enter a word: ")
hash = ""

for i in string:
    hash += str(ord(i))

print(hash)
