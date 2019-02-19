import Foundation

//declare and assignment
var dic_1: Dictionary<Int, String> = [:]
var dic_2 = Dictionary<Int, String>()
var dic_3 = [70101:"zhang", 70102:"li", 70103:"song"]

var countries = ["JP":"Japan", "CN":"China", "USA":"Americal", "RS":"Russian"]
//accessing dictionary

print("countries: \(countries)")
print("count: \(countries.count)")
print("keys: \(countries.keys)")
print("values: \(countries.values)")

var usa = countries["USA"]
var unwrapUsa = countries["USA"] ?? ""
print("usa: \(usa)")
print("unwrap usa: \(unwrapUsa)")

if let oldVal = countries.updateValue("China(People Of Repbliuc Of China)", forKey: "CN") {
    print("update value for CN: \(countries["CN"] ?? "")")
}

if let oldVal = countries.updateValue("Germany", forKey: "DE"){
    
}
else{
    print("add value for DE: \(countries["DE"] ?? "")")
}

if let val = countries.removeValue(forKey: "JP") {
    print("remove value of JP: \(val)")
}

countries["USA"] = "America(United State Of America)"
print("countries: \(countries)")
print("keys: \(countries.keys)")
print("values: \(countries.values)")


//iterate dictionary
print("iterate countries: { ", terminator: "")
for (countryCode,country) in countries{
    print("\(countryCode):\(country)", terminator: ", ")
}
print(" }")

//reduce function
var keys = countries.reduce("", { return $0 + "、" + $1.key})
var vals = countries.reduce("", { return $0 + "、" + $1.value})
print("keys: \(keys)")
print("values: \(vals)")


//filter function
var countryCodeContainS = countries.filter({ return $0.key.contains("S") })
print("country code contain S: \(countryCodeContainS)")
