//
//  SwiftTips.swift
//  iOS
//
//  Created by gaoyuan on 2020/10/15.
//

import UIKit

class SwiftTips: NSObject {
    override init() {
        super.init()
        for i in 0..<3 {
            print(i, terminator: "")
        }
        /// 柯里化
        test_currying()
        
        /// 多元组 (Tuple)
        test_tuple()
        
        /// 方法嵌套
        test_nest()
    }
}

extension SwiftTips {
    func test_nest() -> Int {
        let _ = {
            
        }
        
        
        func test() -> Int {
            return 10
        }
        return test()
    }
}

///多元组 (Tuple)
extension SwiftTips {
    func test_tuple() {
        var num = 10
        
    }
    
    /**
     print(num)
     test_inout(a: &num)
     print(num)
     */
    func test_inout(a: inout Int) {
        a += 10
    }
    
    // inout是让值类型以引用方式传递的意思
    func tuple_swap<T>(a: inout T, b: inout T) {
        (a, b) = (b, a)
    }
}


/// 柯里化： 这是也就是把接受多个参数的方法进行一些变形，使 其更加灵活的方法
extension SwiftTips {
    func test_currying() {
        let addTow = currying_addTo(2)
        let result = addTow(8)
        
        let greaterThan10 = currying_greaterThan(10);
        let _ = greaterThan10(13) // => true
        let _ = greaterThan10(9) // => false
    }
    
    func currying_addTo(_ adder: Int) -> (Int) -> Int {
        return {
            num in
            return adder + num
        }
    }
    
    func currying_greaterThan(_ comparer: Int) -> (Int) -> Bool {
        return { $0 > comparer }
    }
}
