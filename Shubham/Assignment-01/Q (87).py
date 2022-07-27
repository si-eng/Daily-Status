import os
file_name = input("enter a file name. : ")
file_size = os.path.getsize(file_name)

print("file size is : ", file_size)
