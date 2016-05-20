//: Playground - noun: a place where people can play

import UIKit

// chapter 1

// declare a variable called numberoflights of type int that starts out with the value of 4.
let numberOfStoplights: Int = 4

var population: Int
population = 5422

var unemploymentRate: Int = 11

let townName: String = "Knowhere"

// \() is a place for a string literal
let townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) stoplights with \(unemploymentRate)% unemployment rate."
print(townDescription)


// chapter 2

var message: String

if population < 10000 {
    message = "\(population) is huge!"
} else {
    message = "\(population) is small..."
}
print(message)