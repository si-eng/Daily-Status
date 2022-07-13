print("Input the heights of eight buildings:")
l = [int(input()) for i in range(8)]
l.sort(reverse = True)
print(l[:3])