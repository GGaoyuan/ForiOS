//
//  LenovoMouse.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class LenovoMouse: NSObject, MouseProtocol {
    var mouseType: MouseType = .business
    var price: Int = 100
    
    required override init() {
        print("init")
    }
    
    func clickMouse() {
        print("点击了联想鼠标，价格\(price)块")
    }
}
