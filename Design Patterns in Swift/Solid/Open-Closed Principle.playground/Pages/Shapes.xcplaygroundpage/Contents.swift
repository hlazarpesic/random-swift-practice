import Foundation

//Software entities (classes, modules, functions, etc) should be open for extension, but closed for modification.

protocol Shape {
    
    func getArea() -> Double
}

class Rectangle: Shape {
    
    var length: Double
    var height: Double
    
    init(_ length: Double, _ height: Double) {
        self.length = length
        self.height = height
    }
    
    func getArea() -> Double {
        return length * height
    }
}

class Circle {
    
    var radius: Double
    
    init(_ radius: Double) {
        self.radius = radius
    }
    
    func getArea() -> Double {
        return radius * radius * 3.14
    }
}

class AreaManager {
    
    func calculateArea(shapes: [Shape]) -> Double {
        var area: Double = 0.0
        
        for shape in shapes {
            area += shape.getArea()
        }
        
        return area
    }
}
