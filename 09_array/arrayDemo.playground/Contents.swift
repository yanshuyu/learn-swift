import Foundation

//declare array and assignment
var intergers: Array<Int> = Array<Int>()
var floatNumbers = [Float]()
var months = [String](repeating: "January", count: 12)
var days = ["Monday", "Tuesday","Thursday"]

func getAddResultOfArray(_ interges: [Int]) -> Int {
    var reslut = 0
    for number in intergers {
        reslut += number
    }
    return reslut
}

func getMultiplicationOfArray(intergers: [Int]) -> Int{
    var result = 1
    for number in intergers{
        result *= number
    }
    return result
}

//accessing array
print("days: \(days)")
print("count: \(days.count)")

var fstDay = days.first
var lstDay = days.last
var fstDayByIndex = days[0]
var lstDayByIndex = days[days.count-1]

print("firstday: \(fstDay)")
print("lastday: \(lstDay)")
print("firstday by index: \(fstDayByIndex)")
print("lastday by index: \(lstDayByIndex)")

var minDay = days.min() ?? ""
var maxDay = days.max() ?? ""
print("minday: \(minDay)")
print("maxday: \(maxDay)")

var fstThreeDays = days[0...2]
print("first three  days: \(fstThreeDays)")

//manipulate array
if !days.contains("Friday"){
    days.append("Friday")
    print("after append friday: \(days)")
}

if !days.contains("Wensday"){
    days.insert("Wensday", at: 2)
    print("after insert wensday: \(days)")
    print("index of wensday: \(days.firstIndex(of: "Wensday") ?? -1)")
}

if !days.contains("Saturday") && !days.contains("Sunday"){
    days += ["Saturday", "Sunday"]
    print("after concatenate: \(days)")
}

var sortReslut = days.sorted()
print("sort reslut: \(sortReslut)")
print("after sort: \(days)")

sortReslut = days.sorted(by: { (a: String, b:String) -> Bool in
        return a > b
})
print("sort reslut: \(sortReslut)")
print("after sort: \(days)")


//iterate array
for day in days{
    print(day)
}

for (idx, day) in days.enumerated() {
    print("days[\(idx)] = \(day)")
}


//reduce function
intergers = [1,2,3,4,5,6,7,8,9]
print("result of getAddResultOfArray: \(getAddResultOfArray(intergers))")
print("result of reduce + : \(intergers.reduce(0, { return $0 + $1}))")

print("result of getMultiplicationOfArray: \(getMultiplicationOfArray(intergers: intergers))")
print("result of reduce * : \(intergers.reduce(1, {return $0 * $1}))")

//filter function
var evens = intergers.filter({(number: Int) -> Bool in
    return number % 2 == 0
})
print("evens in integers: \(evens)")

//map function
print("result of map *2 : \(intergers.map({(number: Int) -> Int in  return number * 2}))")
print("integers: \(intergers)")
