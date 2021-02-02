//
//  CMDAddRequirementCommand.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

class CMDAddRequirementCommand: NSObject, CMDCommand {
    func execute() {
        print(requirementGroup)
        requirementGroup.add()
    }
}
