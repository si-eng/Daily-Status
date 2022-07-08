data = [0, 10, 15, 40, -5, 42, 17, 28, 75]

l = data[0]
s = data[0]

for num in data:
    if num> l:
        l = num
    elif num< s:
        s = num
print(f'Smallest value is {s}\nLargest value is {l}')  