import re
string=input ("user input : ")
number=re.findall('\d+',string)
sum=0
for j in number:
    sum+=int(j)
print(sum)