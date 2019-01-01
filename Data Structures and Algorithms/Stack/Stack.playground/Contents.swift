import UIKit

struct Stack<T> {
    private var storage: [T] = []
    
    init() {}
    
    mutating func push(_ element: T) {
        storage.append(element)
    }
    
    mutating func pop() -> T?{
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "-----top-----\n"
        let bottomDivider = "\n-------------"
        
        let stackItems = storage.map({"\($0)"}).reversed().joined(separator: "\n")
        return topDivider + stackItems + bottomDivider
    }
}

func main() {
    var stack = Stack<Int>()
    stack.push(20)
    stack.push(10)
    stack.push(15)
    
    print(stack)
    
    stack.pop()
    
    print(stack)
}

main()
