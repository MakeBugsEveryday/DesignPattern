//
//  Shape.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa

protocol Color {
    func fill()
}

class Blue: NSObject, Color {
    func fill() {
        NSLog("Blue \(#function) has been invoked")
    }
}

class Red: NSObject, Color {
    func fill() {
        NSLog("Red \(#function) has been invoked")
    }
}

protocol AbstractFactory {
    func getColor(name: String) -> Color?
}

class ColorFactory: AbstractFactory {
    func getColor(name: String) -> Color? {
        switch name {
        case "Blue":
            return Blue()
        case "Red":
            return Red()
        default:
            return nil
        }
    }
}

class ColorFactoryCreator: NSObject {
    
    func getFactory(name: String) -> AbstractFactory? {
        switch name {
        case "Color":
            return ColorFactory()
        default:
            return nil
        }
    }
}
