//
//  YYDiskCache.swift
//  ForiOS
//
//  Created by 高源 on 2020/8/17.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class YYDiskCache: NSObject {
    init(path: String) {
        super.init()
        if path.count == 0 {
            assert(true, "Domain获取失败")
        }
    }
}
