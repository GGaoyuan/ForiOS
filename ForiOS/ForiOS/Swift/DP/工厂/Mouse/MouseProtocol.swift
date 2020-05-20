//
//  MouseProtocol.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

enum MouseType {
    case business
    case game
}

protocol MouseProtocol: NSObjectProtocol {
    var mouseType: MouseType { get set }
    var price: Int {get set}
    func clickMouse()
}

extension MouseProtocol {
    
}
