//
//  POPTest.swift
//  iOS
//
//  Created by gaoyuan on 2020/10/15.
//

import UIKit
import Kingfisher
class POPTest: NSObject {
    override init() {
        super.init()
        
        let cat = POPCat()
        cat.eatSth()
    }
}

class POPCat: NSObject, POPAnimal {
    var name: String = ""
    
//    var name: String = ""
    func test() {
        name = "123"
    }
    
}

protocol POPAlive: NSObjectProtocol {
    var name: String {get set}
}


protocol POPAnimal: NSObjectProtocol {
    var name: String {get set}
    func eatSth()
}
extension POPAnimal {
    func eatSth() {
        meat()
    }
    private func meat() {
        print("\(self.name) eat meat")
    }
}


