//
//  YYCache.swift
//  ForiOS
//
//  Created by 高源 on 2020/8/17.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class YYCache: NSObject {
    var name: String = ""
    var diskCache: YYDiskCache!
    var memoryCache: YYMemoryCache!
    
    init(name: String) {
        super.init()
        if let cacheFolder = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first {
            let path = cacheFolder + name
            diskCache = YYDiskCache.init(path: path)
            memoryCache = YYMemoryCache()
            memoryCache.name = name
        } else {
            assert(true, "Domain获取失败")
        }
    }
    
}
