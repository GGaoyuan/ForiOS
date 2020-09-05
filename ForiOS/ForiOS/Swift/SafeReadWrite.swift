//
//  SafeReadWrite.swift
//  ForiOS
//
//  Created by 高源 on 2020/9/5.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class SafeReadWrite: NSObject {
    private var concurrentQueue = DispatchQueue(label: "SafeReadWrite", attributes: .concurrent)
    private var dic = [String: String]()
    
    
    
    /**
     写操作的时候对key进行了copy, 关于此处的解释(保证字符串不变)
     函数调用者可以自由传递一个NSMutableString的key，并且能够在函数返回后修改它。因此我们必须对传入的字符串使用copy操作以确保函数能够正确地工作。如果传入的字符串不是可变的（也就是正常的NSString类型），调用copy基本上是个空操作。
     
     
     为什么是栅栏函数而不是异步函数或者同步函数
     栅栏函数任务：之前所有的任务执行完毕，并且在它后面的任务开始之前，期间不会有其他的任务执行，这样比较好的促使 写操作一个接一个写 （写写互斥），不会乱！
     为什么不是异步函数？应该很容易分析，毕竟会产生混乱！
     为什么不用同步函数？如果在执行写的时候，如果用sync，那么后面是不会追加上的，得等sync后加入的任务才能继续执行，如果是barrier的话，即使自己没有执行完，那么期间新加的任务还是会加入队列
     */
    func safeObject(obj: String, key: String) {
//        ley kKey = key.copy
        concurrentQueue.async(flags: .barrier) { [weak self] in
            guard let self = self else {return}
            self.dic[key] = obj
        }
    }
    
    
    /**
     考虑到多线程影响是不能用异步函数的，读操作需要立即返回用sync，async的话会先走gcd外面，所以可能出现错误的返回值
     线程2获取：name 线程3获取 age，如果因为异步并发，导致混乱本来读的是name，结果读到了age
     */
    func safeObjForKey(key: String) -> String? {
        var result: String?
        concurrentQueue.sync {
            result = dic[key]
        }
        return result
    }
    
}
