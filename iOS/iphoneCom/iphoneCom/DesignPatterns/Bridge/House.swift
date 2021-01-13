//
//  House.swift
//  iphoneCom
//
//  Created by gaoyuan on 2020/12/21.
//

import UIKit

class House: NSObject, ProductProtocol {
    func beProducted() {
        print("生产出来的房子是这样的...")
    }
    
    func beSelled() {
        print("生产出来的房子卖出去了...")
    }
}
