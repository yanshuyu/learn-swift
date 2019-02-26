import Foundation

enum Animals {
    case Lion, Leopard, Elephant, Wolf, Cat, Dog
}


//enum with raw type
enum Weekdays: Int {
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7
}


func printAnimalClassify(_ animal: Animals) -> Void {
    switch animal {
        case Animals.Cat, Animals.Dog:
            print("Pet")
        case .Elephant, .Leopard, .Lion, .Wolf:
            print("Wild")
        default:
            print("unknown")
    }
}


func printWeekdayClassify(_ weekday: Weekdays) -> Void {
    switch weekday {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
        print("day number: \(weekday.rawValue), go to work! 😭")
    case .Saturday, .Sunday:
        print("day number: \(weekday.rawValue)， grid to weekend! ☺️")
    }
}

printWeekdayClassify(.Sunday)
printWeekdayClassify(.Monday)

printAnimalClassify(.Lion)
printAnimalClassify(.Dog)
