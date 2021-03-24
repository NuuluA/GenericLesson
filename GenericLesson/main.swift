//
//  main.swift
//  GenericLesson
//
//  Created by Арген on 24.03.2021.
//

import Foundation

enum Gender {
    case Man
    case Woman
}

protocol Text {
    var name: String { get set}
    var age: Int { get set }
    
    func description()
}

class People: Text {
    var name: String
    var age: Int
    var gender: Gender
    
    init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func description() {
        print("Gender: \(gender), Name: \(name). Age: \(age)")
    }
}


struct Queue<Type> {
    private var elements = [Type]()
    
    mutating func add(_ people: Type) {
        elements.append(people)
    }
    
    mutating func remove() -> Type? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
    
    
    func filter(predicat: (Type) -> Bool) -> [Type] {
        var array = [Type]()
        
        for element in elements {
            if predicat(element) {
                array.append(element)
            }
        }
        return array
    }
   
}

extension Queue {
    subscript(index: Int) -> Type? {
        guard index > 0 && index < elements.count else { return nil }
        return elements[index]
    }
}

var people = Queue<People>()

people.add(People(name: "Gena", age: 20, gender: .Man))
people.add(People(name: "Argen", age: 26, gender: .Man))
people.add(People(name: "Elena", age: 30, gender: .Woman))
people.add(People(name: "Angelina", age: 28, gender: .Woman))

people.remove()

var filterPeople = people.filter() { element in element.age > 20}

filterPeople.append(People(name: "Zari", age: 21, gender: .Woman))

for i in filterPeople {
    print(i.description())
}

people[1]
people[5]

//MARK: -

struct GenericQueue<T> {

    var queue = [T]()

    mutating func push(_ element: T) {
        queue.append(element)
    }

    mutating func remove() -> T? {

        return queue.isEmpty ? nil : queue.removeFirst()
    }
}
var queueArray = ["one","two","three","four","five"]

var queue = GenericQueue(queue: queueArray)
queue.push("six")

queue.remove()
queue.remove()
queue.remove()
queue.remove()
queue.remove()
queue.remove()
queue.remove()

var queue1 = GenericQueue<Int>()

queue1.push(1)
queue1.push(2)
queue1.push(3)
queue1.push(4)
queue1.push(5)


queue1.remove()
queue1.remove()
queue1.remove()
queue1.remove()
queue1.remove()
queue1.remove()

//MARK: -


protocol Priceble {
    associatedtype DoubPrice
    var price: Double { get set }
}

protocol Weightable {
    var weight: Double { get set }
}

class Meat: Priceble,Weightable {
    
    typealias DoubPrice = Double
    
    var price: DoubPrice
    var weight: DoubPrice
    
    init(price: DoubPrice, weight: DoubPrice) {
        self.price = price
        self.weight = weight
    }
 
}

class Apple: Priceble,Weightable {
    
    typealias DoubPrice = Double
    
    var price: DoubPrice
    var weight: DoubPrice
    
    init(price: DoubPrice, weight: DoubPrice) {
        self.price = price
        self.weight = weight
    }
    
}

struct GenericPrice <T: Priceble> {
    var queue = [T]()
    
    mutating func push(_ element: T) {
        queue.append(element)
    }
    mutating func removeQueue() -> T? {
        guard queue.count > 0 else { return nil }
        return queue.removeFirst()
    }
    
    func totalPrice() -> Double {
        var price = 0.0
        for i in queue {
            price += i.price
        }
        return price
    }
    
}

struct GenericWeight <T: Weightable> {

    var elements = [T]()
    func totalWeight() -> Double {
        var weight = 0.0
        for item in elements {
            weight += item.weight
        }
        return weight
    }

    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func removeQueue() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

var applePrice = GenericPrice<Apple>()
applePrice.push(Apple(price: 23.3, weight: 4))
applePrice.push(Apple(price: 44.5, weight: 6))
applePrice.push(Apple(price: 21.2, weight: 2))
applePrice.totalPrice()

var appleWeight = GenericWeight<Apple>()
appleWeight.push(Apple(price: 23.3, weight: 4))
appleWeight.push(Apple(price: 44.5, weight: 6))
appleWeight.push(Apple(price: 21.2, weight: 2))
appleWeight.totalWeight()

var meatPrice = GenericPrice<Meat>()
meatPrice.push(Meat(price: 300, weight: 2.4))
meatPrice.push(Meat(price: 400, weight: 4.5))
meatPrice.push(Meat(price: 100, weight: 5.5))
meatPrice.push(Meat(price: 350, weight: 3.0))
meatPrice.totalPrice()

var meatWeight = GenericWeight<Meat>()
meatWeight.push(Meat(price: 230, weight: 3.5))
meatWeight.push(Meat(price: 250, weight: 6.5))
meatWeight.push(Meat(price: 280, weight: 2.5))
meatWeight.push(Meat(price: 300, weight: 1.5))
meatWeight.totalWeight()






