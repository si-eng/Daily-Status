from optparse import Values


Values = input("Input some comma separated number: ")
list = Values.split(",")
tuple = tuple(list)
print('list: ',list)
print('tuple: ',tuple)