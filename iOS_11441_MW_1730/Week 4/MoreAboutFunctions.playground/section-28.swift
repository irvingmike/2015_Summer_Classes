////////// Lab 13 //////////

func multiplyThese(first: Int, second: Int) {
    println("\(first) times \(second) is \(first * second)")
}

var multiply: (Int, Int) -> ()

multiply = multiplyThese

arrayOfFuncs.append(multiply)

for function in arrayOfFuncs {
    function(10, 5)
}

//
