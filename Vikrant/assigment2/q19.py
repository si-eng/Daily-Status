num = "248163264"
tempn , i ,n = 2, 2, 2
ans = True
while ans:
    if str(tempn) in num:
      i += 1
      tempn = pow(n, i)
    else:
      ans = False

print(i-1)