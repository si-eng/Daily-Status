n = int(input("Enter a no. :"))
while True:
    k = str(n)
    if k == k[::-1]:
      break
    else:
      m = int(k[::-1])
      n += m
print(n)