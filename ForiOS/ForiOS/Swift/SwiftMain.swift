//
//  SwiftMain.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class SwiftMain: NSObject {
    @objc func enter() {
        let designPatter = DesignPatternEntrance()
        designPatter.start()
    }
}
