import Foundation

let testData = [35, 12, 43, 8, 51, 27, 19, 3, 47, 30]

func Gnome(numbers: inout [Int]) {
    var position = 0
    
    while position < numbers.count {
        if position == 0 || numbers[position] >= numbers[position - 1] {
            position += 1
        }
        else
        {
            numbers.swapAt(position, position - 1)
            position -= 1
        }
    }
}

var sortedArray = testData
Gnome(numbers: &sortedArray)
print(sortedArray)
