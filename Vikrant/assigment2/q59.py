def poly_area(c):
  add = []
  for i in range(0, (len(c) - 2), 2):
    add.append(c[i] * c[i + 3] - c[i + 1] * c[i + 2])
    add.append(c[len(c) - 2] * c[1] - c[len(c) - 1] * c[0])
    return abs(sum(add) / 2)
no_sides = int(input('Input number of sides: '))
cord_data = []
for z in range(no_sides):
    print("Side:",z+1)
    print("Input the Coordinate:")
    x = int(input('Input Coordinate x:'))
    y = int(input('Input Coordinate y:'))
    cord_data.append(x)
    cord_data.append(y)
print("\nArea of the Polygon:",poly_area(cord_data))
