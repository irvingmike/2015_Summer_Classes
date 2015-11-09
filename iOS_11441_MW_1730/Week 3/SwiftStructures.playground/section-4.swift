////////// Lab 1 //////////

struct Rectangle: Printable {
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    
    init() {
        self.init(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
    }
    
    init(x: Double, y: Double, width: Double, height: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    var description: String {
        return "x: \(x), y: \(y), width: \(width), height: \(height)"
    }
    
    var rect: (Double, Double, Double, Double) {
        get {
            return (x, y, width, height)
        }
        set {
            x = newValue.0
            y = newValue.1
            width = newValue.2
            height = newValue.3
        }
    }
}

//
