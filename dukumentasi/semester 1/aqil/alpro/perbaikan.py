def function(lst):
    result = []
    adalah = True
    for i in lst:
        if(i == "flick"):
            adalah = not adalah
        result.append(adalah)
    return result
    
print(function(["flick", "flick", "flick"]))