//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 闭包表达式
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversed = names.sort({ (s1: String, s2: String) -> Bool in return s1 > s2 })

reversed = names.sort({ s1, s2 in return s1 > s2})

reversed = names.sort({ s1, s2 in s1 > s2})

reversed = names.sort({ $0 > $1 })

reversed = names.sort(>)

// 尾随闭包
reversed = names.sort() { $0 > $1 }

reversed = names.sort { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

// 捕获值
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incremnetBySeven = makeIncrementor(forIncrement: 7)
incremnetBySeven()
incrementByTen()

// 闭包是引用类型
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// 非逃逸闭包
func someFunctionWithNoescapeClosure(@noescape closure: () -> Void ) {
    closure()
}

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoescapeClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// 自动闭包
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serverCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serverCustomer({ customersInLine.removeAtIndex(0)} )

func serverCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serverCustomer(customersInLine.removeAtIndex(0))

var customerProviders: [() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider:() -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.removeAtIndex(0))
collectCustomerProviders(customersInLine.removeAtIndex(0))
print("Collected \(customerProviders.count) closures")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}