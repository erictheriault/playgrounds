import Foundation

// RegEx.Swift

infix operator =~
prefix operator /

func =~(string: String, regEx: NSRegularExpression) -> Bool {
    let matches = regEx.numberOfMatches(in: string, options: [], range: NSRange(location: 0, length: string.characters.count))
    return matches > 0
}

prefix func /(pattern: String) -> NSRegularExpression {
    return try! NSRegularExpression(pattern: pattern, options: .dotMatchesLineSeparators)
}

// Usage

func isValid(email: String) -> Bool {
    let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-" +
        "zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    return email =~ /emailRegEx
}

isValid(email: "bad email")
isValid(email: "test@test.com")

func isValid(phone: String) -> Bool {
    return phone =~ /"^\\(?\\d{3}\\)?[-\\s]?\\d{3}-\\d{4}$" // Matches (555) 555-5555
}

isValid(phone: "Hi!")
isValid(phone: "333-333-3333")
isValid(phone: "(333) 333-3333")

func isValid(zipCode: String) -> Bool {
    return zipCode =~ /"^\\d{5}$"
}

isValid(zipCode: "1234")
isValid(zipCode: "12345")
