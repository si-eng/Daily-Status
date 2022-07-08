nums = [10,20,30,40,50,60,70,80,90]
# print(4%7)
length = len(nums)
place =0
while len(nums)>0:
    place = (2+place)%length
    # print(place, length)
    print(nums.pop(place))
    length -=1

