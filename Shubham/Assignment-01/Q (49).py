from os import listdir
from os.path import isfile, join
files_list = [f for f in listdir('D:/') if isfile(join('D:/', f))]
print(files_list)
