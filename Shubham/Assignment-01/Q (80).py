import sys
print("Current value of the recursion limit:")
print(sys.getrecursionlimit())

######################################################
# Python's default recursion limit is 1000, meaning that Python won't let a function call on itself more than 1000 times, 
# which for most people is probably enough. It can be set by setrecursionlimit().
# The limit exists because allowing recursion to occur more than 1000 times doesn't exactly make for lightweight code.
###################################################################
