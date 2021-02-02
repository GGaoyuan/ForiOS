//
//  YDMemoryMonitor.swift
//  iOS
//
//  Created by gaoyuan on 2020/12/18.
//

import UIKit

class YDMemoryMonitor: NSObject {
    
    static let monitor = YDMemoryMonitor()
    private var memoryProfiler = FBMemoryProfiler()
    
    func startMemoryMonitor() {
        FBAllocationTrackerManager.shared()?.startTrackingAllocations()
        FBAllocationTrackerManager.shared()?.enableGenerations()
        
        memoryProfiler = FBMemoryProfiler()
        memoryProfiler.enable()
    }
    
    
    
}
