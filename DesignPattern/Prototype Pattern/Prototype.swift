//
//  Prototype.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa

protocol ProtoShape: NSCopying {
    
    var id: String? { get set }
    var type: String? { get set }
    
    func draw()
}

extension ProtoShape {
    
    func draw() {
        
    }
}

class ProtoRectangle: NSObject, ProtoShape {
    var id: String?
    var type: String?
    
    func Rectangle() {
        type = "Rectangle"
    }
    
    func draw() {
        
        print("Inside \(self.className) method.")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        
        let shape = ProtoRectangle()
        return shape
    }
}

class ProtoCircle: NSObject, ProtoShape {
    var id: String?
    var type: String?
    
    func Rectangle() {
        type = "Circle"
    }
    
    func draw() {
        
        print("Inside \(self.className) method.")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        
        let shape = ProtoCircle()
        return shape
    }
}

// 创建一个类，从数据库获取实体类，并把它们存储在一个 Hashtable 中
// 每次从原型缓存中load，并copy
class ProtoShapeCache: NSObject {
    private static var shapeCache = [String: ProtoShape]()
    
    static func getShape(des: String) -> ProtoShape? {
        let shape = shapeCache[des]
        
        return shape?.copy(with: nil) as? ProtoShape
    }
    
    static func loadCache() {
        let rect = ProtoRectangle()
        rect.id = "rect"
        rect.type = "rect"
        self.shapeCache["rect"] = rect
        
        let circle = ProtoCircle()
        circle.id = "circle"
        circle.type = "circle"
        self.shapeCache["circle"] = circle
    }
}
