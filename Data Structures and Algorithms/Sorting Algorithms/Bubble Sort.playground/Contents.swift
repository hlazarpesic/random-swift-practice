import UIKit

/*
 The function always runs O(n^2) time even if the array is sorted. It can be optimized by stopping the algorithm if inner loop didn’t cause any swap.
 */

func main() {
    var array: [Int] = [1, 3, 15, 6, 8, 12, 10, 33, 2, 88]
//    var array: [Int] = [1, 2, 3, 6, 8, 10, 12, 15, 33, 88]
    var swapped = false
    
    for i in 0..<array.count {
        for j in 0..<array.count - i - 1 {
            if array[j] > array[j + 1] {
//                let temp = array[j]
//                array[j] = array[j+1]
//                array[j+1] = temp
                array.swapAt(j, j + 1)
                swapped = true
            }
        }
        
        if swapped == false {
            break
        }
    }
    
    print(array)
}

main()
