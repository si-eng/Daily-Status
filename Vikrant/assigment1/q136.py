import os

# main_path = 'C:/Users/vikrant/Desktop/Python assigment'

main_path = input("Enter a Path: ")
for i in os.listdir(main_path):
    # print(i)
    path = os.path.join(main_path,i)  
    # print(path)  
    if os.path.isfile(path):
        print(i)
    # else:
    #     continue
