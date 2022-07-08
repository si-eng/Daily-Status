
color_list_1 = ["White", "Black", "Red"]
color_list_2 = ["Red", "Green"]

color_list_3 = []
for i in color_list_1:
    if (i!=color_list_2[0] and i!=color_list_2[1]):
            color_list_3.append(i)

print(color_list_3)

color_list_1 = set(["White", "Black", "Red"])
color_list_2 = set(["Red", "Green"])
print(color_list_1.difference(color_list_2))
