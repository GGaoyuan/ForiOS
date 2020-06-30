//
//  FPSMonitor.swift
//  ForiOS
//
//  Created by gaoyuan on 2020/6/30.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class FPSMonitor: NSObject {
    @objc public static let monitor: FPSMonitor = {
        let monitor = FPSMonitor()
        monitor.fpsThread = Thread.init(target: monitor, selector: #selector(fpsMonitorThreadAlive), object: nil)
        monitor.fpsThread.start()
        return monitor
    }()
    @objc public var fpsThread: Thread!
    
    @objc static public func start() {
        print(FPSMonitor.monitor)
    }
    
    @objc private func fpsMonitorThreadAlive() {
        autoreleasepool {
            Thread.current.name = "fpsMonitorThread"
            RunLoop.current.add(NSMachPort.init(), forMode: .common)
            RunLoop.current.run()
        }
    }
}
