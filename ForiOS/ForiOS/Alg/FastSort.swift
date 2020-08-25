//
//  FastSort.swift
//  ForiOS
//
//  Created by 高源 on 2020/8/25.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class FastSort: NSObject {
    
    private var sortArray: [Int]!
    private var lowerSortFinish = false
    /// 快速排序的平均时间复杂度是 O（nlogn），最坏情况下的时间复杂度是 O（n^2）
    @objc func sort(array: [Int]) {
        sortArray = array
        startSort(kLow: 0, kHigh: sortArray.count-1)
        print("result --- \(String(describing: sortArray))")
    }
    
    private func startSort(kLow: Int, kHigh: Int) {
        if kLow > kHigh {
            lowerSortFinish = true
            return
        }
        var low = kLow
        var high = kHigh
        let keyNum = sortArray[low]
        var fromHigh = true
        while low != high {
            print("sort --- \(String(describing: sortArray))")
            let hightNum = sortArray[high]
            let lowNum = sortArray[low]
            if fromHigh {
                if hightNum < keyNum {
                    exchange(low, high)
                    fromHigh = false
                } else {
                    high -= 1
                    fromHigh = true
                }
            } else {
                if lowNum >= keyNum {
                    exchange(low, high)
                    fromHigh = true
                } else {
                    low += 1
                    fromHigh = false
                }
            }
        }
        print(low)
        if !lowerSortFinish {
            startSort(kLow: 0, kHigh: high-1)
        }
        startSort(kLow: high + 1, kHigh: sortArray.count-1)
    }
    
    private func exchange(_ low: Int, _ high: Int) {
        sortArray[high] = sortArray[high] + sortArray[low]
        sortArray[low] = sortArray[high] - sortArray[low]
        sortArray[high] = sortArray[high] - sortArray[low]
    }
    
    
}
