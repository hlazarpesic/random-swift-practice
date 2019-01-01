import UIKit

let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//MARK: Constant time
func checkFirst(_ numbers: [Int]) {
    if let first = numbers.first {
        print(first)
    } else {
        print("empty")
    }
}

//MARK: Linear time
func printNumbers(_ numbers: [Int]) {
    for number in numbers {
        print(number)
    }
}

//MARK: Quadratic time
func printNumbersQuadratic(_ numbers: [Int]) {
    for _ in numbers {
        for number in numbers {
            print(number)
        }
    }
}

//Logarithmic time
func containsUsingBinarySearch(_ number: Int) -> Bool {
    var lowerBound = 0
    var upperBound = numbers.count - 1
    var middle = 0
    var found = false
    
    while(lowerBound <= upperBound) {
        middle = (lowerBound + upperBound) / 2
        if (numbers[middle] == number) {
            found = true
            break
        } else if (numbers[middle] < number) {
            lowerBound = middle + 1
        } else {
            upperBound = middle - 1
        }
    }
    
    return found
}

func main() {
//    checkFirst(numbers)
//    printNumbers(numbers)
//    printNumbersQuadratic(numbers)
    containsUsingBinarySearch(10)
}

main()
