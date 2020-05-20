//
//  HPMouse.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class HPMouse: NSObject, MouseProtocol {
    var mouseType: MouseType = .business
    var price: Int = 150
    
    required override init() {
        print("init")
    }
    
    func clickMouse() {
        print("点击了惠普鼠标，价格\(price)块")
    }
}
