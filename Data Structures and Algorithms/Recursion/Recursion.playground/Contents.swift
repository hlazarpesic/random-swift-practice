import UIKit

func factorial(_ number: Int) -> Int {
    //base case
    if number == 0 {
        return 1
    }
    
    //recursive case
    return number * factorial(number - 1)
}

func main() {
    let result = factorial(6)
    print(result)
}

main()
