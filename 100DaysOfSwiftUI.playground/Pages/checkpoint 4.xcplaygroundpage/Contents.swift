enum NumberError: Error {
    case outOfBounds, noRoot
}

func intSqrt(number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw NumberError.outOfBounds
    }
    
    for i in 1...100 {
        if number == i * i {
            return i
        }
    }
    throw NumberError.noRoot
}

do {
    let result = try intSqrt(number: 25)
    print("Square root is \(result)")
} catch {
    print("Error: \(error)")
}
