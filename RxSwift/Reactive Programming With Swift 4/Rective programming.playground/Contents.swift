import Foundation

var twoDimensionalArray = [[1, 2], [3, 4], [5, 6]]
let flatArray = twoDimensionalArray.flatMap({ array in
    return array.map{ integer in
        return integer * 2
    }
})

print(flatArray)

var eventStream = ["1", "2", "abc", "3", "4", "cdf", "6"]

let result = eventStream.map({ Int($0) })
    .filter({ $0 != nil })

print(result)
