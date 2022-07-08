import os.path, time
filename = input("ENter file Name: ")
print("Last modified:" , time.ctime(os.path.getmtime(filename)))
print("Created: ", time.ctime(os.path.getctime(filename)))