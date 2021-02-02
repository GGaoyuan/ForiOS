//
//  CommandObject.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

protocol CMDCommand: NSObject {
    var requirementGroup: CMDRequirementGroup {get}
    var pageGroup: CMDPageGroup {get}
    var codeGroup: CMDCodeGroup {get}
    
    func execute()
}

extension CMDCommand {
    var requirementGroup: CMDRequirementGroup {
        return CMDRequirementGroup()
    }
    
    var pageGroup: CMDPageGroup {
        return CMDPageGroup()
    }
    
    var codeGroup: CMDCodeGroup {
        return CMDCodeGroup()
    }
}
