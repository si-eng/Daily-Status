from functools import reduce
nums = [10, 20, 30,]
print("Original list numbers:")
print(nums)
nums_product = reduce( (lambda x, y: x * y), nums)
print("\nProduct is ",nums_product)