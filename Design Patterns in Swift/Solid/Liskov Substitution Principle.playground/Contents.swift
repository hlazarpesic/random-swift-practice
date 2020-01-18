import Foundation

//Child classes should never break the parent class' type definitions.
///Example where is substitution principle is broken

class Rectangle: CustomStringConvertible {
    
    fileprivate var _width = 0
    fileprivate var _height = 0
    
    var width: Int {
        get { return _width }
        set { _width = newValue }
    }
    
    var height: Int {
        get { return _height }
        set { _height = newValue }
    }
    
    init(){}
    
    init(_ width: Int, _ height: Int) {
        _width = width
        _height = height
    }
    
    var area: Int {
        return width * height
    }
    
    public var description: String {
        return "Width: \(width), height: \(height)"
    }
}

class Square: Rectangle {
    
    override var width: Int {
        get { return _width }
        set {
            _width = newValue
            _height = newValue
        }
    }
    
    override var height: Int {
        get { return _width }
        set {
            _width = newValue
            _height = newValue
        }
    }
}

func setAndMeasure(_ rc: Rectangle ) {
    rc.width = 3
    rc.height = 4
    print("Expected area to be 12 but got \(rc.area)")
}

func main() {
    let rc = Rectangle()
    setAndMeasure(rc)
    
    let sq = Square()
    setAndMeasure(sq)
}

main()
