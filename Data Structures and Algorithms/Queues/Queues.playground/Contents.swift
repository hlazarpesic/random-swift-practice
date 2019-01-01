import UIKit

struct Queue<T> {
    var array: [T] = []
    init() {}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return array.isEmpty ? nil : array.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

func main() {
    var mQueue = Queue<Int>()
    mQueue.enqueue(10)
    mQueue.enqueue(15)
    mQueue.enqueue(40)
    print(mQueue)
    
    mQueue.dequeue()
    print(mQueue)
}

main()
