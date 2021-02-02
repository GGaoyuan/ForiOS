//
//  CommandEntrance.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

class CommandEntrance: NSObject {
    static func main() {
        let invoker = CMDInvoker()
        invoker.command = CMDAddRequirementCommand()
        invoker.action()
        
        invoker.command = CMDDeletePageCommand()
        invoker.action()
        
        invoker.command = CMDChangeCodeCommand()
        invoker.action()
    }
    
    static func simpleMain() {
        let addRequirementCommand = CMDAddRequirementCommand()
        addRequirementCommand.execute()
        addRequirementCommand.execute()
        addRequirementCommand.execute()
        addRequirementCommand.execute()
        addRequirementCommand.execute()
        
        let deletePageCommand = CMDDeletePageCommand()
        deletePageCommand.execute()
        
        let changeCodeCommand = CMDChangeCodeCommand()
        changeCodeCommand.execute()
    }
    
}
