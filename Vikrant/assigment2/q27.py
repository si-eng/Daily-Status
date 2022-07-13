# a =[1,2,3]
a =[2,6,18]

if a[1]-a[0]==a[2]-a[1]:
    diff = a[1]-a[0]
    no = diff + a[2]
    print("its a AP series next no will be. " , no)

elif (a[1]/a[0]==a[2]/a[1] ):
    diff = a[1]/a[0]
    no = diff*a[2]
    print("its a GP series next no will be. " , no)
