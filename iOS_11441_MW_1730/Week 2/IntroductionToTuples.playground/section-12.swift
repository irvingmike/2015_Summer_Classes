////////// Lab 5 //////////

func findMinimumAndMaximum(suppliedArray: [Int]) -> (Int, Int) {
    var minimum: Int = Int.max
    var maximum: Int = Int.min
    
    for number in suppliedArray {
        number
        if number < minimum {
            minimum = number
        } else if number > maximum {
            maximum = number
        }
    }
    
    return (minimum, maximum)
}

let numbersArray = [12, 32, 56, 27, 20, 85, 194, 2, 400, 24, 231, 84, 399, 194]
var (theMinimum, theMaximum) = findMinimumAndMaximum(numbersArray)

var otherMinimum = minElement(numbersArray)
var otherMaximum = maxElement(numbersArray)

//
