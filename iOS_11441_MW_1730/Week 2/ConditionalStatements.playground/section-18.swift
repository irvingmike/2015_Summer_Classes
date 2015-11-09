////////// Lab 8 //////////

let yetAnotherNumber = 10.1

switch yetAnotherNumber {
case 1...10:
    println("It is a small number!")
case 11...50:
    println("It is a medium number!")
case 51...100:
    println("It is a big number!")
default:
    println("It must be really big.")
}

// Interesting result with a double in this, good to know how it would react.
//
