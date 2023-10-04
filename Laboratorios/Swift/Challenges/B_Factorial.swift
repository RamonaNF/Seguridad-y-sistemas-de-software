
print(factRecursivo(-10), terminator: "\n\n")
print(factIterativo(10))

func factRecursivo(_ num: Int) -> Int {
    if num < 1 {
        print("ERROR: factRecursivo solo acepta números positivos")
        return -1
    }
    
    if num == 1 {
        return num
    }
    return num * factRecursivo(num - 1)
}

func factIterativo(_ num: Int) -> Int {
    if num < 1 {
        print("ERROR: factIterativo solo acepta números positivos")
        return -1
    }
    
    var fact: Int = 1
    for i in 2...num {
        fact *= i
    }
    return fact
}
