import Foundation
//generic function
func swap<T>(_ lhs: inout T, _ rhs: inout T){
    let temp = lhs
    lhs = rhs
    rhs = temp
}

//Type Constraint
public protocol Arithmetiable {
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
}

extension Int: Arithmetiable {
    
}

extension Double: Arithmetiable {
    
}

//generic function with type constraint
func add<T: Arithmetiable>(_ lhs: T, _ rhs: T) -> T {
    return lhs + rhs
}


//generic class
class Stack<Element> {
    private var elements: [Element] = []

    func push(e: Element) {
        self.elements.append(e)
    }
    
    func pop() -> Element? {
        if self.elements.isEmpty {
            return nil
        }
        
        return self.elements.popLast()
    }
    
    func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    func dumpStack() -> [Element] {
        return self.elements
    }
}

add(1, 100)
add(1.2, 100.5)

var a = 1
var b = 100
var s1 = "hello"
var s2 = "world"
print("before swap, a: \(a)     b: \(b)")
print("before swap, s1: \(s1)     s2: \(s2)")
swap(&a, &b)
swap(&s1, &s2)
print("after swap, a: \(a)     b: \(b)")
print("after swap, s1: \(s1)     s2: \(s2)")
print("\n")

var intStack = Stack<Int>()
print("int stack: \(intStack.dumpStack())")
intStack.push(e: 1)
intStack.push(e: 10)
intStack.push(e: 100)
print("int stack: \(intStack.dumpStack())")
intStack.pop()
print("int stack: \(intStack.dumpStack())")

var strStack = Stack<String>()
print("str stack: \(strStack.dumpStack())")
strStack.push(e: "hello")
strStack.push(e: "c++")
strStack.push(e: "oops")
print("str stack: \(strStack.dumpStack())")
strStack.pop()
print("str stack: \(strStack.dumpStack())")



