//
//  CommandInvoker.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

class CMDInvoker: NSObject {
    var command: CMDCommand?
    
    func action() {
        if let kCommand = command {
            kCommand.execute()
        }
    }
}
