func getRandomNumber(from array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}
