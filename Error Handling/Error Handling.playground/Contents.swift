import Foundation

enum MachingError: Error {
    case NotEnoughtCharacters(count: Int)
}

func throwingFunction(_ source: String) throws -> Bool  {
    let minCharacters = 5
    guard source.count >= minCharacters else {
        throw MachingError.NotEnoughtCharacters(count: minCharacters)
    }
    return true
}

do {
    try throwingFunction("func")
} catch is MachingError {
    print("Maching Error")
}

// Converting Errors to Optional Values
try? throwingFunction("nil")

// Disabling Error Propagation
try! throwingFunction("source")
