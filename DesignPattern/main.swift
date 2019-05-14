//
//  main.swift
//  DesignPattern
//
//  Created by 梁宪松 on 2019/4/28.
//  Copyright © 2019 madao. All rights reserved.
//

import Foundation


print("Hello, World!")

var set1 = NSMutableSet.init(array: ["str1", "str2"])
var set2 = NSMutableSet.init(array: ["str1", "str2" , "str3"])

var result = set2.minus(set1 as! Set<AnyHashable>)
print(set2)
