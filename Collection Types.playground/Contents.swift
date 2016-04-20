//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count)")
someInts.append(3)
someInts = []

var threeDoubles = [Double](count:3, repeatedValue:0.0)
var anotherThreeDoubles = Array(count: 3, repeatedValue:2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingLists: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"
shoppingList

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)
shoppingList
firstItem = shoppingList[0]

let apples = shoppingList.removeLast()
shoppingList

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(String(index + 1)): \(value)")
}

// 集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenre: Set = ["Rock", "Classical", "Hip hop"]

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sort() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals == farmAnimals
houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
houseAnimals.isStrictSubsetOf(farmAnimals)
farmAnimals.isStrictSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

// 字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airport = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}


airports["LHR"] = "London"
airports
airports["LHR"] = "London Heathrow"
airports

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple Internation"
airports
airports["APL"] = nil
airports

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

airports.keys.sort()
airports.values.sort()