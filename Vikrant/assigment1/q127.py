int_val = int(input("Enter any Integer:  "))

if int_val.bit_length() <= 63:
    print("Yes, fites in 64 bits.")
    print(int_val.bit_length(), "is the bit leangth")
else: 
    print("Not fit in 64 bits. ")
    print(int_val.bit_length(), "is the bit leangth")