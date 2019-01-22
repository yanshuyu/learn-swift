import UIKit

//comment syntax
// this is one line comment
/*
 these are multiple lines comments
 comment line 1
 comment line 2
 ..,
 */

//variable and contant
var myInt_1: Int = 1
var myInt_2 = 100
var myInt_3 = myInt_1 + myInt_2

var myFloat_1: Float = 1.123456789987654321
var myDouble_1: Double = 1.123456789987654321


var myStr_1:String = "hello"
var myStr_2 = "switf"
var myStr_3 = myStr_1 + " " + myStr_2

let PI: Float = 3.14
//error, can't assign to a constant
//PI = 3.14159

//declare multiple variable
var a = 1, b = 3.14, c = "hello world"
print(a, b, c)

//numeric limit
print("min uint: ", UInt.min)
print("max uint: ", UInt.max)
print("min int: ", Int.min)
print("max int: ", Int.max)


//
var decimalVal = 10
var binaryVal = 0b110
var octalVal = 0o12
var hexVal = 0x1a

print("decimal 10 = ", decimalVal)
print("binary 0b110 = ", binaryVal)
print("octal 0o12 = ", octalVal)
print("hex 0x1a = ", hexVal)

//more reable
let onemillion = 1_000_000
print("one million = ", onemillion)




