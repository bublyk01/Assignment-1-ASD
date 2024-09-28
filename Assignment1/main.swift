import Foundation

let testData = (1...10000).map { _ in Int.random(in: 1...10000)}

//func Gnome(numbers: inout [Int]) {
    //var position = 0
    
    //while position < numbers.count {
        //if position == 0 || numbers[position] >= numbers[position - 1] {
            //position += 1
        //}
        //else
        //{
            //numbers.swapAt(position, position - 1)
            //position -= 1
        //}
    //}
//}

var sortedArray = testData.sorted()
//Gnome(numbers: &sortedArray)
print(sortedArray)
