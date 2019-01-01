import UIKit

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init(){}
    
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        let node = Node(value: value)
        tail?.next = node
        tail = node
    }
    
    func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    func insert(_ value: T, after node: Node<T>) {
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail?.next = previous
        return current.value
    }
    
    mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        
        return String(describing: head)
    }
}

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(next)"
    }
}

func main() {
    var linkedList = LinkedList<Int>()
    linkedList.push(2)
    linkedList.push(3)
    linkedList.push(50)
    linkedList.append(30)
    
    let middleNode = linkedList.node(at: 1)!
    linkedList.insert(999, after: middleNode)
    
    print(linkedList)
    
    linkedList.pop()
    print(linkedList)
    
    linkedList.removeLast()
    print(linkedList)
    
    linkedList.remove(after: linkedList.node(at: 0)!)
    print(linkedList)
}

main()
