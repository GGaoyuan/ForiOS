//
//  YDConstant.swift
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/27.
//

import UIKit

public struct CBConstant {
    public static var isiPhoneX: Bool {
        let result = UIScreen.main.bounds.size.height >= 812
        return result
    }
    
    public static var isiPhoneX1: Bool {
        let result = UIScreen.main.bounds.size.height >= 812
        return result
    }
    
    public static var topBarHeight: CGFloat {
        CGFloat(isiPhoneX ? 88 : 64)
    }
    
    public static var navigationBarHeight: CGFloat {
        topBarHeight
    }
    
    public static var iPhoneHomeAreaHeight: CGFloat {
        CGFloat(isiPhoneX ? 34 : 0)
    }

    public static var tabBarHeight: CGFloat {
        CGFloat(isiPhoneX ? 83 : 49)
    }
    
    public static var toolBarHeight: CGFloat {
        CGFloat(isiPhoneX ? 78 : 44)
    }

    public static var statusBarHeight: CGFloat {
        UIApplication.shared.statusBarFrame.height
    }

    public static var screenSize: CGSize {
        UIScreen.main.bounds.size
    }

    public static var systemVersion: Float {
        (UIDevice.current.systemVersion as NSString).floatValue
    }

    public static var isiOS9: Bool {
        systemVersion >= 9.0
    }

    public static var isiOS10: Bool {
        systemVersion >= 10.0
    }

    public static var isiOS11: Bool {
        systemVersion >= 11.0
    }

    public static var isiOS12: Bool {
        systemVersion >= 12.0
    }

    public static var isiOS13: Bool {
        systemVersion >= 13.0
    }
    
    public static var isiOS14: Bool {
        systemVersion >= 14.0
    }
}

