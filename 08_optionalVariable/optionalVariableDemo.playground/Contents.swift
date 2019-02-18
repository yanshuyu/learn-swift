import Foundation

var x: Int = 0
//x = nil -error
x = 10
print(x)


var y: Int? = nil
y = 10
print(y)

//unwrap optional vaeiable
print(y!)

var name: String? = nil
name = "yanshuyu"
print(name)
print(name!)

var age: Int? = nil


//if let unwrap optional variable
if let unwrapName = name {
    print("unwrap name: \(unwrapName)")
}
else{
    print("name is nil")
}

if let unwrapAge = age {
    print("unwrap age: \(unwrapAge)")
}
else{
    print("age is nil")
}

age = 27
//unwrap multiple optional variable
if let unwrapName = name,
    let  unwrapAge = age {
    print("unwrap name: \(unwrapName)\nunwrap age: \(unwrapAge)")
}
else {
    print("one of name or age is nil")
}
