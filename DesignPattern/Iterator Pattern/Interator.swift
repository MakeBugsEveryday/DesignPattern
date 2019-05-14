//
//  Interator.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/5/8.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa

/*
 迭代器模式
 迭代器模式（Iterator Pattern）是 Java 和 .Net 编程环境中非常常用的设计模式。这种模式用于顺序访问集合对象的元素，不需要知道集合对象的底层表示。
 迭代器模式属于行为型模式。
 介绍
 意图：提供一种方法顺序访问一个聚合对象中各个元素, 而又无须暴露该对象的内部表示。
 主要解决：不同的方式来遍历整个整合对象。
 何时使用：遍历一个聚合对象。
 如何解决：把在元素之间游走的责任交给迭代器，而不是聚合对象。
 关键代码：定义接口：hasNext, next。
 应用实例：JAVA 中的 iterator。
 优点： 1、它支持以不同的方式遍历一个聚合对象。 2、迭代器简化了聚合类。 3、在同一个聚合上可以有多个遍历。 4、在迭代器模式中，增加新的聚合类和迭代器类都很方便，无须修改原有代码。
 缺点：由于迭代器模式将存储数据和遍历数据的职责分离，增加新的聚合类需要对应增加新的迭代器类，类的个数成对增加，这在一定程度上增加了系统的复杂性。
 使用场景： 1、访问一个聚合对象的内容而无须暴露它的内部表示。 2、需要为聚合对象提供多种遍历方式。 3、为遍历不同的聚合结构提供一个统一的接口。
 注意事项：迭代器模式就是分离了集合对象的遍历行为，抽象出一个迭代器类来负责，这样既可以做到不暴露集合的内部结构，又可让外部代码透明地访问集合内部的数据。
 */

fileprivate protocol IteratorProtocol {
    func hasNext() -> Bool
    func next() -> NSObject?
}

fileprivate protocol ContainerProtocol {
    func iterator() -> IteratorProtocol
}

fileprivate class NameRepository: ContainerProtocol {

    
    var names = ["Jhon", "Mary", "Mike", "James"]
    
    
    // 内部类
    public class NameIterator: NSObject, IteratorProtocol {
        var index: Int = 0
        var nameRepository: NameRepository?
        
        func hasNext() -> Bool {
            guard let nameR = self.nameRepository else {
                return false
            }
            
            if nameR.names.count < index  {
                
                return true
            }
            
            return false
        }
        
        func next() -> NSObject? {
            
            guard let nameR = self.nameRepository else {
                return nil
            }
            
            if hasNext() {
                let str = nameR.names[self.index]
                self.index += 1
                return str as NSObject
            }
            
            return nil
        }
    }

    func iterator() -> IteratorProtocol {
        
        return NameIterator()
    }
}
