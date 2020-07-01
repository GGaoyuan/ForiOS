//
//  AsyncView.swift
//  ForiOS
//
//  Created by gaoyuan on 2020/7/1.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class AsyncLabel: UIView {
    var text: String = ""
    var font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    var textColor: UIColor = .black
    
    override func display(_ layer: CALayer) {
        let size = bounds.size
        let scale = UIScreen.main.scale
        
    }
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        
    }
}
