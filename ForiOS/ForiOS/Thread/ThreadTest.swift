//
//  ThreadTest.swift
//  ForiOS
//
//  Created by 高源 on 2020/8/14.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class ThreadTest: NSObject {
    @objc public class func test() {
        let queue = OperationQueue()
//        queue.maxConcurrentOperationCount = 1
        let opA = OperationA()
        let opB = OperationB()
        let opC = OperationC()
        let opD = OperationD()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            print("cancel - \(Thread.current)")
//            queue.cancelAllOperations()
            opA.cancel()
            opB.cancel()
            opC.cancel()
            opD.cancel()
        }
        
        opA.addDependency(opB)
        opA.addDependency(opC)
        opA.addDependency(opD)
        queue.addOperation(opA)
        queue.addOperation(opB)
        queue.addOperation(opC)
        queue.addOperation(opD)
        
        
        
        
        
        
        return
//        print("211111111\(Thread.current)")
        let blockOperation = BlockOperation.init {
            for _ in 0...100 {
//                Thread.sleep(forTimeInterval: 1)
                print("2222222\(Thread.current)")
            }
        }
        blockOperation.addExecutionBlock {
            for _ in 0...100 {
                print("!!!!!!\(Thread.current)")
            }
        }
        blockOperation.addExecutionBlock {
            for _ in 0...100 {
                print("~~~~~~\(Thread.current)")
            }
        }
        blockOperation.addExecutionBlock {
            for _ in 0...100 {
                print("@@@@@\(Thread.current)")
            }
        }
        
//        print("3333333\(Thread.current)")
        blockOperation.start()
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
//            blockOperation.cancel()
//        }
//        print("4444444\(Thread.current)")
    }
}
