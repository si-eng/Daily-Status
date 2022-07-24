import glob
from ntpath import join
import os

files = glob.glob("*.py")
files.sort(key=os.path.getmtime)
print("\n".join(files))
