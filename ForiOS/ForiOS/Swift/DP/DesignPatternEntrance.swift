//
//  DesignPatternEntrance.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class DesignPatternEntrance: NSObject {
    
    func start() {
        factoryPattern()
    }
    
    func factoryPattern() {
        let factory = MouseFactory()
        
        let className = NSStringFromClass(LenovoMouse.self)
        if let classType = NSClassFromString(className) as? LenovoMouse.Type {
            let a = classType.init()
            print("")
        }
        print("")
    }
}
