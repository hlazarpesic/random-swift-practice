
import UIKit
/*
 
      10
    /    \
   9      2
  / \    / \
 1   3  4   6
 
 */

class BinaryNode<T> {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: T) {
        self.value = value
    }
}

extension BinaryNode {
    func traversePostOrder(_ visit: (T) -> Void) {
        leftChild?.traversePostOrder(visit)
        rightChild?.traversePostOrder(visit)
        visit(value)
    }
    
    func traverseInOrder(_ visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit)
        visit(value)
        rightChild?.traverseInOrder(visit)
    }
    
    func traversePreOrder(_ visit: (T) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit)
        rightChild?.traversePreOrder(visit)
    }
}

func main() {
    let ten = BinaryNode(10)
    
    let nine = BinaryNode(9)
    let one = BinaryNode(1)
    let tree = BinaryNode(3)
    
    let two = BinaryNode(2)
    let four = BinaryNode(4)
    let six = BinaryNode(6)
    
    ten.leftChild = nine
    nine.leftChild = one
    nine.rightChild = tree
    
    ten.rightChild = two
    two.leftChild = four
    two.rightChild = six
    
    print("-----Traverse PreOrder-----")
    ten.traversePreOrder(){
        print($0 )
    }
    
    print("\n-----Traverse InOrder-----")
    ten.traverseInOrder() {
        print($0)
    }
    
    print("\n-----Traverse PostOrder-----")
    ten.traversePostOrder(){
        print($0 )
    }
}

main()
