//
//  CMDChangeCodeCommand.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

class CMDChangeCodeCommand: NSObject, CMDCommand {
    func execute() {
        codeGroup.change()
    }
}
