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


