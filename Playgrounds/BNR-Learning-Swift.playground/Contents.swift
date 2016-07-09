//: Playground - noun: a place where people can play

import UIKit

// Chapter 1

var str = "Hello, playground"
str += "!"
print(str)

let firstName : String = "TJ"
var lastName : String = "Maynes"
print("\(firstName) \(lastName)")

// Chapter 2

// declare a variable called numberoflights of type int that starts out with the value of 4.
let numberOfStoplights: Int = 4

var population: Int = 5422
var unemploymentRate: Int = 11

let townName: String = "Knowhere"

// \() is a place for a string literal
let townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) stoplights with \(unemploymentRate)% unemployment rate."
print(townDescription)

var message: String = population > 10000 ? "\(population) is huge!" : "\(population) is small..."

print(message)

var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town!"
} else if population >= 50000 && population < 100000 {
    message = "\(population) is a large town!"
} else {
    message = "\(population) is pretty big!"
}

if !hasPostOffice {
    print("Where do we buy stamps!")
}

// Chapter 4

print("The maximum Int value is \(Int.max)")
print("The minimum Int value is \(Int.min)")

print("The maximum 32-bit Int value is \(Int32.max)")
print("The minimum 32-bit Int value is \(Int32.min)")

print("The maximum U-Int value is \(UInt.max)")
print("The minimum U-Int value is \(UInt.min)")

print("The maximum 32-bit U-Int value is \(UInt32.max)")
print("The minimum 32-bit U-Int value is \(UInt32.min)")

let numberOfPages: Int = 10
let numberOfChapters = 3

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

print(10 + 20)
print(30 - 5 * 2)
print((5 * 6) / 2)
print(-11 % 3)

let y: Int8 = 120
let z = y &+ 10

let a: Int16 = 200
let b: Int8 = 50
let c = a + Int16(b)

let d1 = 1.1
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 11.4)
print(11.0 / 3.0)

if d1 == d2 {
    print("d1 and d2 are the same")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
}

// Chapter 5

var statusCode: Int = 418
var errorString: String = "The request failed with the error:"
switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
case 204:
    errorString += " Successful but no content"
case 300...307:
    errorString += " Redirection, \(statusCode)."
case 400...417:
    errorString += " Client error, \(statusCode)."
case 500...505:
    errorString += " Server error, \(statusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString = "\(unknownCode) is not a known error code"
default:
    errorString = "\(statusCode) is not a known error code."
}

let error = (code: statusCode, error: errorString)
print(error.code)
print(error.error)

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):
    print("First item not found")
case (_, 404):
    print("Second item not found")
default:
    print("All items found")
}

let age: Int = 25
if case 18...35 = age where age >= 21 {
    print("In cool demographic and of drinking age")
}

let point = (x: 1, y: 4)
switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q1 where (point.x < 0) && (point.y > 0):
    print("\(q1) is in quadrant 2")
case let q1 where (point.x < 0) && (point.y < 0):
    print("\(q1) is in quadrant 3")
case let q1 where (point.x > 0) && (point.y < 0):
    print("\(q1) is in quadrant 4")
case (_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered")
}

// Chapter 6

var myFirstInt: Int = 0
for _ in 1...5 {
    myFirstInt += 1
    print(myFirstInt)
}

for case let i in 1...100 where i % 3 == 0 {
    //print(i)
}

var i = 1
while i > 6 {
    myFirstInt += 1
    print(myFirstInt)
}

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    if spaceDemonsDestroyed == 200 {
        print("You beat the game")
        break
    }

    if blastersOverheating {
        print("Blasters are overheated")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }

    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }

    print("Fire blasters!")
    blasterFireCount += 1
    spaceDemonsDestroyed += 1
}

for _ in 1...5 {
    for case let i in 1...100 where i % 2 == 0 {
        print(i)
    }
}

// Chapter 7
