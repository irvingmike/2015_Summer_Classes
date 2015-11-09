// Polymorphism Rules!

class MyDog : Pet {

    var breed: String

    override init() {
        breed = ""
        super.init()
    }

    override var description: String {
        return "Dog: \(super.description), breed: \(breed)"
    }
}

class MyCat : Pet {
    override var description: String {
        return "Cat: \(super.description)"
    }
}

class MyRabbit : Pet {
    override var description: String {
        return "Rabbit: \(super.description)"
    }
}

var dog5 = MyDog()
dog5.name = "Fido"
dog5.weight = 25.0
dog5.height = 20.0
dog5.breed = "Husky"

var dog6 = MyDog()
dog6.name = "Ralph"
dog6.weight = 55.0
dog6.height = 25.0
dog6.breed = "Mutt"

var rabbit1 = MyRabbit()
rabbit1.name = "Peanut"
rabbit1.weight = 2.0
rabbit1.height = 6.0

var cat2 = MyCat()
cat2.name = "Kitty"
cat2.weight = 12.0
cat2.height = 10.0

var pets: [Pet] = [dog5, dog6, rabbit1, cat2]

for pet in pets {
    println(pet.description)
}


//
