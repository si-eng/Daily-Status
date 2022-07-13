# p_no = [9,8,3,2,2,0,9,7,6,3]
# a_no = [0,1,2,3,4,5,6,7,8,9]
a_no = "0123456789"
p_no = input("Enter your phone no: ")
result = []

for i in a_no:
    if str(i) in p_no:
        continue
    else:
        result.append(i)

print("your no. does not contain ", result ,"no")    
