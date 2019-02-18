import Foundation

//closure is a function without name(anonymous function)
var criterionFunc: (Int, Int) -> Bool = { (a: Int, b: Int) -> Bool in
    return false
}

//version-1
criterionFunc = { (a: Int, b: Int) -> Bool in
    var ascending = false
    if a > b {
        print("ascending order")
        ascending = true
    }
    else if a < b {
        print("deascending order")
        ascending = false
    }
    else {
        print("equality, no order")
        ascending = false
    }
    return ascending
}


//version-2
criterionFunc = { (a: Int, b: Int)  in
    var ascending = false
    if a > b {
        print("ascending order")
        ascending = true
    }
    else if a < b {
        print("deascending order")
        ascending = false
    }
    else {
        print("equality, no order")
        ascending = false
    }
    return ascending
}


//version-3
criterionFunc = {
    var ascending = false
    //$0 first arg
    //$1 second arg
    if $0 > $1 {
        print("ascending order")
        ascending = true
    }
    else if $0 < $1 {
        print("deascending order")
        ascending = false
    }
    else {
        print("equality, no order")
        ascending = false
    }
    return ascending
}

//capture vaule ouside closure
func closureCallCounter() -> ((String) -> Int){
    var counter = 0
    var theClosure: (String) -> Int = {
        counter += 1
        print("\($0): \(counter)")
        return counter
    }
    
    return theClosure
}

let closureWithoutArgWithoutReturnValue: () -> Void  = {
    print("This is a closure without arguments and return values")
}



criterionFunc(1,2)
criterionFunc(2,1)
criterionFunc(1,1)
closureWithoutArgWithoutReturnValue()

let closureCounter_1 = closureCallCounter()
closureCounter_1("closureCounter_1")
closureCounter_1("closureCounter_1")

let closureConter_2 = closureCallCounter()
closureConter_2("closureConter_2")
closureConter_2("closureConter_2")
closureConter_2("closureConter_2")
closureConter_2("closureConter_2")



