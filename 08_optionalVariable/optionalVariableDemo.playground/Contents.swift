import Foundation

var x: Int = 0
var y: Int? = nil
var age: Int? = nil
var name: String? = nil
var unwrapName: String = name ?? "empty"

//x = nil -error
x = 10
print(x)

y = 10
print(y)
//unwrap optional vaeiable
print(y!)


//print(name!) -can't unwrap a nil optional
print(unwrapName)

name = "yanshuyu"
unwrapName = name ?? "empty"

print(name)
print(name!)
print(unwrapName)



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
