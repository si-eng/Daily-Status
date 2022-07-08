from timeit import default_timer
def timer(n):
    start = default_timer()
    # some code here
    for row in range(0,n):
        print(".",end="")
    print(f"\nTime taken to print {n} . is : ",default_timer() - start)

timer(1234)