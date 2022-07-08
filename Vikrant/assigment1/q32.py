x = int(input('Enter first digit : '))
y = int(input('Enter second digit : '))

def lcm(x, y):
  if x > y:
      z = x
  else:
      z = y
  while(True):
      if((z % x == 0) and (z % y == 0)):
          lcm = z
          break
      z += 1
  return lcm

print("LCM of given numbers is ", lcm(x,y))