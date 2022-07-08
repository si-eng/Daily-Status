def substring_copy(str, n):
    s_string = 2
    if s_string > len(str):
        s_string = len(str)
    substr = str[:s_string]
    
    result = ""
    for i in range(n):
        result = result + substr
    return result

print(substring_copy('vikrant', 2))