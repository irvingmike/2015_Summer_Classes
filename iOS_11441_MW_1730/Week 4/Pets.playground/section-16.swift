// The Dog class

class Dog: Pet {
    var breed: String

    override init() {
        breed = ""
        super.init()
    }
    
    override var description: String {
        return "Dog: \(super.description), breed: \(breed)"
    }
}


