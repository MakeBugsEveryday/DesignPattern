//
//  Builder.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa


// MARK: Interface

/// Pack Action
@objc protocol Packing {
    
    @objc func pack() -> String?
}

/// Food Item
protocol Item {
    
    var name: String? { get }
    var price: Float { get }
    func packing() -> Packing
}

// MARK: Packing Enity
class Wrapper: NSObject, Packing {

    func pack() -> String? {
        
        return "Wrapper"
    }
}

@objc class Bottle: NSObject, Packing {
    
    func pack() -> String? {
        
        return "Bottle"
    }
}

// MARK: Abstract Class
protocol Burger: Item {
    
}

extension Burger {
    
    func packing() -> Packing {
        return Wrapper()
    }
}

protocol Drink: Item {
    
}

extension Drink {
    
    func packing() -> Packing {
        return Bottle()
    }
}

// MARK: Enity Class
class VegBurger: Burger {
    var name: String? {
        return "VegBurger"
    }
    
    var price: Float {
        return 12.0
    }
}

class ChickenBurger: Burger {
    var name: String? {
        return "ChickenBurger"
    }
    
    var price: Float {
        return 10.0
    }
}

class Peisi: Drink {
    var name: String? {
        return "Peisi"
    }
    
    var price: Float {
        return 5.0
    }
}


// MARK: Meal
class Meal: NSObject {
    
    var items: [Item] = [Item]()
    
    
    func addItem(item: Item) {
        
        items.append(item)
    }
    
    func totalCost() -> Float {
        var cost = Float.init()
        for item in items {
            cost += item.price
        }
        return cost
    }
    
    func showItems() {
        var des = ""
        for item in items {
            des += item.name ?? ""
            des += item.packing().pack() ?? ""
            des += "\(item.price)"
            des += "\r\n"
        }
        print(des)
    }
}


// MARK: Meal Builder
class MealBuilder: NSObject {
    
    func prepareVegaMeal() -> Meal {
        let meal = Meal()
        meal.addItem(item: VegBurger())
        meal.addItem(item: Peisi())
        return meal
    }
    
    func prepareNonVegaMeal() -> Meal {
        let meal = Meal()
        meal.addItem(item: ChickenBurger())
        meal.addItem(item: Peisi())
        return meal
    }
}
