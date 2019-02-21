import Foundation

var bigCityInUsa: Set<String> = ["New York", "San Franciso", "Washington", "Seattle", "Chicago"]
var bigCityInChina: Set<String> = []

bigCityInChina.insert("Beijing")
bigCityInChina.insert("Shanghai")
bigCityInChina.insert("Shenzhen")
bigCityInChina.insert("Guangzhou")
bigCityInChina.insert("Hk")
print("\(bigCityInUsa.count) cities in usa: \(bigCityInUsa)")
print("\(bigCityInChina.count) cities in china: \(bigCityInChina)")

if !bigCityInChina.contains("Taibei"){
    bigCityInChina.insert("Taibei")
    print("after insert taibei, cities in china: \(bigCityInChina)")
}


print("cities in usa or china(union set): \(bigCityInUsa.union(bigCityInChina))")
print("cities in usa and china(intersect set): \(bigCityInUsa.intersection(bigCityInChina))")
print("cities only in china(difference set): \(bigCityInChina.subtracting(bigCityInUsa))")
