no = int(input("Enter a number: "))

if no < 17:
    print("Difference is: ",17-no)
else:
    a = no-17
    b = abs(a)

    print("Given no is greater then 17 hence double of its absoulte difference is " , 2*b)