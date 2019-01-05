import UIKit

func main() {
    var array: [Int] = [1, 3, 15, 6, 8, 12, 10, 33, 99, 2, 88, 13]
    
    for i in 0..<array.count - 1 {
        var minIndex = i
        
        for j in (i+1)..<array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        
        let temp = array[minIndex]
        array[minIndex] = array[i]
        array[i] = temp
    }
    print(array)
}

main()
