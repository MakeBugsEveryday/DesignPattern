//
//  Bridge.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa

protocol DrawAPI {
    
    func drawLine(radius: Int , x: Int, y: Int)
}

class RedCircle: NSObject, DrawAPI {
    
    func drawLine(radius: Int, x: Int, y: Int) {
        
        print("RedCircle \(#function) radius: \(radius), x: \(x), y:\(y)")
    }
}

class GreenCircle: NSObject, DrawAPI {
    
    func drawLine(radius: Int, x: Int, y: Int) {
        
        print("GreenCircle \(#function) radius: \(radius), x: \(x), y:\(y)")
    }
}

protocol BridgeShape {
    var drawApi: DrawAPI? { get set }
    
    func draw()
}


/// 创建实现了 Shape 接口的实体类。
class BridgeCircle: NSObject, BridgeShape {
    
    var x: Int = 0
    var y: Int = 0
    var radius: Int = 0
    var drawApi: DrawAPI?
    
    init(radius: Int, x: Int, y: Int, drawApi: DrawAPI) {
        super.init()
        self.x = x
        self.y = y
        self.radius = radius
        self.drawApi = drawApi
    }

    func draw() {
        self.drawApi?.drawLine(radius: self.radius, x: self.x, y: self.y)
    }
}
