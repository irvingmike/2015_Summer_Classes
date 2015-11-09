////////// Lab 1 //////////

class Pet {
    var name: String
    var species: String
    var weight: Double
    var height: Double
    
    convenience init(name: String, weight: Double, height: Double) {
        self.init()
        self.name = name
        self.weight = weight
        self.height = height
    }
    
    convenience init() {
        println("Das initializer is good!")
        self.init(name: "<name>", species: "<unknown>", weight: 0.0, height: 0.0)
    }
    
    init(name: String, species: String, weight: Double, height: Double) {
        self.name = name
        self.species = species
        self.weight = weight
        self.height = height
    }
}

//
