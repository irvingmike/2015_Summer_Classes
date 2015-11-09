////////// Lab 4 //////////

class Point: Printable {
    var pointX: Double
    var pointY: Double
    
    var point: (Double, Double) {
        get {
            return (pointX, pointY)
        }
        set {
            pointX = newValue.0
            pointY = newValue.1
        }
    }
    
    var description: String {
        return "Point: x:\(pointX), y:\(pointY)"
    }
    
    init() {
        pointX = 0.0
        pointY = 0.0
    }
    
    init(x: Double, y: Double) {
        pointX = x
        pointY = y
    }
}

//
