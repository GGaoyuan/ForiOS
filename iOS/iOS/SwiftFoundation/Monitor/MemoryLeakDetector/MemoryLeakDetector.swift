//
//  MemoryLeak.swift
//  iOS
//
//  Created by gaoyuan on 2020/11/26.
//

import UIKit

extension NSObject: MemoryLeakDetector {
    func willDeinit() {
        weak var weakSelf = self
    }
}


protocol MemoryLeakDetector {
    func willDeinit()
}
extension MemoryLeakDetector {
    func willDeinit2() {
//        weak var a = self
    }
}
