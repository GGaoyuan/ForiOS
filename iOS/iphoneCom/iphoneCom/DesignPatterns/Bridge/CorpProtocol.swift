//
//  CorpProtocol.swift
//  iphoneCom
//
//  Created by gaoyuan on 2020/12/21.
//

import UIKit

protocol CorpProtocol: NSObjectProtocol {
    static func Corp<T: ProductProtocol, A: CorpProtocol>(product: T) -> A
    func makeMoney()
    var product: ProductProtocol {get}
    
    func test(T: ProductProtocol)
}

extension CorpProtocol {
    
    
    
//    static func Corp<T>(product: T) -> T {
//        let a = T()
//        return a
//    }
//
//    func makeMoney() {
//
//    }
}


//class HouseCorp: NSObject, CorpProtocol {
//    static func Corp<T, A>(product: T) -> A where T : ProductProtocol, A : CorpProtocol {
//
//    }
//
//    func makeMoney() {
//
//    }
//
//    var product: ProductProtocol
//
//
//}
