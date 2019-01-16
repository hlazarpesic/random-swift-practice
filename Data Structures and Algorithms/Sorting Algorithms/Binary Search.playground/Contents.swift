import UIKit

func main() {
    let numebrs: [Int] = [1,5,15,17,19,22,24,31,105,150]
    var lowerBound = 0
    var upperBound = numebrs.count - 1
    var middle = 0
    var found = false
    let valueToSearch = 31
    
    while lowerBound <= upperBound {
        middle = (lowerBound + upperBound) / 2
        if numebrs[middle] == valueToSearch {
            found = true
            break
        } else if numebrs[middle] < valueToSearch {
            lowerBound = middle + 1
        } else {
            upperBound = middle - 1
        }
    }
    print(found)
}

main()
