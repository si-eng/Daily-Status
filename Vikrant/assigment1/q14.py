
from datetime import date

f_date = date(2019, 7, 2)
l_date = date(2016, 7, 11)

difference = l_date - f_date

print(abs(difference.days))
