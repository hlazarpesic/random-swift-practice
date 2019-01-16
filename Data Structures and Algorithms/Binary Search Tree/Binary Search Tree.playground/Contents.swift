import UIKit

class BinaryNode<T> {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: T) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", root + "|––", bottom + "| ")
    }
}

struct BinarySearchTree<T: Comparable> {
    private(set) var root: BinaryNode<T>?
    
    init(){}
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        guard let node = node else {
            return BinaryNode(value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node, value: value)
        }
        
        return node
    }
}

func main() {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    print(bst)
}

main()
