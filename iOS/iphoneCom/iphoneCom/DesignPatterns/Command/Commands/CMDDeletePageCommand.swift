//
//  CMDDeletePageCommand.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

class CMDDeletePageCommand: NSObject, CMDCommand {
    func execute() {
        pageGroup.delete()
    }
}
