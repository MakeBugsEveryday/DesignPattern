//
//  Shape.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa

protocol Shape {
    func draw()
}

class Rectangle: NSObject, Shape {

    func draw() {
    
        NSLog("Rectangle \(#function) has been invoked")
    }
}

class Square: NSObject, Shape {
    
    func draw() {
        
        NSLog("Square \(#function) has been invoked")
    }
}

class Circle: NSObject, Shape {
    
    func draw() {
        
        NSLog("Circle \(#function) has been invoked")
    }
}

enum ShapeType {
    case rectangle
    case square
    case circle
}

class ShapeFactory: NSObject {
    
    public func getShape(shape: ShapeType) -> Shape? {
        
        switch shape {
        case .rectangle:
            return Rectangle()
        case .square:
            return Square()
        case .circle:
            return Circle()
        }
    }
}
