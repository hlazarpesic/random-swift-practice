import UIKit

//For the Level Order algorithm we need to implement Queue data structure
struct Queue<T> {
    var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {
        elements.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil  : elements.removeFirst()
    }
}

class TreeNode<T> {
    var value: T
    var childrens: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        childrens.append(child)
    }
}

extension TreeNode where T : Equatable {
    //Depth First Traversal
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        childrens.forEach({ $0.forEachDepthFirst(visit) })
    }
    
    //Level Order Traversal
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        
        childrens.forEach({ queue.enqueue($0)})
        
        while let node = queue.dequeue() {
            visit(node)
            node.childrens.forEach({ queue.enqueue($0) })
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        
        forEachLevelOrder(){ node in
            if node.value == value {
                result = node
            }
        }
        
        return result
    }
}

func main() {
    let root = TreeNode<String>("Beverages")
    
    let hot = TreeNode<String>("Hot")
    
    let tea = TreeNode<String>("Tea")
    let coffee = TreeNode<String>("Coffee")
    hot.add(tea)
    hot.add(coffee)
    
    let cold = TreeNode<String>("Cold")
    
    let soda = TreeNode<String>("Soda")
    let milk = TreeNode<String>("Milk")
    cold.add(soda)
    cold.add(milk)
    
    root.add(hot)
    root.add(cold)
    
    //Depth First
    print("-----Depth First-----")
    root.forEachDepthFirst(){
        print($0.value)
    }
    
    //Level Order
    print("\n\n-----Level Order-----")
    root.forEachLevelOrder(){
        print($0.value)
    }
    
    print("\n\n-----Search-----")
    
    if let result = root.search("Test") {
        print(result.value)
    } else {
        print("Item not found")
    }
}

main()
