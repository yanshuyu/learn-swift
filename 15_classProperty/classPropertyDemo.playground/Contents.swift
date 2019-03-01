import Foundation

class Vector3D {
    //store property
    var x: Float
    var y: Float
    var z: Float
    
    //obsever propety
    var lable: String = "" {
        willSet {
            print("lable of Vectot(\(self.x), \(self.y) \(self.z)) will change to: \(newValue)")
        }

        didSet {
            print("Vectot(\(self.x), \(self.y) \(self.z))'s old lable is: \(oldValue)")
        }
    }
    
    //compute property
    var modularLength: Float {
        set {
            print("please don't set modularLength manually")
        }
        
        get {
            return sqrt(x*x + y*y + z*z)
        }
    }
    
    var normalized: Vector3D {
        set {
            print("please don't set normalized manually")
        }
        
        get {
            return Vector3D(x: self.x/self.modularLength, y: self.y/modularLength, z: self.z/self.modularLength, lable: self.lable + " (normalized)")
        }
    }
    
    init() {
        self.x = 0
        self.y = 0
        self.z = 0
    }
    
    init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    convenience init(x: Float, y: Float, z: Float, lable: String) {
        self.init(x: x, y: y, z: z)
        self.lable = lable
    }
    
    func toString() -> String {
        return "Vector(\(self.x), \(self.y), \(self.z), \"\(self.lable)\")"
    }
}

//operator overload
func == (lhs: Vector3D, rhs: Vector3D)->Bool {
    return lhs.x == rhs.x
        && lhs.y == rhs.y
        && lhs.z == rhs.x
}

func != (lhs: Vector3D, rhs: Vector3D)->Bool {
    return !(lhs == rhs)
}

func + (lhs: Vector3D, rhs: Vector3D)->Vector3D {
    return Vector3D(x: lhs.x+rhs.x, y: lhs.y+rhs.y, z: lhs.z+rhs.z)
}

func - (lhs: Vector3D, rhs: Vector3D)->Vector3D {
    return Vector3D(x: lhs.x-rhs.x, y: lhs.y-rhs.y, z: lhs.z-rhs.z)
}

var axisX = Vector3D(x: 1, y: 0, z: 0, lable: "x")
var axisY = Vector3D(x: 0, y: 1, z: 0, lable: "y axis")
var axisZ = Vector3D(x: 0, y: 0, z: 1, lable: "z axis")
var vectorLook = Vector3D(x: 1, y: 1, z: 1, lable: "the look direction of a camera")
print(axisX.toString())
print(axisY.toString())
print(axisZ.toString())
print(vectorLook.toString())

axisX.lable = "x axis"
print(axisX.toString())

print("the modular length of look vector: \(vectorLook.modularLength)")
print("the normalized vector of look vector: \(vectorLook.normalized.toString())")

axisX.modularLength = 1
axisX.normalized = Vector3D()

axisX == axisY
axisX != axisY

var vecSum = axisX + axisY + axisZ
print("vector sum: \(vecSum.toString())")



