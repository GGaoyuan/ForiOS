//
//  GYOperation.swift
//  ForiOS
//
//  Created by 高源 on 2020/8/14.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit


class OperationA: Operation {
    override func main() {
        if !isCancelled {
            for i in 0..<10 {
                print("A - \(i) \(Thread.current), \(isFinished), \(isCancelled)")
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
}

class OperationB: Operation {
    override func main() {
        if !isCancelled {
            for i in 0..<10 {
                print("B - \(i) \(Thread.current), \(isFinished), \(isCancelled)")
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
}

class OperationC: Operation {
    override func main() {
        if !isCancelled {
            for i in 0..<10 {
                print("C - \(i) \(Thread.current), \(isFinished), \(isCancelled)")
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
}

class OperationD: Operation {
    override func main() {
        if !isCancelled {
            for i in 0..<10 {
                print("D - \(i) \(Thread.current), \(isFinished), \(isCancelled)")
                Thread.sleep(forTimeInterval: 0.5)
            }
        }
    }
}
