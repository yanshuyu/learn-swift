import Foundation


func Foo(){
    print("inside func foo")
}

func Add(lhs: Int, rhs: Int){
    print("\(lhs) + \(rhs)  =   \(lhs + rhs)")
}

func Pow(_ base: Int, _ exp: Int){
    let result = pow(Decimal(base), exp)
    print("\(base)^\(exp) = \(result)")
}

//function return singal argument
func Concat(_ str1: String, _ str2: String)-> String{
    return str1 + str2
}

//function return multiple argument
func MaxMin(_ num1: Float, _ num2: Float)->(max: Float, min: Float){
    if num1 >= num2 {
        return (num1, num2)
    }
    else{
        return (num2, num1)
    }
}

//pass constant parameter(value)
func SelfDecrement(_ num: Int, _ decpart: Int){
    let old = num
    // num -= decpart : error
    let result = num - decpart
    print("\(old) -= \(decpart) = \(result)")
}

//pass mutable parameter(reference)
func SelfIncreatment(_ num: inout Int, _ addpart: Int){
    let old = num
    num += addpart
    let result = num
    print("\(old) += \(addpart) -> \(result)")
}

Foo()
Add(lhs:1, rhs:2) //call function with parameter lable
Add(lhs:10, rhs:20)
Pow(2, 4) //call function without oarameter lable


//function with return value
var fstName = "yan"
var secName = "shuyu"
print("\(fstName) .. \(secName) = \(Concat(fstName, secName))")

var num1: Float = 11.1
var num2: Float = 111.1
print("MaxMin(\(num1), \(num2)) -> \(MaxMin(num1, num2))")


//pass parameter by value/ reference
var num = 1
SelfIncreatment(&num,1)
num
SelfIncreatment(&num, 10)
num
SelfDecrement(num, 10)
num
