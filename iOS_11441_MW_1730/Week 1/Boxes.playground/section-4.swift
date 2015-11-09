////////// Boxed //////////

func calculateArea(supWidth: Double, supHeight: Double) -> Double {
    return supWidth * supHeight
}

func calculatePerimeter(supWidth: Double, supHeight: Double) -> Double {
    return (2 * supWidth + 2 * supHeight)
}

func calculateVolume(supWidth: Double, supHeight: Double, supDepth: Double) -> Double {
    return supWidth * supHeight * supDepth
}

let boxWidth: Double = 5
let boxHeight: Double = 10
let boxDepth: Double = 20

let surfaceArea = 2 * (calculateArea(boxWidth, boxHeight) + calculateArea(boxHeight, boxDepth) + calculateArea(boxWidth, boxDepth))

let perimeterFront = calculatePerimeter(boxWidth, boxHeight)
let perimeterTop = calculatePerimeter(boxWidth, boxDepth)
let perimeterSide = calculatePerimeter(boxHeight, boxDepth)

let boxVolume = calculateVolume(boxWidth, boxHeight, boxDepth)

println("The cube's dimensions: width=\(boxWidth), height=\(boxHeight), depth=\(boxDepth)")
println("The Volume of the cube is \(boxVolume)")
println("The SurfaceArea of the cube is \(surfaceArea)")
println("The front Perimeter is \(perimeterFront)")
println("The top Perimeter is \(perimeterTop)")
println("The side Perimeter is \(perimeterSide)")

//
