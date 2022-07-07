# 19. Write a Python program to get a new string from a given string where "Is" has been added to the front.
# If the given string already begins with "Is" then return the string unchanged

# new_string = str(input("Enter the name: "))
# def new_string(str):
#     if new_string is 

def new_string(str):
  if len(str) >= 2 and str[:2] == "Is":
    return str
  return "Is" + str

print(new_string("this"))
print(new_string("Is this"))