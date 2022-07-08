from django.shortcuts import redirect


from math import pi

radius = float(input("Enter radius of Sphere: "))

volume = 4/3*pi*radius*radius*radius

print("Sphere Volume is : ", volume)