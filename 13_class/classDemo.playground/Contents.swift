import Foundation

struct Position {
    var x: Float
    var y: Float
    var z: Float
    
    init() {
        self.x = 0
        self.y = 0
        self.z = 0
    }
    
    init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z  = z
    }
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
        self.z = 0
    }
    
}


/*
 access control
    Open access and public access enable entities to be used within any source file from their defining
 module, and also in a source file from another module that imports the defining module.
    internal access enables entities to be used within any source file from their defining module,
but not in any source file outside ofthat module.
    Private access restricts the use of an entity to the enclosing declaration, and to extensions of that
declaration that are in the same file.
     File-private access restricts the use of an entity to its own defining source file.
 All entities in your code  have a default access level of internal if you don’t specify an explicit access level
 */
class BankAccount {
    var name: String
    var id: Int
    private var balance: Float
    
    init() {
        self.name = ""
        self.id = 0
        self.balance = 0
    }
    
    init(name: String, id: Int, deposite: Float) {
        self.name = name
        self.id = id
        self.balance = deposite
    }
    
    func deposite(balance: Float) -> Void {
        self.balance += balance
    }
    
    func withdraw(balance: Float) -> Float {
        let oldBalance = self.balance
        self.balance = abs(self.balance - balance)
        return oldBalance - self.balance
    }
    
    func toString() -> String {
        return "Account(name:\(self.name), id:\(self.id), balance:\(self.balance)"
    }
}


/*
struct  is value type
    A value type is a type whose value is copied when it’s assigned to a variable or constant, 
or when it’s passed to a function.
    all of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and 
dictionaries—are value types, and are implemented as structures behind the scenes.All structures and 
enumerations are value types in Swift.
*/
var pos1 = Position(x: 1, y: 1, z: 0)
var pos2 = pos1

print("pos1: \(pos1)")
print("pos2: \(pos2)")

pos1.z = 1
print("pos1: \(pos1)")
print("pos2: \(pos2)")

/*
if pos1 === pos2 {
    print("pos1 and pos2 are refer to the same memory object.")
}
else{
    print("pos1 and pos2 are refer to different memory object.")
}
 */

/*calss  is refrence type
    reference types are not copied when they are assigned to a variable or constant, 
or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used.
*/
var account1 = BankAccount(name: "Zhang", id: 1244389, deposite: 1100)
var account2 = account1
var account3 = BankAccount()

print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")

account1.deposite(balance: 400)
print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")

account2.withdraw(balance: 1200)
print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")

if account1 === account2 {
    print("account1 and account2 are refer to the same memory object.")
}
else {
    print("account1 and account2 are not refer to the same memory object.")
}

if account1 === account3 {
    print("account1 and account3 are refer to the same memory object.")
}
else {
    print("account1 and account3 are not refer to the same memory object.")
}
