# 12. Write a Python program to print the calendar of a given month and year.
# Note : Use 'calendar' module.

import calendar
from time import monotonic
y = int(input("Enter the Year: "))
mon = int(input("Enter the Month: "))
print(calendar.month(y,mon))
