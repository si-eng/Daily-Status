import imp
module = input("Enter a module name : ")
print("Location of Python os module sources:")
print(imp.find_module(module))