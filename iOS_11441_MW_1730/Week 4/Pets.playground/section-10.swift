// The Pet Class

class Pet {
    var name: String
    var weight: Double
    var height: Double

    init() {
        name = ""
        weight = 0.0
        height = 0.0
    }
    
    var description: String {
        return "name: \(name), weight: \(weight), height: \(height)"
    }
}


//
