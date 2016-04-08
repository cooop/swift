//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//赋值运算符
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

//算术运算符
1 + 2
5 - 3
2 * 3
10.0 / 2.5

"hello, " + "world"

//求余运算符
9 % 4
-9 % 4
8 % 2.5

// 自增自减运算
var i = 0
++i

var a1 = 0
let b1 = ++a1
let c = a1++

//一元负号运算符
let three = 3
let minusThree = -three
let plusThree = -minusThree

//一元正号运算符
let minusSix = -6
let alsoMinusSix = +minusSix

//组合赋值运算符
var a2 = 1
a2 += 2

//比较运算符
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

//(1, "zebra") < (2, "apple")
//(3, "apple") < (3, "bird")
//(4, "dog") == (4, "dog")

//三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//空合运算符
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//区间运算符
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第\(i + 1)个人叫\(names[i])")
}

//逻辑运算
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetainScan = false
if enteredDoorCode && passedRetainScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

if enteredDoorCode && passedRetainScan || hasDoorKey || knowOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

if (enteredDoorCode && passedRetainScan) || hasDoorKey || knowOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}