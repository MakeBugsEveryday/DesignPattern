//
//  Filter.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Cocoa

/*
 过滤器模式（Filter Pattern）或标准模式（Criteria Pattern）是一种设计模式，这种模式允许开发人员使用不同的标准来过滤一组对象，通过逻辑运算以解耦的方式把它们连接起来。这种类型的设计模式属于结构型模式，它结合多个标准来获得单一标准。
 */

class FilterPerson: NSObject {
    var name: String?
    var gender: String?
    var maritalStatus: String?
    
    init(name: String, gender: String, status maritalStatus: String) {
        super.init()
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStatus
    }
}

/// 为标准（Criteria）创建一个接口
protocol FilterCriteria {
    
    func meetCriteria(persons: [FilterPerson]) -> [FilterPerson]
}

/// 创建实现了 Criteria 接口的实体类。
class FilterCriteriaMale: FilterCriteria {
    
    func meetCriteria(persons: [FilterPerson]) -> [FilterPerson] {
        
        var pArr = [FilterPerson]()
        for person in persons {
            
            if (person.gender == "MALE") {
                pArr.append(person)
            }
        }
        return pArr
    }
}

class FilterCriteriaFemale: FilterCriteria {
    
    func meetCriteria(persons: [FilterPerson]) -> [FilterPerson] {
        
        var pArr = [FilterPerson]()
        for person in persons {
            
            if (person.gender == "FEMALE") {
                pArr.append(person)
            }
        }
        return pArr
    }
}

class FilterCriteriaSingle: FilterCriteria {
    
    func meetCriteria(persons: [FilterPerson]) -> [FilterPerson] {
        
        var pArr = [FilterPerson]()
        for person in persons {
            
            if (person.gender == "SINGLE") {
                pArr.append(person)
            }
        }
        return pArr
    }
}

class FilterCriteriaAnd: NSObject, FilterCriteria {
    
    var criteria: FilterCriteria?
    var otherCriteria: FilterCriteria?
    
    init(criteria: FilterCriteria, otherCriteria: FilterCriteria) {
        super.init()
        self.criteria = criteria
        self.otherCriteria = otherCriteria

    }
    
    func meetCriteria(persons: [FilterPerson]) -> [FilterPerson] {
        
        let meetedCriteria = self.criteria?.meetCriteria(persons: persons)
        guard let meeted = meetedCriteria,
            let otherC = self.otherCriteria else {
            return [FilterPerson]()
        }
        return otherC.meetCriteria(persons:meeted)
    }
}
