str = input('Enter any value: ')

try:
    i = float(str)
    print("It's a numaric Value")
except (ValueError, TypeError):
    print('\nNot numeric')