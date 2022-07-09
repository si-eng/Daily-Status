def myfunc(num):
     count=0
     for i in num:
         if i == 4:
             count=count+1
     return count
 print(myfunc([1,4,2,3,5,6,4,4]))
