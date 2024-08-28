import Foundation

// solution 1
let root = sqrt(169)
print(root)

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// solution 2
func pythagorasProblem(a: Double, b: Double) -> Double {
     sqrt(a * a + b * b)
}
let cProblem = pythagorasProblem(a: 3, b: 4)
