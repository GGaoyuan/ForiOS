//
//  LogitechMouse.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class LogitechMouse: NSObject, MouseProtocol {
    var mouseType: MouseType = .game
    var price: Int = 700
    
    required override init() {
        print("init")
    }
    
    func clickMouse() {
        print("点击了罗技鼠标，价格\(price)块")
    }
}
