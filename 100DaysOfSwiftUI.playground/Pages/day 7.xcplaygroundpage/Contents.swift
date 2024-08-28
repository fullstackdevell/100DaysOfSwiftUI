// solution 1
func checkStringLetters(firstString: String, secondString: String) -> Bool {
    if firstString.sorted() == secondString.sorted() {
        return true
    } else {
        return false
    }
}
checkStringLetters(firstString: "hello", secondString: "olleh")

// solution 2
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
areLettersIdentical(string1: "world", string2: "dlrow")
