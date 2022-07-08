from dataclasses import dataclass


data = [1,5,7,9,7,7]

if len(data) == len(set(data)):
   print(True) 
else:
   print(False)

