import Foundation

var num_1 = 1
var num_2 = 10

//if statment
if (num_1 > num_2) {
    print("\(num_1) > \(num_2)")
}
else if num_1 < num_2 {
    print("\(num_1) < \(num_2)")
}
else{
    print("\(num_1) == \(num_2)")
}

//ternary operation
var min_num = num_1 < num_2 ? num_1 : num_2
var max_num = num_1 > num_2 ? num_1 : num_2
print("min_num is \(min_num)")
print("max_num is \(max_num)")

//switch statment
let name = "Alice"
switch name {
case "Alice", "alice":
    print("hello \(name)")
default:
    print("unkowned name")
}

let num = 4
switch num {
case let n where n % 2 == 0 :
    print("\(num) is even")
case let n where n % 2 != 0 :
    print("\(num) is odd")
default:
    break
}

let pos: (x: Int, y: Int, z: Int) = (1,2,3)
switch pos {
case (1,2,3):
    print("\(pos) == (1,2,3)")
    fallthrough
case (_, 2, 3):
    print("(_,2,3) include \(pos)")
    fallthrough
case (1,_,3):
    print("(1,_,3) include \(pos)")
default:
    break
}


//range
let score: Int = 80
var result: String = ""
switch score {
case 90 ... 100: //closed range
    result = "greate 😁"
case 80 ..< 90: //half open range
    result = "good 😀"
case 70 ..< 80:
    result = "ok 😐"
default:
    result = "failed 😒"
}
print("result is \(result)")

//for loop
for i in 0 ..< 10{
    print("i is \(i)")
}

//while loop
var counter = 0
print("while loop:")
while counter < 10 {
    print("counter: \(counter)")
    counter += 1
}

counter = 0
//repeat while loop
print("repeat while loop:")
repeat{
    print("counter: \(counter)")
    counter += 1
}while counter < 10


//continue
for num in 0 ... 100{
    if num % 2 != 0{
        continue
    }
    print("this is a even number: \(num)")
}

outerLoop: for i in 0 ..< 10{
    print("outer loop: \(i)")
    innerLoop: for j in 0 ..< 10{
        if i==5 && j == 5{
            continue outerLoop
        }
        print("\tinner loop: \(j)")
    }
}
