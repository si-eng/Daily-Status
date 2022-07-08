print("Enter any two side of a triangl.\nEnter x which need to be find.\n\n")
base = input("Enter base length: ")
height = input("Enter height length: ")
hypotenuse = input("Enter hypotenuse length: ")

if base == str("x"):
            height = int(height)
            hypotenuse = int(hypotenuse)
            h =int(((hypotenuse**2)-(height**2))**0.5)
            # print ("Opposite = " + str(((hypotenuse**2) - (height**2))**0.5))
            print("Base = ",h)
elif height == str("x"):
            base = int(base)
            hypotenuse = int(hypotenuse)
            h =int(((hypotenuse**2)-(base**2))**0.5)
            # print ("Adjacent = " + str(((hypotenuse**2) - (base**2))**0.5))
            print("Adjacent = " , h)
elif hypotenuse == str("x"):
            base = int(base)
            height = int(height)
            h =int(((base**2)+(height**2))**0.5)
            # print ("Hypotenuse = " + int(((int(base**2)) + (int(height**2)**0.5))))
            print("Hypotenuse = " + h)