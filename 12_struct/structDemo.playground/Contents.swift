import Foundation

enum Sex {
    case male
    case female
    case unkonw
}


struct Person {
    var name: String
    var id: Int
    var sex: Sex
    
    //initializer
    init() {
        self.name = ""
        self.id = 0
        self.sex = .unkonw
    }
 
    
    
    init(name: String, id: Int, sex: Sex){
        self.name = name
        self.id = id
        self.sex = sex
    }
    
    init(_name: String, _id: Int) {
        name = _name
        id = _id
        sex = .unkonw
    }
    
    //method
    func isMale() -> Bool {
        return self.sex == .male
    }
    
    func isFemale() -> Bool {
        return self.sex == .female
    }
 
}


struct Student {
    var person: Person
    var _school: String
    var _grade: Int
    var _class: Int
    
    init() {
        self.person = Person()
        self._school = ""
        self._grade = 0
        self._class = 0
    }
    
    init(person: Person, school: String, grade: Int, cls: Int) {
        self.person = person
        self._school = school
        self._grade = grade
        self._class = cls
    }
    
    //method
    mutating func setSchool(school: String) -> Void {
        self._school = school
    }
}


//add property or behavior
extension Student {
    mutating func setGrade(grade: Int) -> Void {
        self._grade = grade
    }
}




var p1 = Person()
print("p1: \(p1)")


var p2 = Person(name: "zhang", id: 456132135032, sex: .male)
print("p2: \(p2)")

var s1 = Student()
print("s1: \(s1)")

var s2 = Student(person: p2, school: "guangxi second high school", grade: 11, cls: 895)
print("s2.person: \(s2.person)\ns2._school: \(s2._school)\ns2._grade: \(s2._grade)\ns2._class: \(s2._class)")
print("s2 isMale: \(s2.person.isMale())")
s2.setSchool(school: "GUET University")
s2.setGrade(grade: 13)
print(s2)
