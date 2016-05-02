//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let name: String = "Tim McGraw"
let age: Int = 25

var myVariable = 32
let myConstant = 42

let explicitDouble: Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 4
let appleSummary = "I have \(apples) apples."
let orangesSummary = "I have \(oranges) oranges"

let optionalInt: Int? = 9

let actualInt: Int = optionalInt!

var myString = "7"
var possibleInt = Int(myString)
print(possibleInt)

myString = "banana"
possibleInt = Int(myString)
print(possibleInt)

var ratingList = ["Poor", "Fine", "Good"]
ratingList[1] = "Ok"
ratingList

let emptyArray = [String]()

let number = -1
if number < 10 {
    print("The number is small")
} else if number > 100 {
    print("The number is pretty big")
} else {
    print("The number is somewhere between 10 and 100")
}

let individualScores = [74, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalName: String? = "TJ"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, someone!"
}

var optionalHello: String? = "Hello"
if let hello = optionalHello where hello.hasPrefix("H"), let name = optionalName {
    greeting = "\(hello), \(name)"
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log"
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it spicy \(x)"
default:
    let vegetableComment = "Everything tastes better in soup."
}

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += 1
}
print(firstForLoop)

var secondForLoop = 0
for _ in 0...4 {
    secondForLoop += 1
}
print(secondForLoop)

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}

greet("Anna", day: "Tuesday")
greet("Bob ", day: "Friday")
greet("Charlie", day: "a nice day!")

let exampleString = "hello"
if exampleString.hasSuffix("lo") {
    print("ends in lo")
}

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


let namedShape = NamedShape(name: "my named shaped")

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let testSquare = Square(sideLength: 5.2, name: "my test square")
testSquare.area()
testSquare.simpleDescription()

class Circle: NamedShape {
    var radius: Double

    init?(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
        if radius <= 0 {
            return nil
        }
    }

    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)"
    }
}

let successfulCircle = Circle(radius: 4.2, name: "success")
let failedCircle = Circle(radius: -7, name: "failed circle")

class Triangle: NamedShape {
    init(sideLength: Double, name: String) {
        super.init(name: name)
        numberOfSides = 3
    }
}

let shapesArray = [Triangle(sideLength: 1.5, name: "triangle1"),
                   Triangle(sideLength: 1.5, name: "triangle2"),
                   Square(sideLength: 1.5, name: "square1")]
var squares = 0
var triangles = 0
for shape in shapesArray {
    if let square = shape as? Square {
        squares += 1
    } else if let triangle = shape as? Triangle {
        triangles += 1
    }
}
print("\(squares) squares and \(triangles) triangles")

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

protocol ExampleProtocol {
    var simpleDescription: String { get }
    func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

class SimpleClass2: ExampleProtocol {
    var simpleDescription: String = "Another very simple class."
    func adjust() {
        simpleDescription += " Adjusted."
    }
}

var protocolArray: [ExampleProtocol] = [SimpleClass(), SimpleClass(), SimpleClass2()]
for instance in protocolArray {
    instance.adjust()
}
protocolArray

let sampleString: String = "Hello"
let sampleArray: Array = [1, 2, 3.1415, 23, 42]

import UIKit

let redSquare = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
redSquare.backgroundColor = UIColor.redColor()

let numberOfStoplights: Int = 4
var population: Int = 5422
var hasPostOffice: Bool = true

let townName: String = "knowhere"

let townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) stoplights."
print(townDescription)

var message: String

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town!"
} else {
    message = "\(population) is pretty big!"
}

print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}

print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")
print("The maximum value for a 32-bit integer is \(Int32.max).")
print("The minimum value for a 32-bit integer is \(Int32.min).")

print("The maximum UInt value is \(UInt.max).")
print("The minimum UInt value is \(UInt.min).")
print("The maximum UInt32 value is \(UInt32.max).")
print("The minimum UInt32 value is \(UInt32.max).")

let numberOfPages: Int = 10
let numberOfChapters = 3

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -10000

let firstBadValue: UInt = -1
let secondBadValue: Int8 = 20000

