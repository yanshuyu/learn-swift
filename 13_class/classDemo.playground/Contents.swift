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
but not in any source file outside of that module.
    Private access restricts the use of an entity to the enclosing declaration, and to extensions of that
declaration that are in the same file.
     File-private access restricts the use of an entity to its own defining source file.
 All entities in your code  have a default access level of internal if you don’t specify an explicit access level
 */
class BankAccount {
    private var name: String
    private var id: Int
    internal var balance: Float
    internal var transferRate: Float
    
    init() {
        self.name = ""
        self.id = 0
        self.balance = 0
        self.transferRate = 0.1
    }
    
    init(name: String, id: Int, deposite: Float) {
        self.name = name
        self.id = id
        self.balance = deposite
        self.transferRate = 0.1
    }
    
    func setName(_ name: String) -> Void {
        self.name = name
    }
    
    func setId(_ id: Int) -> Void {
        self.id = id
    }
    
    func setAccount(_ account: BankAccount) -> Void {
        self.name = account.name
        self.id = account.id
        self.balance = account.balance
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func getBalance() -> Float {
        return self.balance
    }
    
    func deposite(_ balance: Float) -> Void {
        self.balance += balance
    }
    
    func withdraw(_ balance: Float) -> Bool {
        let canWithdraw = self.balance >= balance
        if canWithdraw {
            self.balance -= balance
        }
        
        return canWithdraw
    }
    
    func transfer(balance: Float, toAccount: BankAccount) -> Bool {
        let actualBalance = balance * (1 + self.transferRate)
        let canTransfer = self.balance >= actualBalance
        
        if canTransfer {
            self.balance -= actualBalance
            toAccount.deposite(balance)
        }
        
        return canTransfer
    }
    
    
    func toString() -> String {
        return "Account(name:\(self.name), id:\(self.id), transferRate:\(self.transferRate) ,balance:\(self.balance))"
    }
}


class VipBankAccout: BankAccount {
    let overDraw: Float
    
    override init() {
        self.overDraw = 1000
        super.init()
        self.transferRate = 0.01
    }
    
    override init(name: String, id: Int, deposite: Float) {
        self.overDraw = 1000
        super.init(name: name, id: id, deposite: deposite)
        self.transferRate = 0.01
    }
    
    override func withdraw(_ balance: Float) -> Bool {
        let canWithdraw = (self.balance + self.overDraw) >= balance
        if canWithdraw {
           self.balance -= balance
        }
        
        return canWithdraw
    }
    
    override func transfer(balance: Float, toAccount: BankAccount) -> Bool {
        let actualBalance = balance * (1 + self.transferRate)
        let canTransfer = (self.balance + self.overDraw) >= actualBalance
        
        if canTransfer {
            self.balance -= actualBalance
            toAccount.deposite(balance)
        }
        
        return canTransfer
    }
    
    override func toString() -> String {
        return "VipBankAccout(name:\(self.getName), id:\(self.getId()), transferRate:\(self.transferRate) ,balance:\(self.balance))"
    }
    
}



//class instance life cycle
class Node {
    var lable: String
    weak var parent: Node? //cycle refrence
    weak var child: Node?
    
    init() {
        self.lable = ""
        self.parent = nil
        self.child = nil
    }
    
    init(_ lable: String) {
        self.lable = lable
        self.parent = nil
        self.child = nil
    }
    
    deinit {
        print("Node \"\(self.lable)\" is release.")
    }
    
    
    func removeFromParent() -> Void {
        if let unwrapParent = self.parent {
            self.parent = nil
            
            if unwrapParent.getChild() != nil {
                unwrapParent.child = nil
            }
        }
    }
    
    
    func addChild(_ child: Node) -> Void {
        self.child?.removeFromParent()
        child.removeFromParent()
        self.child = child
        child.parent = self
    }
    
    
    func addTo(_ parent: Node) -> Void {
       self.removeFromParent()
       parent.child?.removeFromParent()
       self.parent = parent
       parent.child = self
    }
    
    
    func getChild() -> Node? {
        return self.child
    }

    
    func getParent() -> Node? {
        return self.parent
    }
    
    func toString() -> String {
        let parentLable = self.parent != nil ? self.parent!.lable : "nil"
        let childLable  = self.child != nil ? self.child!.lable : "nil"
        return "Node(lable: \(self.lable), parent: \(parentLable), child: \(childLable))"
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
var vipAccount = VipBankAccout(name: "Li", id: 1243546, deposite: 500)
var account4 = BankAccount(name: "Liu", id: 12343564, deposite: 500)
var p_account: BankAccount? = nil

print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")

account1.deposite(400)
print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")

account2.withdraw(1600)
print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")

account1.transfer(balance: 1000, toAccount: account3)
print("accout1: \(account1.toString())")
print("accout2: \(account2.toString())")
print("account3: \(account3.toString())")


print("accout4: \(account4.toString())")
print("vipAccount: \(vipAccount.toString())")

//polymorphism
p_account = account4
if let p = p_account {
    p.withdraw(600)
}
p_account = vipAccount
if let p = p_account {
    p.withdraw(600)
}
print("accout4: \(account4.toString())")
print("vipAccount: \(vipAccount.toString())")


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


//class instance life cycle
var node_1: Node? = Node("node_1")
var node_2: Node? = Node("node_2")
node_1 = nil
node_2 = nil

var node_a: Node? = Node("node_a")
var node_b: Node? = Node("node_b")
print(node_a!.toString())
print(node_b!.toString())
node_a!.addChild(node_b!)
print(node_a!.toString())
print(node_b!.toString())
//it will lead to memory leak if recycle refrence are not weak refrence
node_a = nil
node_b = nil
